Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF453FDD8C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176444.321077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQjT-0004Yl-E4; Wed, 01 Sep 2021 13:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176444.321077; Wed, 01 Sep 2021 13:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQjT-0004WD-B0; Wed, 01 Sep 2021 13:56:51 +0000
Received: by outflank-mailman (input) for mailman id 176444;
 Wed, 01 Sep 2021 13:56:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BIO=NX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mLQjS-0004W7-2y
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 13:56:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7348bdf3-0b2c-11ec-adeb-12813bfff9fa;
 Wed, 01 Sep 2021 13:56:48 +0000 (UTC)
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
X-Inumbo-ID: 7348bdf3-0b2c-11ec-adeb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630504608;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eYJQJArDZC7fN6Yxqf5+EVylu10Lw5x4htbEdY96X90=;
  b=VV24t14fAhFeVNcZ9wvrsX9H+GAYF8411kYEBD+MlbWguRoDFGq3ZpUL
   7U2D+pRK2ZC7HICfDS6M4d8EDy3V0mGFYZQP6ykexT2egtY5MKvuXJoCr
   iGfj8gNzV04RgkWYVxG0bmZ4HsIhouqKGMIP28H7bVAM2aH4eBgodTY+D
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6dvqWVnEwM6SEJ8MmxvtZ2WID4OZ2nsjPKjJUSq2pDMgyl0soQm0RP7D6OU0KX+XzKpSRo6njK
 B0+UH/rUMjfJX796/X1VbmCjgmntnd0V5+lnmeKRUPNT+Pvj1Wq8AJt11Do5M+BUYbUCXpIUUA
 /2R5+6vI8V5hrj2tqTy04G4Zg04njaBD/uuiqfgKSOduATk3X4rL2znPh3QsGw0LPQ2cNRKlSW
 LBqJOibNCd9doebXBAQuA/Agg8Y5YwTZ+sdl6z1/yTjjNG8cnwd5glk/059Y27XKwdvJmMFGEQ
 GM3vN6vOn5vpBDsUsVjflcpX
X-SBRS: 5.1
X-MesageID: 53535801
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ggx2N6le8q/+24tuJdDpYqcf+p7pDfLp3DAbv31ZSRFFG/FxXq
 iV7Y0mPHjP+VAssRAb6Le90ca7LU80maQb3WAxB8bBYOCEghrKEGgB1+vfKlTbckWUnINgPM
 9bAtBD4bbLY2SS4/ya3CCIV/MH5uDvytHZuQ6n9QYIcegQUdAE0++yYjzraXGfh2F9dOAE/O
 D33Ls6m9L6E05nEfhSwxE+LpX+TxmiruOZXfbAbyRXmTWzsQ==
X-IronPort-AV: E=Sophos;i="5.84,369,1620705600"; 
   d="scan'208";a="53535801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRyJDE8gATnRhc7ntydSeH8JaS4KoPbAfz7HkINJF/pPALKw4nWmErY3cZdAkRv9mvWlGsfxdCLD6LUoiRGKpqK2OR+ezcW8tlFAZr5SgcU87MnbOlwgpBv5Csqkra9sckot5fnRvetaXhoP+cW+bmgowWwNWnL5vD2jy3Y0ajs4kKoG66gP6ZvmlJJsofigwyosvE7LTfb6syrjJJJklvs4NYvG2CEeX1JMLBzafzwQFaPyB7O8IwzUk914IySQd0ubkRHg5oFkNcwVk/WWUumOC9GTSEScCm4VYOBzAAm7a9FKsX8Tlrkbw3+l6JnefTufMjit9UZxsrX29gqHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O/Rwm/zZbFnYdOqWPNkLOtEmXucxfXteYGvFJw99IeA=;
 b=Ucu3do1Mucy4Jv9goTV9dX6eAaZfJ+FtSC3Cy5TlS9xzpPsS/S6jsjCQHB6+TvNH38qRbYpO4V/mzGyru0uO1sseYuSSzBor1983TPb5y27KZ4NfeXrubc05zxwwUvqWngjQn8aTZLSP43i+5umcWhl//DP3bt+UPv95fX4BNxIsspD33JkPMhwwaZC8nqUtJ3Gu4oe1NQpxfBXfksMCQJZ9MHedLLpJ1/09C9szBgZ0piIhDp9pj56s/xFDBy6dGg0rDb/5WlxM5M1eRrpxK6Q3TS/zcYYG7egjWu0XvOkTrLFRs9vwDTNbO+88NhnRAAW2MQxG5CMbznpyZnvjaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/Rwm/zZbFnYdOqWPNkLOtEmXucxfXteYGvFJw99IeA=;
 b=CQ3lRVrAZq+cuaEPD3haeU715gSouzAAqlLTH+LuEgiwvmmMBDQpU5c2h9vE6rx/mNBuYUwu8VUUdOzh1i4AkYIfWKv6s4n+7Ui3n757gk1JWNi0lBL1iGTlviLG/1IK7dNtQh3EJddqGS6EUXHmJpeaRdiTmzRI/LbLLJJPJqc=
