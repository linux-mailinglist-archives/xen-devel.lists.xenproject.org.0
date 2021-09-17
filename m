Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819940F462
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189095.338629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vm-0004PA-T4; Fri, 17 Sep 2021 08:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189095.338629; Fri, 17 Sep 2021 08:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vm-0004Lo-MR; Fri, 17 Sep 2021 08:46:22 +0000
Received: by outflank-mailman (input) for mailman id 189095;
 Fri, 17 Sep 2021 08:46:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vl-0003AJ-49
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a06d743-cc27-45d6-9aab-e8e2e547bf81;
 Fri, 17 Sep 2021 08:46:09 +0000 (UTC)
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
X-Inumbo-ID: 7a06d743-cc27-45d6-9aab-e8e2e547bf81
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=zVahpMkV6GyvrVUFEu34Z/ndYjYizS9n7x26jqVkpFU=;
  b=aBM2VIopfqekS36WShbxBBpgWMCicwrynxcssFi5F+hhLNGefrH+yYaQ
   IxOsvheEHIIcd0CYz9/WBbRZetchMjSLAHZhmD0GSg7Eo2QrXvPf8Ezwz
   kr0cR77TJlmDTgkYAg1OK976L0E8j1aHJnQ0mv4G6EkQ1Ur68z4smaVDZ
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CDt0mO0rf3EoaTbkta+U/lvgO+b4WKpUXYKghOLVGWuQqhX33jqtb9tgonMSHf1c+uf2JpJ2kx
 xI3t1OKSdI1684wL8W47oRlCRkbY1DMVqaQVqng9Ko8ysxAR2ItdDd6Wcp1H6b+UpDDTb2SGUW
 oW2E/XvwzakWEiLDF6dA782DLuoG6bfSGm1/hUkyYMwK0lNlVhYIsPzE0d4yEoUF/Tw/N14Lzd
 g9cunEejVLp0/yK0dFiEU3Edj5MShEXmLhP3/NEvGyQSkgM1sRvQSAGmgAhK6bV0tZGPihcb/N
 iP3Ry+j2elBtNw0uDlLAke4E
X-SBRS: 5.1
X-MesageID: 52983294
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JLr7La3mmy4cUVnHhfbD5S92kn2cJEfYwER7XKvMYLTBsI5bp2NRz
 GRNWDiDOfiCY2qjf4gka9+1p0JXvpSDy4JhHAQ6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrFh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhn/Vp9
 tBpjseMVgICZIzuwbkMcQhpHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t3JEeRqyPO
 6L1bxIscRqeQQNIPGxUVpYdvuuGg1T2Uzdh/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTVIwbG7K58fprqEaO3WFVAxoTPXOkpdGph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qvL4S6JC24cVDlDZdc68sgsSlQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkAowXQqPHFeC1Ffup+6/d913kmnostf/LCdjvjtJzTU+
 Gu2sy0V3ZQx1JMa9bSK8gWS696znaQlXjLZ9y2OADn8s1ImO9D8D2C7wQOEtqcbde51WnHE5
 SJdypbEtIjiGLnQzHTlfQkbIF2+Cx9p2hXniFhzFtEK8z238hZPlqgBvWkjeC+F3isCEAIFg
 XM/WysKv/e/31PwNMebhr5d7exxlcAM8vy/DZjpgiJmOMQZSeN+1HgGibSsM4XRfK4EyvlX1
 XCzKp3EMJrnIf4/kGreqxk1iOd2rszB+Y8jbc+ilEn2uVZvTFWUVa0EIDOzghMRtfjfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchQEkQGu2SKeclzih7IKQOqHYKuTZEkTZUQEVWtEEVB5CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:JOTANqoHt9lG92aj+wcptLgaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="52983294"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 5/6] xen/credit2: Clean up trace handling
Date: Fri, 17 Sep 2021 09:45:58 +0100
Message-ID: <20210917084559.22673-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210917084559.22673-1-andrew.cooper3@citrix.com>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

