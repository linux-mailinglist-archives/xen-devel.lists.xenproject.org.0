Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C26928189
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 07:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753964.1162452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPbr2-0002MF-JX; Fri, 05 Jul 2024 05:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753964.1162452; Fri, 05 Jul 2024 05:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPbr2-0002JR-GG; Fri, 05 Jul 2024 05:51:32 +0000
Received: by outflank-mailman (input) for mailman id 753964;
 Thu, 04 Jul 2024 18:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HQi6=OE=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1sPRVo-0001AB-Cy
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 18:48:56 +0000
Received: from outbound.mail.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df30882-3a36-11ef-bbfa-fd08da9f4363;
 Thu, 04 Jul 2024 20:48:52 +0200 (CEST)
Received: from PH0PR07CA0059.namprd07.prod.outlook.com (2603:10b6:510:e::34)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 18:48:47 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::4a) by PH0PR07CA0059.outlook.office365.com
 (2603:10b6:510:e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30 via Frontend
 Transport; Thu, 4 Jul 2024 18:48:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 18:48:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Jul
 2024 13:48:46 -0500
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
X-Inumbo-ID: 0df30882-3a36-11ef-bbfa-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVOpyD+PvdgEJKM60hdhvnuEj1CALD8DYMa5APVVmdkG4DROjiVRaIF8yQDrvrMceTCk7a+QUWHd/nw2utwP+q/tw+V5rxTkzmSeJQvBmg3obQvhFqKycw4/zvSIlCz2CtGKwPEY1ZtppQnkQwZbn/ynWVTnHui9+YOUdCOZaw1hcW7nzprLsWEEvFLAjMof48T23Y31jtWNZ8yQwY8PBh5NBBjdKSomuICoQDJ1L0e6NmLCCm2irigl0U7oz0bSohMyk7Wpq6AwJSxRflb6QCisuCVFUQtqdekn0ubyTXf4wdPCoh1m8iQS8GjTrpEaubmIjzKwLhihEyba/cu/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgFO+CJcjsUoi7CKvUCcl5rizxjr5Xw2OZ/mnxTWvdc=;
 b=PqH+jGSMHvnx2sQHgXvuw/6viBP3VI6wKW2c9tu4/tr69rfURkwYl3OFWqwa3ohqK4h5zsCTUedwnf2YXX1/tlMOFcTpqJRfKX7qv24E/ziPierbBtG65B2BxdZsqwH8GxxNPuTxLMPfYAlE5Immr10cbVqwNeB/RB9FMYJhwzdEO+kRtRi+yEqSezk87P9JWAANJnidb829jwijyTez2dV8i9qIf2R9eSCw3Bebqhed6CoLlmM3DZOu08omp21F+v5yh9az3HMB9+nqIIm83GE+Fxsv30YX/0mTISq1QyIqnyrdJfW+rkebsK0C8HNzFbQ/alcnqChsd8lCm7Um7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgFO+CJcjsUoi7CKvUCcl5rizxjr5Xw2OZ/mnxTWvdc=;
 b=U2WwfuD69pp7kjqCmM5VZHAKg5Qs9w8t6hjTO4E5momBZbLxeO0tA91gw8nFsUFogcgZsHXrBKEaoUCZgOmkWzVVNmi4GRvG6HUt8pG1qEN6a+nglEniiAoxenA6AgjSgyR8+isfqDebfisrWmzCv9mCqopcwjy/W3DK2xLfEwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 4 Jul 2024 21:48:37 +0300
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, <qemu-devel@nongnu.org>,
	<sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 2/2] xen: mapcache: Fix unmapping of first entries in
 buckets
