Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E104554EB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 07:53:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227117.392729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbHV-0003tB-9L; Thu, 18 Nov 2021 06:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227117.392729; Thu, 18 Nov 2021 06:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbHV-0003r2-5v; Thu, 18 Nov 2021 06:52:25 +0000
Received: by outflank-mailman (input) for mailman id 227117;
 Thu, 18 Nov 2021 06:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bdp6=QF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1mnbHT-0003qw-Ij
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 06:52:23 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe09::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135940cb-483c-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 07:52:21 +0100 (CET)
Received: from DBBPR09CA0006.eurprd09.prod.outlook.com (2603:10a6:10:c0::18)
 by AM0PR08MB5188.eurprd08.prod.outlook.com (2603:10a6:208:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 06:52:18 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::63) by DBBPR09CA0006.outlook.office365.com
 (2603:10a6:10:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 06:52:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 06:52:18 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Thu, 18 Nov 2021 06:52:18 +0000
Received: from 5ec15bcae8ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10F79A4D-CA9C-4310-AEF6-23F27BE02214.1; 
 Thu, 18 Nov 2021 06:52:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ec15bcae8ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Nov 2021 06:52:12 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6635.eurprd08.prod.outlook.com (2603:10a6:10:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Thu, 18 Nov
 2021 06:52:04 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5%3]) with mapi id 15.20.4669.013; Thu, 18 Nov 2021
 06:52:04 +0000
Received: from [10.169.172.97] (203.126.0.113) by
 SI2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.10 via Frontend Transport; Thu, 18 Nov 2021 06:52:01 +0000
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
X-Inumbo-ID: 135940cb-483c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA6cCkc5CHwxAPEJcV/2EV1idpDK9DdL9LN9DS9YFeM=;
 b=ZL3cq9H7Xnng0tGGvbmPg/HUXrLUDwscxfVsCnPBy6AbRigUOQZ/y8ecO6PpNUDBYQKHZRiY0+8NBWfb2f7JYuqQr6Go1s5U+uVdZoqaLX1kflQU9Xbg6JMtpHv2wk42bJwitvAMY2tMKWM5xZHTVp0yLXTRLzdW2hAdNwVVFmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c75defadf37f2473
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J78SX++PFvW8UM1vx96RSuC/UCCSo5AitsUqS/XCPscHFXIbogxjSnw0bgZE8/bdtBnuIU/leu5LcUtBIwddyn1YemRx2wXZyHqG/+aEpHS7anfMpH8hYOsSRA0gBrmgfIi1vzNnlRpDtA4vG+psPID+KHt5yvWWNrrhMHbqEjMD4GRR1b+f84Jk9WC0z/pxuwCPB3ErkTYav9+a4ihOHiylw8XaV3nKOtdijEBzwLbiGjtb8uYJc+U1FDFWlueVj43GZoA7FOF8xocKCFd96ytgANhkj1EUUF9682sPcrjKcliYIx0AtHL0idN/xfjmTSW+VjpwKbBV/k7jXNoQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA6cCkc5CHwxAPEJcV/2EV1idpDK9DdL9LN9DS9YFeM=;
 b=eAsvJSvymPWtzuB649ASnHIhUlmhsARO70aEtPNueVq2SsOjrlsgIbXIw6tjBrf+1xaqEuzSJQUb/shgpCtaCcttgUbSWlUWI0zprOz7rm7SqAC0WZ9J+TVph5tbhaNvtT67aKfJHm1FPR1AVs1vI+5honCLklGC9BrZzjkPhZFE/NOB7x0Nzaw2JQA+o3TV/JSmruXhFTf1UxwLnxqApw+S6mfO5TAWh1muhEC4IqdFgrho5Zjunoy4jd6+i8spYEVcpIRxwXD/AchtssA8FaHZ2/GH+s/JI8Rr0FgPABs1aq1HAHG4a1S/PsR6InBYp3wJ6VQZWePxPgOSFWIlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA6cCkc5CHwxAPEJcV/2EV1idpDK9DdL9LN9DS9YFeM=;
 b=ZL3cq9H7Xnng0tGGvbmPg/HUXrLUDwscxfVsCnPBy6AbRigUOQZ/y8ecO6PpNUDBYQKHZRiY0+8NBWfb2f7JYuqQr6Go1s5U+uVdZoqaLX1kflQU9Xbg6JMtpHv2wk42bJwitvAMY2tMKWM5xZHTVp0yLXTRLzdW2hAdNwVVFmc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <bdfc59ab-87cb-26bf-78f6-bc521e7bdd5b@arm.com>