There is no need for bitfields anywhere - use more sensible types.  There is
also no need to cast 'd' to (unsigned char *) before passing it to a function
taking void *.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/credit2.c | 297 ++++++++++++++++++++++-----------------------
 1 file changed, 144 insertions(+), 153 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index d5f41bc3d603..339b9fd75926 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1080,13 +1080,13 @@ static void update_max_weight(struct csched2_runqueue_data *rqd, int new_weight,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned rqi:16, max_weight:16;
-        } d;
-        d.rqi = rqd->id;
-        d.max_weight = rqd->max_weight;
-        __trace_var(TRC_CSCHED2_RUNQ_MAX_WEIGHT, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t rqi, max_weight;
+        } d = {
+            .rqi         = rqd->id,
+            .max_weight  = rqd->max_weight,
+        };
+
+        __trace_var(TRC_CSCHED2_RUNQ_MAX_WEIGHT, 1, sizeof(d), &d);
     }
 }
 
@@ -1114,9 +1114,7 @@ _runq_assign(struct csched2_unit *svc, struct csched2_runqueue_data *rqd)
             .rqi  = rqd->id,
         };
 
-        __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1, sizeof(d), &d);
     }
 
 }
@@ -1348,9 +1346,7 @@ update_runq_load(const struct scheduler *ops,
             .shift       = P,
         };
 
-        __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1, sizeof(d), &d);
     }
 }
 
@@ -1400,16 +1396,16 @@ update_svc_load(const struct scheduler *ops,
     {
         struct {
             uint64_t v_avgload;
-            unsigned unit:16, dom:16;
-            unsigned shift;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.v_avgload = svc->avgload;
-        d.shift = P;
-        __trace_var(TRC_CSCHED2_UPDATE_UNIT_LOAD, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t shift;
+        } d = {
+            .v_avgload  = svc->avgload,
+            .unit       = svc->unit->unit_id,
+            .dom        = svc->unit->domain->domain_id,
+            .shift      = P,
+        };
+
+        __trace_var(TRC_CSCHED2_UPDATE_UNIT_LOAD, 1, sizeof(d), &d);
     }
 }
 
@@ -1456,15 +1452,15 @@ static void runq_insert(struct csched2_unit *svc)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned pos;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.pos = pos;
-        __trace_var(TRC_CSCHED2_RUNQ_POS, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t pos;
+        } d = {
+            .unit  = svc->unit->unit_id,
+            .dom   = svc->unit->domain->domain_id,
+            .pos   = pos,
+        };
+
+        __trace_var(TRC_CSCHED2_RUNQ_POS, 1, sizeof(d), &d);
     }
 }
 
@@ -1556,16 +1552,16 @@ static s_time_t tickle_score(const struct scheduler *ops, s_time_t now,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            int credit, score;
-        } d;
-        d.dom = cur->unit->domain->domain_id;
-        d.unit = cur->unit->unit_id;
-        d.credit = cur->credit;
-        d.score = score;
-        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t credit, score;
+        } d = {
+            .unit    = cur->unit->unit_id,
+            .dom     = cur->unit->domain->domain_id,
+            .credit  = cur->credit,
+            .score   = score,
+        };
+
+        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1, sizeof(d), &d);
     }
 
     return score;
