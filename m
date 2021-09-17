Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061EC40F45D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189097.338651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vr-0005AX-Vn; Fri, 17 Sep 2021 08:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189097.338651; Fri, 17 Sep 2021 08:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vr-00055z-Qh; Fri, 17 Sep 2021 08:46:27 +0000
Received: by outflank-mailman (input) for mailman id 189097;
 Fri, 17 Sep 2021 08:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vq-0003AJ-4H
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96d0679e-c637-4476-adba-b04b33a520e1;
 Fri, 17 Sep 2021 08:46:12 +0000 (UTC)
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
X-Inumbo-ID: 96d0679e-c637-4476-adba-b04b33a520e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=eIm9X8tHd1Tqh1vwMRrxy3l4K0nxBP+YaEDaO0VDgfI=;
  b=KftQD36peUPJ75JYLY91bHFCiJ+gQx7lNAjmct/xfe7LFvbeRDKg6l9S
   8SGpUsws5uTrvO0hqYBi6Kd6KHuc5w6RCzLycp6vHQmVyRrVCD4PzV89j
   QULSfk0QnY+CraBjSc8XEchZg5p5L/yK9ChHTdioR20pOkum301/ITw0c
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AJGC5ytMX6wDLwBH5aceLiWn1K3VQH9POy2hpb/QiQBV4/hUkdAF0vqbjdjPhmWoGCGRIVpE20
 9mHYMWtG4BpnsAvWjRuTb83hR3GuIURHYjY3Y31lMaucVzU31sIGV6Ug3xViXkzJnOtex/LkrO
 E3oXF+BAbd3EPfq2sI5quzo700VPjqn/C9/x7EhxuJypMc/WfcLkbkVvfCl+pYBK5kElPeQRht
 AKpdCgVwhJi2+L8mqYnbo3tnGMXWB9n4KCus+MSWLQ412asFds6+9YhQF5yxTI/JK2Z98MebNy
 Il9BX7LVvjCTVmu+aUhgZJgP
X-SBRS: 5.1
X-MesageID: 52955354
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mKrjQ6A8Zb4okBVW/9Xkw5YqxClBgxIJ4kV8jS/XYbTApDwmgTRTy
 2oWDG2POf2LZ2amLox1boy08ExSu8TQx9NrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0E07wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1Gy4ptpP2
 PV05IWTViERZpeLp98WTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFhmZt25sTQZ4yY
 eISaDZPRTDmYyFQEWkVA64iwKCOqGvgJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnkS3yV40TE7m53uV3m1DVzWsWYDUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwACSyILE7gCBHG8GQzVdLts8u6ceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLT/eEt9fLCRHJk
 impsw4G349UsvUAyPDulbzYuA5AtqQlXyZsuF6OAzP6sV0gDGK2T9f3sgmAtJ6sOK7cFwPY7
 SZew6By+chTVcnlqcCbfAka8FhFDd6+OTvAiBZEG5A7/lxBEFbyINgNvFmSyKpvW/vomAMFg
 meI4mu9B7cJZRNGiJObharqU6zGKoC6TrzYugj8NIYmX3SIXFbvENtSiausM4bFyxBEfUYXY
 szzTCpRJSxCVfQPIMSeHr9AuVPU+szO7TyKHs2qp/hW+ZGfeGSUWd843KimN7tihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 irhAxQJlAWm3iSvxMfjQikLVY4DlK1X9RoTVRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:YxKC4KCa6fkXarflHemo55DYdb4zR+YMi2TC1yhKKCC9E/bo7/
 xG885rtiMc5Ax/ZJhko6HlBEDiewKkyXcW2/hyAV7KZmCP0wHEQL2Kr7GSpAEIcxeOkNK1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="52955354"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 3/6] xen/credit2: Remove tail padding from TRC_CSCHED2_* records
Date: Fri, 17 Sep 2021 09:45:56 +0100
Message-ID: <20210917084559.22673-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210917084559.22673-1-andrew.cooper3@citrix.com>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

All three of these records have tail padding, leaking stack rubble into the
trace buffer.  Introduce an explicit _pad field and have the compiler zero the
padding automatically.

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
 xen/common/sched/credit2.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 6396b38e044c..d5f41bc3d603 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1106,12 +1106,14 @@ _runq_assign(struct csched2_unit *svc, struct csched2_runqueue_data *rqd)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned rqi:16;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.rqi=rqd->id;
+            uint16_t unit, dom;
+            uint16_t rqi, _pad;
+        } d = {
+            .unit = svc->unit->unit_id,
+            .dom  = svc->unit->domain->domain_id,
+            .rqi  = rqd->id,
+        };
+
         __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1,
                     sizeof(d),
                     (unsigned char *)&d);
@@ -1336,13 +1338,16 @@ update_runq_load(const struct scheduler *ops,
     {
         struct {
             uint64_t rq_avgload, b_avgload;
-            unsigned rq_load:16, rq_id:8, shift:8;
-        } d;
-        d.rq_id = rqd->id;
-        d.rq_load = rqd->load;
-        d.rq_avgload = rqd->avgload;
-        d.b_avgload = rqd->b_avgload;
-        d.shift = P;
+            uint16_t rq_load; uint8_t rq_id, shift;
+            uint32_t _pad;
+        } d = {
+            .rq_avgload  = rqd->avgload,
+            .b_avgload   = rqd->b_avgload,
+            .rq_load     = rqd->load,
+            .rq_id       = rqd->id,
+            .shift       = P,
+        };
+
         __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1,
                     sizeof(d),
                     (unsigned char *)&d);
@@ -2799,12 +2804,15 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
     {
         struct {
             uint64_t lb_avgload, ob_avgload;
-            unsigned lrq_id:16, orq_id:16;
-        } d;
-        d.lrq_id = st.lrqd->id;
-        d.lb_avgload = st.lrqd->b_avgload;
-        d.orq_id = st.orqd->id;
-        d.ob_avgload = st.orqd->b_avgload;
+            uint16_t lrq_id, orq_id;
+            uint32_t _pad;
+        } d = {
+            .lb_avgload  = st.lrqd->b_avgload,
+            .ob_avgload  = st.orqd->b_avgload,
+            .lrq_id      = st.lrqd->id,
+            .orq_id      = st.orqd->id,
+        };
+
         __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1,
                     sizeof(d),
                     (unsigned char *)&d);
-- 
2.11.0