Date: Thu, 18 Nov 2021 14:51:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/smp: Support NULL IPI function pointers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20211117164852.16394-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To DB9PR08MB6857.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a599e2e-5257-40cd-00e9-08d9aa5ff690
X-MS-TrafficTypeDiagnostic: DB9PR08MB6635:|AM0PR08MB5188:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5188109A9540935C340B8B2E9E9B9@AM0PR08MB5188.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HvzbUHFeDGbqIU5rMa1QqavAdJUFRSkCwo+thZ0IL25DXZ2qPKa0QFcPp5Mg67Ylhgex3nMExppMln+d/755D4kZel0M5rBKh+njzjvJ/V/mNYlRac4oUgJUf9D/xwKcXaMddipQFwc8ykkFoHHf/DuVVvUbn2gl0iC09mXnsqqxyBKiCAX9ekKs1ifglBcZcSrG7iWgHXKExVp1HHTyizl3FxV9niG79J7CqESbYPH6IUBYrGJ160HmuTnPt7sC9G74I3eH0Q6SacLhcu0dHgMKMY9A4+RcTFu2zeixSzBg40IfO7iiuVH/pGtKHmjn7LQIkz4y/cR9DEqZF7jR3YOol/ppb3tmoJFYL8UBsQJsHOIFOgvgAulFSqApNKOwmnyei57fV/Fp1W46689jm0dczTgFRhX+oaXWomFfDzUGsWn7/U61YpdAcjj8On1soILTu7/yL7SVLGBHHo5fIYgXuX0UTa0PMFRR2s+1oUVr5VPAcEMiKsdq3cgY9n+4H33N/bzMdhK5KusL/RjzAL1wn4NEsrAtTC3uDK63q+91ChKP0xkIHQ4MO40JPHUOvbRxhRZd4QimDCde2kElZmqzc+MFT1przh/C01QKsjtjE6vry7okdnfae1zfGE0zTBqvRvOnJOg4ijJ/e38CZCrGoCvUW5tcm+i3Zh9tS07zdsYZ75b0Aa9valNeSyfGaOh8NCIWNsLbvnfhLMGV/Qx9oph4K3m6fbD1oIwUNRk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(53546011)(508600001)(5660300002)(26005)(38100700002)(2616005)(86362001)(66946007)(16576012)(31696002)(66556008)(6486002)(316002)(186003)(4326008)(83380400001)(6666004)(8676002)(66476007)(956004)(2906002)(8936002)(54906003)(110136005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6635
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68263dff-d327-4608-03c8-08d9aa5fed97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NCV1LUOVPVPwsDLBTwgvHo8laoyuHGQTON89QubXqdw3e6ZO5RTD5QzoMcGb6ViS0OJtAaBVKkKG31CzeAjUukvKE0Qdzk37qJhTsBFf/f3aUoqmmqj1o50uli1T8kuNeH8YbN48vhYYYMkO9V5lckm/e7ZOmEijDeahcLmdraNPv1YwkB6fAxkejJD3OrQnHNirwQ3K2nZugYxQmyWUKM3hkSd6oumwlPt6NTOd51iPjKFRusd9V9C0vlu/ETCbH4v1iLW2vTMURoPmjrUI29R9P8kcZTWHyo0HhR9CswnRMHzkah6itszg4nx29vVnkM+ueCWWNWtGx3xadToCgV5isUJNkWu9gjJmEqa6tz1Onh0g8wDH8mkCjfhOzo++RQVtHoh3Ed+jtF+kiRGy2BTYOd1I/sDy0BuweoXzhqF/JC+jTwKx37zORDV++J1CqRbWCrlCJWtz/JrshKtqjDIX1FG+KQ48+GpMLWG9lVJZPM+r7zjYQZk2wX9OwYOgh0+LgVHSNJ7Kp/zt5iJcyys4C1d3ffkVmW+lxDIS173gYYXM61e6jss5Hp7t1LQNhOaUvpSL8mgaZtCvVIex4EYOWiJMqZEm2OGkKgnYQpxpiE2OJGHRh77IRt4Ho7zl2QLSWRKLJDxj/R95HkaKMCeaPHLQUzsdGR84ckx38AQTLPRCMhiu5gejFinzL2Tm0XQR5yi0qdCQHbomDhxoy3ekNSmbrEIiKOJm+J6ApH4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6486002)(54906003)(110136005)(47076005)(36756003)(81166007)(31696002)(2906002)(336012)(2616005)(4326008)(36860700001)(508600001)(5660300002)(8936002)(316002)(16576012)(83380400001)(70206006)(186003)(82310400003)(8676002)(26005)(31686004)(53546011)(6666004)(86362001)(956004)(356005)(70586007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:52:18.4813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a599e2e-5257-40cd-00e9-08d9aa5ff690
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5188

Hi Andrew,

On 2021/11/18 0:48, Andrew Cooper wrote:
> There are several cases where the act of interrupting a remote processor has
> the required side effect.  Explicitly allow NULL function pointers so the
> calling code doesn't have to provide a stub implementation.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> The wait parameter is a little weird.  It serves double duty and will confirm
> that the IPI has been taken.  All it does is let you control whether you also
> wait for the handler to complete first.  As such, it is effectively useless
> with a stub function.
> 
> I don't particularly like folding into the .wait() path like that, but I
> dislike it less than an if()/else if() and adding a 3rd cpumask_clear_cpu()
> into the confusion which is this logic.
> ---
>   xen/arch/x86/mm/hap/hap.c | 11 +----------
>   xen/arch/x86/mm/p2m-ept.c | 11 ++---------
>   xen/common/smp.c          |  4 ++++
>   3 files changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index 73575deb0d8a..5b269ef8b3bb 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -696,15 +696,6 @@ static void hap_update_cr3(struct vcpu *v, int do_locking, bool noflush)
>       hvm_update_guest_cr3(v, noflush);
>   }
>   
> -/*
> - * Dummy function to use with on_selected_cpus in order to trigger a vmexit on
> - * selected pCPUs. When the VM resumes execution it will get a new ASID/VPID
> - * and thus a clean TLB.
> - */
> -static void dummy_flush(void *data)
> -{
> -}
> -
>   static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>                         void *ctxt)
>   {
> @@ -737,7 +728,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>        * not currently running will already be flushed when scheduled because of
>        * the ASID tickle done in the loop above.
>        */
> -    on_selected_cpus(mask, dummy_flush, NULL, 0);
> +    on_selected_cpus(mask, NULL, NULL, 0);
>   
>       return true;
>   }
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index b2d57a3ee89a..1459f66c006b 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -1236,14 +1236,6 @@ static void ept_memory_type_changed(struct p2m_domain *p2m)
>           ept_sync_domain(p2m);
>   }
>   
> -static void __ept_sync_domain(void *info)
> -{
> -    /*
> -     * The invalidation will be done before VMENTER (see
> -     * vmx_vmenter_helper()).
> -     */
> -}
> -
>   static void ept_sync_domain_prepare(struct p2m_domain *p2m)
>   {
>       struct domain *d = p2m->domain;
> @@ -1269,7 +1261,8 @@ static void ept_sync_domain_prepare(struct p2m_domain *p2m)
>   
>   static void ept_sync_domain_mask(struct p2m_domain *p2m, const cpumask_t *mask)
>   {
> -    on_selected_cpus(mask, __ept_sync_domain, p2m, 1);
> +    /* Invalidation will be done in vmx_vmenter_helper(). */
> +    on_selected_cpus(mask, NULL, NULL, 1);
>   }
>   
>   void ept_sync_domain(struct p2m_domain *p2m)
> diff --git a/xen/common/smp.c b/xen/common/smp.c
> index 79f4ebd14502..854ebb91a803 100644
> --- a/xen/common/smp.c
> +++ b/xen/common/smp.c
> @@ -87,10 +87,14 @@ void smp_call_function_interrupt(void)
>   
>       irq_enter();
>   
> +    if ( unlikely(!func) )
> +        goto no_func;
> +
>       if ( call_data.wait )
>       {
>           (*func)(info);
>           smp_mb();
> +    no_func:
>           cpumask_clear_cpu(cpu, &call_data.selected);
>       }
>       else

Why only apply to call_data.wait non-zero case?
Is it because func will not be NULL when call_data.wait is zero?

> 