Date: Wed, 1 Sep 2021 15:56:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
Message-ID: <YS+GmC7IjxoODTu+@Air-de-Roger>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
X-ClientProxiedBy: MR2P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcac1e0d-6b7d-437b-861d-08d96d5055e6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB484481ACB6FAE9C25A3013028FCD9@DM6PR03MB4844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpZEmP5tvtGotuYUm/EmbLj9mo9rU4abSl544HqEnGKU1zyW5tMM1fu0loSlGgH/TvAgnZHU6iyzs2lmRrEIZN49q7bER/3mvbkBMSkPTzRIhH+BFZU8G7ERM3EaDv7deOVSrrTi7cLBL9SRyPDF3/qTjbi4zQl8Yr6qavh8Wuf1A7a3n0IEY6nY+ITxJ59RAaap5QVZmDD1ntXOmjVN5DiAvIZfj0qvSf9i403CHDxhK8QVaYEN97Iwr/+R7cOxkCXa+VFznUoXH2IQ37Da80OKHgOfnlwFMVc10n8muNbjpRrROrJZ8VdVp+c1OZV2CBvnIJzzwdZ/kffVtbDCRHP8S6T5eB8bzCUjGW9CqTPOfVeYUQDxpaaCZ1Aepscx/BYo2s5jxabCiYnqioZLuTrurYgUWZcIooWBHPfsGJA7Y+/06tJ42chGo+wd2/cjlmCOqaBJ1ai0E5+4m4Gi6L64W7SYp5vvcyw8YCw6H0a7bZknz3TrKMkDd2VX6nCfTik7erVrNT9vi+fp0OzR4ZBrCbGpZfGeUcVTg4JQGGlstaJT0clPme5teDCEVC+cIjhbooGIxTOsNkYx/zjo5JUZRThmU5eNNSMVWPw0EsUWfIHaOZoca69K4IXD/WMbotHgZBKSGOIjr2uH9ayCUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(6496006)(956004)(86362001)(5660300002)(33716001)(66476007)(66556008)(53546011)(54906003)(26005)(6666004)(316002)(186003)(66946007)(4326008)(9686003)(478600001)(85182001)(6486002)(83380400001)(8936002)(38100700002)(2906002)(8676002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFJRm5IdGQ1dGxnSWpEVkcwUXZvRGM4QXZYa2RrZG1CNUpkL3p5Tkw1V0Z6?=
 =?utf-8?B?cGRzNGRDWjBDU3NITXh3WWRtSnYxWW5DNUgrcWY2dmZXSFRQTi9ZMk12M04z?=
 =?utf-8?B?ZGcvUjYrSGU0SjIydnpjclcrdlgvUmtnWFNMTE9USFUyTnJiQXhPMW1TSzV0?=
 =?utf-8?B?VGR0SnFHbWhJa0VxUDd5RUxFUzh6eUo1VHYzY3R3U3NXT1loRnp3VThqVGlq?=
 =?utf-8?B?NE5VNzhOUXBWOXhzcXVWRjBJY3MrdWpIWGphVkZqYnJBTnMrODlLK0d1dHZC?=
 =?utf-8?B?UGZGRklwWWorZmQ5K3pRSDVUVTdZSHlMVmhFankrc1dWWFkvODN0VVUrUy9z?=
 =?utf-8?B?dUh2VCtHN0hjclFDYjd6UTBNbEIvS2ZwTElSTFZNZVFzVlAxTWx2SC9pYzU2?=
 =?utf-8?B?U3p3bmZMd1AxeHFsTTZBQWQ5MnNOUXdUamFDYzNDRjhSeHBwYkhHQ3ZGdmsx?=
 =?utf-8?B?eVNrOEFWMUMvaE5EakgvMWRkcmVST2xWWHZsbDlGZlZlM1diM2ltV3c2RXdH?=
 =?utf-8?B?R0RVa0ViQ0JMcm14VWMyL0Q3eDFmNVZHQXN5QVVTb1VDYU43YlY5UnZ0cUgr?=
 =?utf-8?B?TUgxc0lJZi9odXpLVFVLVFh3UHd0MjJwcTA1NlZqN3ExS2k4UEowTEhFRjlG?=
 =?utf-8?B?TnNUZFlOd2tmeHl5VndqRnE2NDBVd0tIdG4yT0ZCdWxyT3Z2WHpkNWlRenNa?=
 =?utf-8?B?K0tyQTlsS25qdE5FWjlybEJKMjJxakZvbVZKb0xvSkNRTkNOdC9DVmVwTkZI?=
 =?utf-8?B?T3RPZ3F0bkFUWkFwNWN4bWpXWUgxakIvaHJnL1YxYTNYYVk5czY2bnFoSlpy?=
 =?utf-8?B?YTJHeStmV3k3QVlXMjl1VWZTcnFNdHUzUVJRdFlOYjNnZ2lRYmloZkxtMjA2?=
 =?utf-8?B?WEc4MHlaSDM5SHpuOVluWEcvbUIxOEtXc2l2dUcrRXliWmNMeEFENDQ1WHdl?=
 =?utf-8?B?TjVQZXhmSWwvdWVVR0k1UEMvU1ZKU3hxS3FlMGE2WUJFQWwvMnFmY3ZTeTY4?=
 =?utf-8?B?ajkxdU9SZHpZTFVkeGpRa2lmTy9raXRiVjFjRG9SaHV6K3pSOG40a0wzckhK?=
 =?utf-8?B?aGQ0dC9xMDF6OGFzb1VVU0o4TXlobldXRUpIVDdVT254V3BXZnJ5ejU1SjZV?=
 =?utf-8?B?djFLazZBKzB3ZVVuak4vZ0t5QUtzbWRIdnhYWlRCUU15MHJEZ1JyOU45NUlv?=
 =?utf-8?B?dURLeHNWV1duSWdqcGFpMy95K0ZXUTVKYVZMQkxRczB6cEptcHh3clR5cVR5?=
 =?utf-8?B?UGdEN1ZGWkJXYTRkMmx2RFlNdThrT1liSU5CaEJqSHdqNXdtNUJ2Yy9XU3pN?=
 =?utf-8?B?bWVnamcvNEZ3TVdrVWxLNDhIUzBlNWd1c1ZiVVY1TVhITEppMnpWNGhTNng2?=
 =?utf-8?B?VzJHL09uRW1xb3B6OUdDQUF2ZlNHNDhXZGhEd0xWMTFvS3J6cEdVbTB4eUhG?=
 =?utf-8?B?cmRTWVBlTTdINVY5T1lGZ3FxNjJDZ2xreHhwUVEzQmNaeTlyZlBZZlUreWtQ?=
 =?utf-8?B?ZXdWeXBnQzA3M0VGOE12STJhODRpeDJELzJoRWlMUDlIcElQUGV6VEFQMkpT?=
 =?utf-8?B?bWF3NkUrSWFGRi9wS25xUVBCcEtxQ3h5VzhnV2hidjZjNGpXaEQrV1dYbUxn?=
 =?utf-8?B?RWtwZ2E3WGpxRTNMODBvZjMyMW0wTHQvelI3R2VJVGg0ZVlJODNvWDlhMkZt?=
 =?utf-8?B?d0ZOSXFFOTd3TkRnOHZBMnJrZnpwbFV2MHhKY0xpOGRCWEZIVHVqR3FORWVH?=
 =?utf-8?Q?4PFcvr6i9JsOsRFMtdpdUwOlDVPkXKHmrnjUWWH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcac1e0d-6b7d-437b-861d-08d96d5055e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:56:45.7509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPO7si4FIV8lmBFhi1Y1yeWZajC5qqH55yPZK6SvM9ha9wfc28rsouH3vxE4w/lfSrPe1NWTxdlBVr2ejGRP4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4844
X-OriginatorOrg: citrix.com

On Tue, Aug 31, 2021 at 10:53:59AM +0200, Jan Beulich wrote:
> On 30.08.2021 15:01, Jan Beulich wrote:
> > The code building PVH Dom0 made use of sequences of P2M changes
> > which are disallowed as of XSA-378. First of all population of the
> > first Mb of memory needs to be redone. Then, largely as a
> > workaround, checking introduced by XSA-378 needs to be slightly
> > relaxed.
> > 
> > Note that with these adjustments I get Dom0 to start booting on my
> > development system, but the Dom0 kernel then gets stuck. Since it
> > was the first time for me to try PVH Dom0 in this context (see
> > below for why I was hesitant), I cannot tell yet whether this is
> > due further fallout from the XSA, or some further unrelated
> > problem.

Iff you have some time could you check without the XSA applied? I have
to admit I haven't been testing staging, so it's possible some
breakage as slipped in (however osstest seemed fine with it).

> > Dom0's BSP is in VPF_blocked state while all APs are
> > still in VPF_down. The 'd' debug key, unhelpfully, doesn't produce
> > any output, so it's non-trivial to check whether (like PV likes to
> > do) Dom0 has panic()ed without leaving any (visible) output.

Not sure it would help much, but maybe you can post the Xen+Linux
output?

Do you have iommu debug/verbose enabled to catch iommu faults?

> Correction: I did mean '0' here, producing merely
> 
> (XEN) '0' pressed -> dumping Dom0's registers
> (XEN) *** Dumping Dom0 vcpu#0 state: ***
> (XEN) *** Dumping Dom0 vcpu#1 state: ***
> (XEN) *** Dumping Dom0 vcpu#2 state: ***
> (XEN) *** Dumping Dom0 vcpu#3 state: ***
> 
> 'd' output supports the "system is idle" that was also visible from
> 'q' output.

Can you dump the state of the VMCS and see where the IP points to in
Linux?

Thanks, Roger.

