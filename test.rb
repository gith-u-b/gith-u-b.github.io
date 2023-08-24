# 1.redis意外断电重启后，会像MemoryCached一样丢失所有数据吗？
redis意外断电重启后，会像MemoryCached一样丢失所有数据
但是redis是有多种持久化机制的，可以做持久化，这样可以保证再重启的时候不丢失数据
有两种：快照(把内存的数据生成一个快照文件)和AOF（把redis写的操作存在日志中）

# 2.单体类的超类是单件类吗
不是，他们俩是两个不同的概念


# 3.ActiveSupport、Concern、元编程


# 1.编写一个示例描述ActiveSupport::Concern的用法
module ActiveAble
	extend ActiveSupport::Concern

	included do |base|
		scope :active, -> { where(is_active: true) }
	end
end

class Post < AcitveRecord::Base
	include ActiveAble
end

class Comment < AcitveRecord::Base
	include ActiveAble
end

# Post.active
# Comment.active


# 2.请说明ActiveSupport库加入Concern模块是为了解决什么问题?
1.重复的代码放在一个concern中，供多个model使用，代码简洁化
2.提高了代码的可读性，方便代码进行重构


# 4.HTTP 协议有哪些方法可用？
get,post,put,delete,head,options,trace


# 5.编程题


# 1. The Supermarket Queue
# 计算多个顾客在 n 个队列中排队所需的总时间
def queue_time(customers, n)
queues = [0] * n

customers.each do |count|
min_queue_index = queues.each_with_index.min[1]
queues[min_queue_index] += count
end

queues.max
end

# 2.统计1到N的所有数字中包含数字“1”的个数，例如1到13一共有5个数字包含1，分别是1，10，11，12，13，请实现方法完成，要求不能使用任何字符串相关的方法 
def countOnes(a, b)
count = 0

(a..b).each do |number|
while number > 0
if number % 10 == 1
count += 1
end
number = number / 10
end
end

return count
end



def countOnes(a, b)
count = 0

(a..b).each do |number|
while number > 0
if number % 10 == 1
count += 1
end
number = number / 10
end

end

return count
end


# 二： 返回指定标签的文章
select a.id, a.title, string_agg(t.name, ',') from articles a inner join tags t on a.id = t.article_id 
where a.id in (select article_id from tags where t.name = 'AAA')
group by a.id, a.title