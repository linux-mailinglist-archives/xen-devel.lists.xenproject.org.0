Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3543F4334D2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213069.371184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnQc-0004nH-5r; Tue, 19 Oct 2021 11:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213069.371184; Tue, 19 Oct 2021 11:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnQc-0004lH-2U; Tue, 19 Oct 2021 11:37:10 +0000
Received: by outflank-mailman (input) for mailman id 213069;
 Tue, 19 Oct 2021 11:37:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcnQa-0004lB-L7
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:37:08 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 866dfd61-ef8e-41fc-8b68-a2cd69f3fee8;
 Tue, 19 Oct 2021 11:37:07 +0000 (UTC)
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
X-Inumbo-ID: 866dfd61-ef8e-41fc-8b68-a2cd69f3fee8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634643427;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HSfpGoXeVyJEdL7j5tcb3qMmIqIlOMQEDb5NeQ3l6FY=;
  b=PbJ2dcavGNbXGe9wVT8EYVgX+kFVo/s5LLQuyB3nhwXZtWUZvW97g2PN
   elCVhzcmaRbFALXK8YaxquYGcHJ1LatevnOLt+/Y5KORmnKpXAfFNdz1u
   a8tV6tVSmir1A+3puFB2WXoBZY1WIvcGPrvkKHryaUPzlZWtNtccB4Uow
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MsvtQEcZiY7MK5kqZ+WDFIh0RaTsNGQJBx9KPgRxXOi3jAEyb3Y3B7yMwwVJLL9JjOG04mLZtM
 LYkNETM6We4b27lTDaJNecVsI5eMMxjo0D4wYF+D27jn/Abc8XURRCIZOPryPd1Gcr20i/fyT0
 OH5tvUH1PWMIUUjB4IP5hE2FP8zskxCv8njrw+GSbLWh8FIMGpJGWfvZ7lEASxQWo9AgCAEg/e
 g3WxaMbRc/zSO2Ziqii0q3HeNbDYXngsB+1e7pPmkK5V5ArT7R4cVunrED0Qj5vacvXY07fbk9
 GaL9NE5pFLPDT8xthCAHU0fp
X-SBRS: 5.1
X-MesageID: 57420634
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yalfCK//HxxAoSj9fS0jDrUDWHmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zZOUGnUafeDYGX0eNskPo62p0IHvcLRzYM1S1Zq+SE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhjw
 utV7rDoRzt3FYvuuu1BVUhfTTlXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFg2tq3p4VQZ4yY
 eIfaDgxNgT+PydRK1goLKgzwf+Rr0jWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiGyOgAZHd4JeL7MRziOvw/bSsgHHHkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjtYXZNfAfucQdBFFFfu4Cy/+nfmzqWFo47eJNZmOEZDt0ZL
 9qilyM5m6kIxfAC06G27DgraBr9+8CXEGbZCujRN19JDz+Vhqb5OORECnCBtJ6sybp1qHHb7
 BDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmoieRczbJ5eJ2a5C
 KM2he+3zMUDVJdNRfQvC79d9uxwlfSwfTgbfqG8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeL2nM3eGodBJczjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3BUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:T/NSGa5xq73WXTizMwPXwVmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L52gkBrsA7ciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.85,384,1624334400"; 
   d="scan'208";a="57420634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOnuhL9DxXdWN6sKceOOinYTcXi3arOBEEVEOxvWL3d3aBiizy7vHrNFwown32sK9mpJQexn7cDZU418L47ZAqe36LhHqF0RiNzCplnh38z4Z9AJsY6PcrzRsauv1kbgIjku9BtKzTbcbQbFmzyqd/KXkqpFg2HfGke9a4S2PMe+zNza26R6Tpfvj/s2rWjErwVKGjPDq4uWAqPtsbvuAgkOLY+mcCjrZ5yy8kPv8it1xuQEGC+VtOB6iF9K2kKgtSaJWwI0paVclA3nCzo6mfTjoOd3wF3pGTSrDXQkoiSdX3YEnpNcKBAlqvPAC/dUIvJsxGBfCLbuVOt4S+FmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3yHQn77J5vmNOoEagConE3GW2TdYHmSAj2N2zafRxA=;
 b=AJhYou6vLXc47zy1UEPzOElrdnvC2Ofqf2cxnVjaqZBPxEpz6eTrPuSJOSGBbvoBS8+F14kyjrZtjpDI5DNycuD4EypWDQwJCRjdPgWHAQpu4HWYsZjOZMnrayO58fzDMmAZ1PheOFeF68oT+b5h6Av5KsIUBp5/aopfYQscIJiMM3zIu56pG7p43gOm7Cq3twMMwfJOGf2sRS/jZK9tHrRHb2YQb8XN131MBgUDBmJZaePK8ZqBBMpOO8gPN8lO6ndBxI+5w1Yi7MFf1dyW62seO4pntnVaLdhVnu75XwKMtGmPcW6T7nuYa8f5IbC7Ig+yt9JhbjUwU3qlsUQg4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3yHQn77J5vmNOoEagConE3GW2TdYHmSAj2N2zafRxA=;
 b=rkVyIczwUgjyxSwL3hVYnILiYlgbOsyoHZm5BRLD9YODsAGkyuZhReMYaAZ7rooeIE/sNsAEJTwLXdYc4Vr4xVmmAo0CKVXfZgeL9oZTGmnq1m8P1OmrFbg4qh3LiXxDeURqNKbBdjx7MIWqQDDWqBoMz3rCxTZBH5B8NItrh1U=
