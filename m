Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A258F6CFF59
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516540.800826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pho7i-0004TZ-LD; Thu, 30 Mar 2023 08:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516540.800826; Thu, 30 Mar 2023 08:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pho7i-0004Qo-HB; Thu, 30 Mar 2023 08:59:10 +0000
Received: by outflank-mailman (input) for mailman id 516540;
 Thu, 30 Mar 2023 08:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pho0H-0005Qp-PP
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:51:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eeb8b88-ced8-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 10:51:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 949FE21B1B;
 Thu, 30 Mar 2023 08:51:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 623DE138FF;
 Thu, 30 Mar 2023 08:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ow+nFo9NJWSMIwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:51:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0eeb8b88-ced8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fx98eisytmRk+NNDmkl4p0Eqn//P5VGBs6rsYeEk9Xk=;
	b=ssDB9Qs3USwxA5Beb+gvk1chdy8+gctEL9x4W3AnsW04+KkBm5oLUpaQ6w49zbVznXVoGj
	ocH2bCmoIge09zeuobVwMfJfUSwv5HY70Uo5wGCo7lqeq0GAGGWYtkEaxN+PALPZezMaNZ
	pQZDlhvtS7X3Sq7Uyg6q+6Gia4EXYpY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 13/13] tools/xenstore: remove unused stuff from list.h
Date: Thu, 30 Mar 2023 10:50:11 +0200
Message-Id: <20230330085011.9170-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the hlist devines/functions and the rcu related functions from
tools/xenstore/list.h, as they are not used.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/list.h | 227 ------------------------------------------
 1 file changed, 227 deletions(-)

diff --git a/tools/xenstore/list.h b/tools/xenstore/list.h
index a464a38b61..d722a91220 100644
--- a/tools/xenstore/list.h
+++ b/tools/xenstore/list.h
@@ -88,48 +88,6 @@ static inline void list_add_tail(struct list_head *new, struct list_head *head)
 	__list_add(new, head->prev, head);
 }
 