Message-ID: <ZobuhcLHqUEy_bQs@toto>
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
 <20240701224421.1432654-3-edgar.iglesias@gmail.com>
 <ZoawbAnukIBkYWCw@l14>
 <87wmm1m7i3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmm1m7i3.fsf@draig.linaro.org>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b88fb85-c7c4-414a-54f1-08dc9c59f00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?lSTjJ81PxN0lSR9gfPK7O5MTICJw5wS8Xi5eYX/jjs6tdK24I3itEjkkSF?=
 =?iso-8859-1?Q?clnlExTr72Eo9gvIxku5nB6b1rwYEV7j+UAy7id3sN1BJ9Q4coaNNQcosC?=
 =?iso-8859-1?Q?6n4CYDdO9+ZHjcAm+WcTKq7vQZ9iYi26A9LqMOKq9cNKhD0cTI62doDh7S?=
 =?iso-8859-1?Q?Cklyxa5rONVz9I1UHaEcmhxhk9swLxjPy16W9/uu+bIBZljeFsJfpAdgkJ?=
 =?iso-8859-1?Q?47rLbBvAUNAhwrdZaM07ChQReGPNeqyHer7SLBvincYSrD9phWgyiCpq3/?=
 =?iso-8859-1?Q?xnrTLvJGBteGKH6cPzYgaLzvGtXCZwK06Tdh4Pc/yd+Y2POD5y4+2FENsg?=
 =?iso-8859-1?Q?iQqpy+cWfr7pSZnTk8ArZ6v+wc5MtSXkZ21J5iamlHBAWqvfknOVc89h3f?=
 =?iso-8859-1?Q?Ca/a3yn4//uA1h/9EQ1iH+483kSiY8Ocj8B+GcdpWcbQCk3zNdH1zZVT6V?=
 =?iso-8859-1?Q?hUTAx9ixkwieLexdzEvd9xo2CI5p7SgfzWejrtjMtoY1bgyvKck3OYUKC4?=
 =?iso-8859-1?Q?c55EhSdpJO/jP8I9crlOuZF87g6nGt6f5xi59APnzniHq2qb5wTH/6awrF?=
 =?iso-8859-1?Q?F9rm41qEgya+JzoafrfnJ5zz7HUNz0NaJQCn3cpYs/UW6uWIq+cA7tIIsd?=
 =?iso-8859-1?Q?rXHuihd0R7HfNUe3v1DusaeAzrcMyUW/HNWRhLKmvNrT3rQ1RdvKhD6lW8?=
 =?iso-8859-1?Q?am3n10KpYJh5BCcMCOEVdEPsKj/Auj/O98pVvuOOyA6RFqydDC6aTgRtpY?=
 =?iso-8859-1?Q?vhdF+dJ5VlcgAC9HPTekbhVGMlB5n5D0SRYg+O9QOJoN81JRVRLGKwHbJY?=
 =?iso-8859-1?Q?B/IZ9WKwzTWPqtvyYSe2+eoRaVUnTabC2g3q/SYsXOnk6OqY20LZHzc35D?=
 =?iso-8859-1?Q?RR2yRbtu4ar4ysu3okLpPKQelnIpT7MLdyBc4WS/0rG675xKRbYINj2KNe?=
 =?iso-8859-1?Q?b+r8PXLfwNhuSS/EKZHjRTXCHiX9UOaxeEMevpm0Uimp89K1phggKkvE44?=
 =?iso-8859-1?Q?j4N2WXfD9ytCiOuvuJO6kLeG7t5wqUvptH+4L7/zrimnveq+bm07DhueP2?=
 =?iso-8859-1?Q?DD8uqBAglM1XycGE4ksnebbdWZ8RAzc8B4UEEW4pQF6z44Fy0XqdbvhDlY?=
 =?iso-8859-1?Q?yaEbBrtTNbI1LZjpBUgTocT+sLqrSEgAWcMSAnjYjSLCL26z53TcD0nEf9?=
 =?iso-8859-1?Q?o+gZMyc2zbasv4fzjRoXlEsv7UNATcyA5ltjOuIG3Zu4lMt9ut6a70MjSb?=
 =?iso-8859-1?Q?PDe9APxCxxcFbngqUhpMgoruiRFEAjnIclESvjHN3rwPn8ah2U1SA7Jomj?=
 =?iso-8859-1?Q?OVzZjv83phHzjBsnud697/9/FZWEQqxm6OMV45SHXbUd1CdPtPxRFPzXlG?=
 =?iso-8859-1?Q?v8kTKSphElnSQmiSRy/WwZ+bEZVFUBMnmNbdVCFbakzLHcYAxADjE6SP6o?=
 =?iso-8859-1?Q?mgsp3o4Gln+RxwV+UFnQcFNTSKkbIQaKSgBQeCGUDokzIdt74LkiAAUI1h?=
 =?iso-8859-1?Q?0BBV3rjTLUdkWO0+adHOzf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 18:48:47.2192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b88fb85-c7c4-414a-54f1-08dc9c59f00c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995

On Thu, Jul 04, 2024 at 05:44:52PM +0100, Alex Bennée wrote:
> Anthony PERARD <anthony.perard@vates.tech> writes:
> 
> > On Tue, Jul 02, 2024 at 12:44:21AM +0200, Edgar E. Iglesias wrote:
> >> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >> 
> >> This fixes the clobbering of the entry->next pointer when
> >> unmapping the first entry in a bucket of a mapcache.
> >> 
> >> Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
> >> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> >> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> >> ---
> >>  hw/xen/xen-mapcache.c | 12 +++++++++++-
> >>  1 file changed, 11 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> >> index 5f23b0adbe..18ba7b1d8f 100644
> >> --- a/hw/xen/xen-mapcache.c
> >> +++ b/hw/xen/xen-mapcache.c
> >> @@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> >>          pentry->next = entry->next;
> >>          g_free(entry);
> >>      } else {
> >> -        memset(entry, 0, sizeof *entry);
> >> +        /*
> >> +         * Invalidate mapping but keep entry->next pointing to the rest
> >> +         * of the list.
> >> +         *
> >> +         * Note that lock is already zero here, otherwise we don't unmap.
> >> +         */
> >> +        entry->paddr_index = 0;
> >> +        entry->vaddr_base = NULL;
> >> +        entry->valid_mapping = NULL;
> >> +        entry->flags = 0;
> >> +        entry->size = 0;
> >
> > This kind of feels like mc->entry should be an array of pointer rather
> > than an array of MapCacheEntry but that seems to work well enough and
> > not the first time entries are been cleared like that.
> 
> The use of a hand rolled list is a bit of a concern considering QEMU and
> Glib both provide various abstractions used around the rest of the code
> base. The original patch that introduces the mapcache doesn't tell me
> much about access patterns for the cache, just that it is trying to
> solve memory exhaustion issues with lots of dynamic small mappings.
> 
> Maybe a simpler structure is desirable?
> 
> We also have an interval tree implementation ("qemu/interval-tree.h") if
> what we really want is a sorted tree of memory that can be iterated
> locklessly.
> 

Yes, it would be interesting to benchmark other options.
I agree that we should at minimum reuse existing lists/hash tables.

We've also had some discussions around removing it partially or alltogether but
there are some concerns around that. We're going to need something to
keep track of grants. For 32-bit hosts, it's a problem to exhaust virtual
address-space if mapping all of the guest (are folks still using 32-bit hosts?).
There may be other issues aswell.

Some benefits are that we'll remove some of the complexity and latency for mapping
and unmapping stuff continously.

Cheers,
Edgar