Date: Tue, 19 Oct 2021 13:36:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86: de-duplicate MONITOR/MWAIT CPUID-related
 definitions
Message-ID: <YW6tx43rw1SEo4fY@MacBook-Air-de-Roger.local>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
 <b809979b-5d43-482b-921b-65a4e203db2f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b809979b-5d43-482b-921b-65a4e203db2f@suse.com>
X-ClientProxiedBy: LO2P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4438aedf-9d41-4689-4b37-08d992f4ba02
X-MS-TrafficTypeDiagnostic: DM6PR03MB5337:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53379E82F885270C2FB7DECE8FBD9@DM6PR03MB5337.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tRSYT/ZDgl/sHeg6ivgYvgMCWSsA41agb3NW3sWd3zKfuqz4chaoXSxLz5oqafZfV2+g+hVNaqsK/IsDKFHD0Q2DBLtv5awjWiOI6qMkYsH6yZtLoQWXIWU5yTDV8Xnft5/kIplTykAn9fMkWX0rwvipSTPA147BBxIbGgrEaretJXgeayoJqg+IACWV8uk6iBWGWaQSyr6SvxIL/qPbvio1/Tq2tkVt+yYMRZF0B63iPWl+aqowYbOMbrMWKEYzmQCcYZVyaIjkcW5rUR8FWDTPH9BH29w+kJ+JEYyK5ful9F+Ho6/NdsJBcB+vWfJhGKU+sdkSqIEchmWZkUf8eCXMMTTrgip+jWUhBsEiK4BuewYzpEwhwsd2JD7wPDdigf06fctmo6dJzDTxTeIQ7QOexF3AtLSAH0qr6mMT0R7BMVxx9feOi1Sg18l8ZA7P+QHWwbe/GYCMbIbOckDhARKJJnAmNPBsNL/yR+vqYIDMgHhg2FcSAdAAkSX9888p7p3QM7Qvy9fWTywkiE2BaoiKOQ3ug7/lylDF0C/En2hKRsF6Z3WfTBkKb6WHexkcZw1EL0iULyC8UBI5EwmRqN1cfVH1WYuoc5OqsGjqSSbOPXv+BQiILdLW+YbyOBfZtZT4cWAo6BCYmHC3D+vQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(508600001)(26005)(6666004)(8936002)(6496006)(66946007)(66476007)(4326008)(8676002)(5660300002)(82960400001)(6916009)(86362001)(38100700002)(66556008)(9686003)(2906002)(6486002)(85182001)(956004)(316002)(54906003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWUrdFJ5bmlkTHBGb3hackZmVkpkKzNpLzFxOC9CbS9uTTVYTWxuRDNwbTVx?=
 =?utf-8?B?TkcxWkUzdndqWGg1QnljdkxockZsS3FGRDR6b29uSk5wUEk4NGlabEVhZUQy?=
 =?utf-8?B?TjlEVjZ6WUZzUlNrUjZSUGluMTR5WTVYUDNwT1pHUnlMOUVyZ3NzNlpISGk0?=
 =?utf-8?B?cWVsSkYzbUZHMXFhdTZQa2xlSjlQR1JXWStCckVPUWRKNmFPUGgrMkJXY2xN?=
 =?utf-8?B?LzdESFhLV0tEOUxmV29UaEFhWUhCNlE5aXpkL2NySC8rU0ZYZTB4clRsaitZ?=
 =?utf-8?B?M1VMLzJ6WGNEbzlTT2YrUm0zZTBWaTB4MCtzRkZMcWp5cWFhWjJzK0NXNzc2?=
 =?utf-8?B?WGdseERTQXZkdXVHRVNtTjE0cmw0UU9QTmhYeHpidFhnT1hMSStYT3hXZzVX?=
 =?utf-8?B?QVFqUHZOdmE2MnNUZzJqZjJBZTByREYzZkx6V1Vpa0s5MVVnTSt0N0VhbkFk?=
 =?utf-8?B?WXhFT0dJQ3BRNXQ5K0hreU56SUVyalBnWmdWNHlNMWhjVFFPRi9HRi9FU1ZZ?=
 =?utf-8?B?dWFFWWV1YlhwK0ZKaEJKUmdlaFhvdkhXSlUvR20vS1FHK3FQbkhBZ0RrUE9o?=
 =?utf-8?B?Z3lTK0w5bm04NUdvSGdsVGVaejBxTDVGdFJtbzc0SytKaHJFcU5DbW9URHNp?=
 =?utf-8?B?TXBlZzJWbEovZnBXZTZpZWFGVzkxOFBjZnJMZ3FDTVZUcVNzbVYycHhJTXpy?=
 =?utf-8?B?QVN4QmI5SStnWWluTVd5K25nMUM1Q0ZzRktZTS9sOWE0Rmk5cm9KZDg2VlNC?=
 =?utf-8?B?eHNwd0NDVkIxdEZXcytGUGhaYm4rY2J6am04a1Y1dkF6TGRUMFd6OXNCK2Yr?=
 =?utf-8?B?Z1o1USt4dG9CZkZXbmtLYUM1S3NTLzdvMXRxbTJ4YjBkV0NYSWdQZFFUWGVn?=
 =?utf-8?B?Q0tHQVJzdnNaZiszWWZFcmRJdDB2ZjJRT2s0MkNxMFBpTWRzVHF2SWdZckxu?=
 =?utf-8?B?bnBHREVaNUh2bUN2aHlOeXdHR0F2OHR5aDdhVkMyWWszUEVZdStIUC92RzFt?=
 =?utf-8?B?Q1l3ZTcyak93QndNOCtFZjJ1V1RxNjlxeU1BbnNLeWd4K3MyY29aSTJBRmNL?=
 =?utf-8?B?WVJuN0o1aGp1cjlHbmhZaGw0U0YyWmlkdVRGc3M2SzJRa1dQdFVJZVVYQisv?=
 =?utf-8?B?cktUelRxOXFiTzU2T1NKM0Y2MVdBRkZXNjV3SEVYdG9QWmwrWHA3cjJXSGU4?=
 =?utf-8?B?SGdWOVRjUWxqS3FiNStPRG13MU1iV1J1cHdPSnE3V0wrenRBQStyMFpVYjA2?=
 =?utf-8?B?S1UxTGI4S1BFSkRHZnN4WVRwblV3NHJMazlJSkRWeUk3MmJ3cjFhdVBveHM0?=
 =?utf-8?B?dzVEQlNQSWVaTFV0aHNPWGl2M3JaU3pyNmliVmg4aHVKWWpBbWhRWW5PQ01w?=
 =?utf-8?B?Z0RLeHhwTXZncEE1cnJtTXVnQnZtNE55eVVjM3d4U2Ewa1JOYis4OVlYTkw1?=
 =?utf-8?B?VWx3RHZEZ3orMlZOaXJ6SkxMOXFvend5VmZQU1R0NW4zeWhBeXlSM2srNUps?=
 =?utf-8?B?MDB3enl5ZG1uM0RFRmlvRW5xeHB3N0pISWRMRlFGSXREN044dEVZL1BxVnd4?=
 =?utf-8?B?UkJRSlNWUGYxcGpXZmsyYjdYLzBNVmVuRThNRVc2MWZoMStWUDltelB6UnM0?=
 =?utf-8?B?Sk1NM2JUK2FSTDA0QkR5bW9aK05jTEdUMnNEYXZuUWVxUFJ4dTZzdVFWSlFL?=
 =?utf-8?B?NUIrbkI3cFplUnUvTlQ3OGl0TWxxclI5cVlobTh1Wk5DKzl4c1ZzSTNIZUpH?=
 =?utf-8?Q?ifA9wKHNVBy60cRm6rNaf6jKJJ0jeYGf4VfUCUG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4438aedf-9d41-4689-4b37-08d992f4ba02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 11:36:44.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9kj/65VqHAlvNIAwIy0ihpts1xCPNnxw2C6HpDuQLCu7HvDTvv1DgBPIpbUko7Kgtmu9e6iFm+LMdvWCOBSJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5337
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 09:08:22AM +0200, Jan Beulich wrote:
> As of 724b55f48a6c ("x86: introduce MWAIT-based, ACPI-less CPU idle
> driver") they (also) live in asm/mwait.h; no idea how I missed the
> duplicates back at the time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