-/*
- * Insert a new entry between two known consecutive entries. 
- *
- * This is only for internal list manipulation where we know
- * the prev/next entries already!
- */
-static __inline__ void __list_add_rcu(struct list_head * new,
-	struct list_head * prev,
-	struct list_head * next)
-{
-	new->next = next;
-	new->prev = prev;
-	next->prev = new;
-	prev->next = new;
-}
-
-/**
- * list_add_rcu - add a new entry to rcu-protected list
- * @new: new entry to be added
- * @head: list head to add it after
- *
- * Insert a new entry after the specified head.
- * This is good for implementing stacks.
- */
-static __inline__ void list_add_rcu(struct list_head *new, struct list_head *head)
-{
-	__list_add_rcu(new, head, head->next);
-}
-
-/**
- * list_add_tail_rcu - add a new entry to rcu-protected list
- * @new: new entry to be added
- * @head: list head to add it before
- *
- * Insert a new entry before the specified head.
- * This is useful for implementing queues.
- */
-static __inline__ void list_add_tail_rcu(struct list_head *new, struct list_head *head)
-{
-	__list_add_rcu(new, head->prev, head);
-}
-
 /*
  * Delete a list entry by making the prev/next entries
  * point to each other.
@@ -156,23 +114,6 @@ static inline void list_del(struct list_head *entry)
 	entry->prev = LIST_POISON2;
 }
 
-/**
- * list_del_rcu - deletes entry from list without re-initialization
- * @entry: the element to delete from the list.
- *
- * Note: list_empty on entry does not return true after this, 
- * the entry is in an undefined state. It is useful for RCU based
- * lockfree traversal.
- *
- * In particular, it means that we can not poison the forward 
- * pointers that may still be used for walking the list.
- */
-static inline void list_del_rcu(struct list_head *entry)
-{
-	__list_del(entry->prev, entry->next);
-	entry->prev = LIST_POISON2;
-}
-
 /**
  * list_del_init - deletes entry from list and reinitialize it.
  * @entry: the element to delete from the list.
@@ -339,172 +280,4 @@ static inline void list_splice_init(struct list_head *list,
 	     &pos->member != (head); 					\
 	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
 
-
-/* 
- * Double linked lists with a single pointer list head. 
- * Mostly useful for hash tables where the two pointer list head is 
- * too wasteful.
- * You lose the ability to access the tail in O(1).
- */ 
-
-struct hlist_head { 
-	struct hlist_node *first; 
-}; 
-
-struct hlist_node { 
-	struct hlist_node *next, **pprev; 
-}; 
-
-#define HLIST_HEAD_INIT { .first = NULL } 
-#define HLIST_HEAD(name) struct hlist_head name = {  .first = NULL }
-#define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL) 
-#define INIT_HLIST_NODE(ptr) ((ptr)->next = NULL, (ptr)->pprev = NULL)
-
-static __inline__ int hlist_unhashed(struct hlist_node *h) 
-{ 
-	return !h->pprev;
-} 
-
-static __inline__ int hlist_empty(struct hlist_head *h) 
-{ 
-	return !h->first;
-} 
-
-static __inline__ void __hlist_del(struct hlist_node *n) 
-{
-	struct hlist_node *next = n->next;
-	struct hlist_node **pprev = n->pprev;
-	*pprev = next;  
-	if (next) 
-		next->pprev = pprev;
-}  
-
-static __inline__ void hlist_del(struct hlist_node *n)
-{
-	__hlist_del(n);
-	n->next = LIST_POISON1;
-	n->pprev = LIST_POISON2;
-}
-
-/**
- * hlist_del_rcu - deletes entry from hash list without re-initialization
- * @entry: the element to delete from the hash list.
- *
- * Note: list_unhashed() on entry does not return true after this, 
- * the entry is in an undefined state. It is useful for RCU based
- * lockfree traversal.
- *
- * In particular, it means that we can not poison the forward
- * pointers that may still be used for walking the hash list.
- */
-static inline void hlist_del_rcu(struct hlist_node *n)
-{
-	__hlist_del(n);
-	n->pprev = LIST_POISON2;
-}
-
-static __inline__ void hlist_del_init(struct hlist_node *n) 
-{
-	if (n->pprev)  {
-		__hlist_del(n);
-		INIT_HLIST_NODE(n);
-	}
-}  
-
-#define hlist_del_rcu_init hlist_del_init
-
-static __inline__ void hlist_add_head(struct hlist_node *n, struct hlist_head *h) 
-{ 
-	struct hlist_node *first = h->first;
-	n->next = first; 
-	if (first) 
-		first->pprev = &n->next;
-	h->first = n; 
-	n->pprev = &h->first; 
-} 
-
-static __inline__ void hlist_add_head_rcu(struct hlist_node *n, struct hlist_head *h) 
-{ 
-	struct hlist_node *first = h->first;
-	n->next = first;
-	n->pprev = &h->first; 
-	if (first) 
-		first->pprev = &n->next;
-	h->first = n; 
-} 
-
-/* next must be != NULL */
-static __inline__ void hlist_add_before(struct hlist_node *n, struct hlist_node *next)
-{
-	n->pprev = next->pprev;
-	n->next = next; 
-	next->pprev = &n->next; 
-	*(n->pprev) = n;
-}
-
-static __inline__ void hlist_add_after(struct hlist_node *n,
-				       struct hlist_node *next)
-{
-	next->next	= n->next;
-	*(next->pprev)	= n;
-	n->next		= next;
-}
-
-#define hlist_entry(ptr, type, member) container_of(ptr,type,member)
-
-/* Cannot easily do prefetch unfortunately */
-#define hlist_for_each(pos, head) \
-	for (pos = (head)->first; pos; pos = pos->next) 
-
-#define hlist_for_each_safe(pos, n, head) \
-	for (pos = (head)->first; n = pos ? pos->next : 0, pos; \
-	     pos = n)
-
-/**
- * hlist_for_each_entry	- iterate over list of given type
- * @tpos:	the type * to use as a loop counter.
- * @pos:	the &struct hlist_node to use as a loop counter.
- * @head:	the head for your list.
- * @member:	the name of the hlist_node within the struct.
- */
-#define hlist_for_each_entry(tpos, pos, head, member)			 \
-	for (pos = (head)->first;					 \
-	     pos && ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1;}); \
-	     pos = pos->next)
-
-/**
- * hlist_for_each_entry_continue - iterate over a hlist continuing after existing point
- * @tpos:	the type * to use as a loop counter.
- * @pos:	the &struct hlist_node to use as a loop counter.
- * @member:	the name of the hlist_node within the struct.
- */
-#define hlist_for_each_entry_continue(tpos, pos, member)		 \
-	for (pos = (pos)->next;						 \
-	     pos && ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1;}); \
-	     pos = pos->next)
-
-/**
- * hlist_for_each_entry_from - iterate over a hlist continuing from existing point
- * @tpos:	the type * to use as a loop counter.
- * @pos:	the &struct hlist_node to use as a loop counter.
- * @member:	the name of the hlist_node within the struct.
- */
-#define hlist_for_each_entry_from(tpos, pos, member)			 \
-	for (; pos && ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1;}); \
-	     pos = pos->next)
-
-/**
- * hlist_for_each_entry_safe - iterate over list of given type safe against removal of list entry
- * @tpos:	the type * to use as a loop counter.
- * @pos:	the &struct hlist_node to use as a loop counter.
- * @n:		another &struct hlist_node to use as temporary storage
- * @head:	the head for your list.
- * @member:	the name of the hlist_node within the struct.
- */
-#define hlist_for_each_entry_safe(tpos, pos, n, head, member) 		 \
-	for (pos = (head)->first;					 \
-	     pos && ({ n = pos->next; 1; }) && 				 \
-		({ tpos = hlist_entry(pos, typeof(*tpos), member); 1;}); \
-	     pos = n)
-
 #endif
-- 
2.35.3