@@ -1603,17 +1599,16 @@ runq_tickle(const struct scheduler *ops, struct csched2_unit *new, s_time_t now)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned processor;
-            int credit;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.processor = cpu;
-        d.credit = new->credit;
-        __trace_var(TRC_CSCHED2_TICKLE_NEW, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t processor, credit;
+        } d = {
+            .dom        = unit->domain->domain_id,
+            .unit       = unit->unit_id,
+            .processor  = cpu,
+            .credit     = new->credit,
+        };
+
+        __trace_var(TRC_CSCHED2_TICKLE_NEW, 1, sizeof(d), &d);
     }
 
     /*
@@ -1752,12 +1747,12 @@ runq_tickle(const struct scheduler *ops, struct csched2_unit *new, s_time_t now)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned cpu:16, pad:16;
-        } d;
-        d.cpu = ipid; d.pad = 0;
-        __trace_var(TRC_CSCHED2_TICKLE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t cpu, _pad;
+        } d = {
+            .cpu = ipid,
+        };
+
+        __trace_var(TRC_CSCHED2_TICKLE, 1, sizeof(d), &d);
     }
 
     tickle_cpu(ipid, rqd);
@@ -1833,16 +1828,16 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-                int credit_start, credit_end;
-            } d;
-            d.dom = svc->unit->domain->domain_id;
-            d.unit = svc->unit->unit_id;
-            d.credit_start = start_credit;
-            d.credit_end = svc->credit;
-            __trace_var(TRC_CSCHED2_CREDIT_RESET, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+                uint32_t credit_start, credit_end;
+            } d = {
+                .unit          = svc->unit->unit_id,
+                .dom           = svc->unit->domain->domain_id,
+                .credit_start  = start_credit,
+                .credit_end    = svc->credit,
+            };
+
+            __trace_var(TRC_CSCHED2_CREDIT_RESET, 1, sizeof(d), &d);
         }
     }
 
@@ -1888,18 +1883,17 @@ void burn_credits(struct csched2_runqueue_data *rqd,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            int credit, budget;
-            int delta;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.credit = svc->credit;
-        d.budget = has_cap(svc) ?  svc->budget : INT_MIN;
-        d.delta = delta;
-        __trace_var(TRC_CSCHED2_CREDIT_BURN, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t credit, budget, delta;
+        } d = {
+            .unit    = svc->unit->unit_id,
+            .dom     = svc->unit->domain->domain_id,
+            .credit  = svc->credit,
+            .budget  = has_cap(svc) ?  svc->budget : INT_MIN,
+            .delta   = delta,
+        };
+
+        __trace_var(TRC_CSCHED2_CREDIT_BURN, 1, sizeof(d), &d);
     }
 }
 
@@ -2544,17 +2538,17 @@ csched2_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
     {
         struct {
             uint64_t b_avgload;
-            unsigned unit:16, dom:16;
-            unsigned rq_id:16, new_cpu:16;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.rq_id = min_rqd ? min_rqd->id : -1;
-        d.b_avgload = min_avgload;
-        d.new_cpu = new_cpu;
-        __trace_var(TRC_CSCHED2_PICKED_CPU, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint16_t rq_id, new_cpu;
+        } d = {
+            .b_avgload  = min_avgload,
+            .unit       = unit->unit_id,
+            .dom        = unit->domain->domain_id,
+            .rq_id      = min_rqd ? min_rqd->id : -1,
+            .new_cpu    = new_cpu,
+        };
+
+        __trace_var(TRC_CSCHED2_PICKED_CPU, 1, sizeof(d), &d);
     }
 
     return get_sched_res(new_cpu);
@@ -2615,16 +2609,16 @@ static void migrate(const struct scheduler *ops,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned rqi:16, trqi:16;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.rqi = svc->rqd->id;
-        d.trqi = trqd->id;
-        __trace_var(TRC_CSCHED2_MIGRATE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint16_t rqi, trqi;
+        } d = {
+            .unit  = unit->unit_id,
+            .dom   = unit->domain->domain_id,
+            .rqi   = svc->rqd->id,
+            .trqi  = trqd->id,
+        };
+
+        __trace_var(TRC_CSCHED2_MIGRATE, 1, sizeof(d), &d);
     }
 
     if ( svc->flags & CSFLAG_scheduled )
@@ -2761,15 +2755,15 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned lrq_id:16, orq_id:16;
-                unsigned load_delta;
-            } d;
-            d.lrq_id = st.lrqd->id;
-            d.orq_id = st.orqd->id;
-            d.load_delta = st.load_delta;
-            __trace_var(TRC_CSCHED2_LOAD_CHECK, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t lrq_id, orq_id;
+                uint32_t load_delta;
+            } d = {
+                .lrq_id      = st.lrqd->id,
+                .orq_id      = st.orqd->id,
+                .load_delta  = st.load_delta,
+            };
+
+            __trace_var(TRC_CSCHED2_LOAD_CHECK, 1, sizeof(d), &d);
         }
 
         /*
@@ -2813,9 +2807,7 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
             .orq_id      = st.orqd->id,
         };
 
-        __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1, sizeof(d), &d);
     }
 
     SCHED_STAT_CRANK(acct_load_balance);
@@ -3401,15 +3393,15 @@ runq_candidate(struct csched2_runqueue_data *rqd,
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-                unsigned runtime;
-            } d;
-            d.dom = scurr->unit->domain->domain_id;
-            d.unit = scurr->unit->unit_id;
-            d.runtime = now - scurr->unit->state_entry_time;
-            __trace_var(TRC_CSCHED2_RATELIMIT, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+                uint32_t runtime;
+            } d = {
+                .unit     = scurr->unit->unit_id,
+                .dom      = scurr->unit->domain->domain_id,
+                .runtime  = now - scurr->unit->state_entry_time,
+            };
+
+            __trace_var(TRC_CSCHED2_RATELIMIT, 1, sizeof(d), &d);
         }
         return scurr;
     }
@@ -3462,13 +3454,13 @@ runq_candidate(struct csched2_runqueue_data *rqd,
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-            } d;
-            d.dom = svc->unit->domain->domain_id;
-            d.unit = svc->unit->unit_id;
-            __trace_var(TRC_CSCHED2_RUNQ_CAND_CHECK, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+            } d = {
+                .unit  = svc->unit->unit_id,
+                .dom   = svc->unit->domain->domain_id,
+            };
+
+            __trace_var(TRC_CSCHED2_RUNQ_CAND_CHECK, 1, sizeof(d), &d);
         }
 
         /*
@@ -3536,17 +3528,16 @@ runq_candidate(struct csched2_runqueue_data *rqd,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned tickled_cpu;
-            int credit;
-        } d;
-        d.dom = snext->unit->domain->domain_id;
-        d.unit = snext->unit->unit_id;
-        d.credit = snext->credit;
-        d.tickled_cpu = snext->tickled_cpu;
-        __trace_var(TRC_CSCHED2_RUNQ_CANDIDATE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t tickled_cpu, credit;
+        } d = {
+            .unit         = snext->unit->unit_id,
+            .dom          = snext->unit->domain->domain_id,
+            .tickled_cpu  = snext->tickled_cpu,
+            .credit       = snext->credit,
+        };
+
+        __trace_var(TRC_CSCHED2_RUNQ_CANDIDATE, 1, sizeof(d), &d);
     }
 
     if ( unlikely(snext->tickled_cpu != -1 && snext->tickled_cpu != cpu) )
@@ -3602,18 +3593,18 @@ static void csched2_schedule(
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned cpu:16, rq_id:16;
-            unsigned tasklet:8, idle:8, smt_idle:8, tickled:8;
-        } d;
-        d.cpu = cur_cpu;
-        d.rq_id = c2r(sched_cpu);
-        d.tasklet = tasklet_work_scheduled;
-        d.idle = is_idle_unit(currunit);
-        d.smt_idle = cpumask_test_cpu(sched_cpu, &rqd->smt_idle);
-        d.tickled = tickled;
-        __trace_var(TRC_CSCHED2_SCHEDULE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t cpu, rq_id;
+            uint8_t tasklet, idle, smt_idle, tickled;
+        } d = {
+            .cpu       = cur_cpu,
+            .rq_id     = c2r(sched_cpu),
+            .tasklet   = tasklet_work_scheduled,
+            .idle      = is_idle_unit(currunit),
+            .smt_idle  = cpumask_test_cpu(sched_cpu, &rqd->smt_idle),
+            .tickled   = tickled,
+        };
+
+        __trace_var(TRC_CSCHED2_SCHEDULE, 1, sizeof(d), &d);
     }
 
     /* Update credits (and budget, if necessary). */
-- 
2.11.0


