Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7F51D387
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 10:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322776.544194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmtU8-0005vI-RI; Fri, 06 May 2022 08:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322776.544194; Fri, 06 May 2022 08:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmtU8-0005t2-Nm; Fri, 06 May 2022 08:38:48 +0000
Received: by outflank-mailman (input) for mailman id 322776;
 Fri, 06 May 2022 08:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4KMJ=VO=citrix.com=prvs=1183625ce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmtU7-0005sw-8x
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 08:38:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efcabaf9-cd17-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 10:38:45 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 04:38:41 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6967.namprd03.prod.outlook.com (2603:10b6:303:1a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 08:38:38 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 08:38:38 +0000
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
X-Inumbo-ID: efcabaf9-cd17-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651826325;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DVeDfpe+UVSYt2ytASu6qe8PsoXrNawj2kyO+YKxyQ0=;
  b=WUMLCjK7Au3je9+Hw4xInHBIKY5VMx0GoRhOic6940cuFtoII3+MvdAI
   IvEpZLD/drhYbVeEohZuaXbzenpzR9VJYpi3dcyskl5Xx7pwzQJCC281+
   DmRjK4jreI6wkAIdeZgR8VISHzjoecGTH7mKi6ooDMspU42eC3yCIqUlP
   g=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 70737645
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lCPRN6OxHh2glQvvrR3TlsFynXyQoLVcMsEvi/4bfWQNrUolhTwBm
 zNOXG2Gb67ZZmv2c9x2YIWypB9VvpDUzYJjGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tMw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 fEKq4SeEBcQfZLFtqMXTTpSUCtgMvgTkFPHCSDXXc276WTjKiOp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaG/uiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iakLGME9Tp5o4I7uGaLyVVQ4IHDc9WNUNm4ReF7t0iX8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FSiU93VTxC+5nmesXYht8F4FuQ77ESI1fDS6gPAXmwcFGcZNpohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnEb6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:YRFYnKDVRCX0B0blHegwsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wk9HaIGOuZ5Dt
 v/Q9VVfZF1P7srhPFGdZA8qfXeMB28fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70737645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLGZOr+YuqGW4lFSBeL21McsNG/FRHq2oeWnW/hAcOdf5atcguSNPMyFY8V6IV3t4UWNcey4tCdYQOW0pyfVPc8ERBIuc71zs8I0eE8H7Z1BQrxppLgI8TFoOkuHDIKWg6/UT1UvgrOnzCn+DhRvfwGkgIVD9EfWjU+j03P5SCaidNuru2M8wNsevOd94FOHswJlu7w011HAnPw/ZdqFKB84ugcXGSZy9ptUIDcBBiv8+5n/Rx7KaVzLYf8MCKPjGEzKzh9u4dPvBqcdJvJpJ/uYcq52JS5eW0zzZ0BJabAwb/1T10LIMeJHDoDnKR13CuZD3493HGI2Ad5lQRvvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nPBJArNKj75A1bY9/7rifvJdi50/wj3Om+ibh/8hCs=;
 b=MyWl5X4/7YjnaFT6AE2ZMzdouWPMJ9fWaEhSD67P+th0ejkQQE/oKSX+lcvG0uvNJvZr/pakB1qK7/0MbXZaiiTkjJkjdqqHyA4hd+TvJqFxqnExuxm3FP1R4FmBC6laf5dq5nKu58NHZzmVgDpxAnW64ynT2VB8AYPcdxgoZreA9oSiuX0eIjke/Ua2NI4cd6LL6Pf8JIKA1z+s/kxmKPWmF6c1VthOT/5X99pl2L+jORFeRCuQKqR5DZGsf82XmvMTFOXukkgMfAdZMHi7Xwzh9fNpwa0QAh2pXwJQKRtcPic/fOZXQmfQROl33ISbU38jYsnGHutsvwshMgOKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nPBJArNKj75A1bY9/7rifvJdi50/wj3Om+ibh/8hCs=;
 b=Y9djcEXTfgBCOnd+sklh0lqquWP2+ruzJ4Z+15bLDE5jxjKLHhVT0h1D4m4J2G2pMs8ctTXGEoB9JfDGqctC8f1YrYCkDURvT+9trgumg0kHv07ciDwKssYbpE5QkMFHY9LpI+LmVU2uvjsqKXxGs80gyniVX9tWVdLXQwTOLg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 May 2022 10:38:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 12/21] IOMMU: fold flush-all hook into "flush one"
Message-ID: <YnTeiRV0yioRYBpQ@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <024c89df-9cf9-4d74-116d-ca8481dca90b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <024c89df-9cf9-4d74-116d-ca8481dca90b@suse.com>
X-ClientProxiedBy: LO2P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9962f22b-c4e0-4820-00bf-08da2f3bd10f
X-MS-TrafficTypeDiagnostic: MW4PR03MB6967:EE_
X-Microsoft-Antispam-PRVS:
	<MW4PR03MB696738DE10D46BCF3F7CED4A8FC59@MW4PR03MB6967.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZiyT3QRvVu4BLPGq02nJj9WKD6K5BDQ7Fhjg3WexCElXStrAHm/zKScpSNO4sjS/s8E5UoB/k76XgCFCqYJ4zdyO+HqTXdLc8P1qaM1yVXRvmvEmoapZrtLuYj7qaXLCizHBrPFkMCqJ18E0dqKGzopGNC8i4QRfZXi1XtePwow1n3zpAsmPoIdX2B0ysS+RpARqKZ6tSoCtjPQsmIc4E/s0vXX24+lcR6rWDgmNzPyjogFeEhQw/JULOwk3w7bdezOkg73qFWZnOqs203BNV2r8LLqkNVKfuhvY1wu1UsBs9zrOkjYQJ9fo9q98V0bGEaMhjcxMbmix6JU6OjII4Hxx6VCokgvzuqeix0+ODZoNX269dlF6piaqaa1zBrl/aHLAeXp3q/d//vsRfuFwSlyJdDxDgz3N32fbLmf8Qe+cHTC7fjISdwr0B0HIR1criucXzv4y+X9FpH0K7J+oZWN+NFiX+tlnjO3HNqtO93k3sgHv0n8RFVOT+zWfGJgGei1aQVmD5mk/cjCj5XQ3f595uMS6k5hrYx/7SCyJLHOoYojShLnb9AOsgAt1oc4eQ7/xrEKQMTOSynBzNFjJV2fMHT58Qc+QC5/bEkZYcGrfdvoPjywYSJW3mD6QWK1UDjUtN9nIo9Jwv5M0wCPNcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(6486002)(6916009)(54906003)(508600001)(6506007)(66946007)(4326008)(8936002)(8676002)(66556008)(66476007)(26005)(5660300002)(6512007)(9686003)(33716001)(6666004)(316002)(186003)(38100700002)(4744005)(86362001)(85182001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGlsOTlscnRiVzlNMmlydTJLUjJIN0RaNjkwNXVJVDEyaEdRV0NacVZ5bzZS?=
 =?utf-8?B?MWprQXY4dG13dWhZR1VsWUpBSTY4THRGNTdIR1R1OWlxS3hjVExpL2ZyeWVy?=
 =?utf-8?B?R0I3Y2pWZi9sTGZMTUgrekNQWlhYUVhpRzgrSUJDbDYvVzUzaXB5dW12VnFa?=
 =?utf-8?B?K2dTRGdVV1FVSi81OUYwaVRZNnE4SW8wejB6a2p5N1dhQkJpdWx4OGxkUlM5?=
 =?utf-8?B?QnlmUkF4Yyt4VThBczNjdWFSbm1IVEsxNEREK2tlU1Fwbm1jczVCZytBclFT?=
 =?utf-8?B?TWdva3FML0JXRzBxMUl1Y2FkTUVZTUJXUlE4aW14MGpDb1AxSUZ1YnBHR04z?=
 =?utf-8?B?Y0VuVUFWRHJzZnR2eDFpUGFUeXlFcUxlWXBnWDFKeVY4V2FlMWw2NmJzSkx0?=
 =?utf-8?B?NVFFWnE0WkQ1MTB6MktKQTFNY09qZmRnczFoNkUycUpVMXZEN0ovcWtPSjV3?=
 =?utf-8?B?R204cktrNmQ1aHc5YUtVS2JPbmlxUjBIb3F1aWp0MDRYNk9FN2g2WnZlclZM?=
 =?utf-8?B?Vm9ja3JQSTdNWGVqRE5KSnBZOWRDeVdsTlMwZXZNVllFaXBrZFEzRjJxVEdY?=
 =?utf-8?B?Y1kwTnVDWUt4dDB1V3RNT3I0cXc4WUJOQ3JUWmJ5Mnd0aW1yZEpQQmM1VnpC?=
 =?utf-8?B?M1lXdndCRkVqZmxnTEY3Z3E5STI1SzZKMCt1WCtEQnBxSzE1V2FiZzBNSG1x?=
 =?utf-8?B?QklUZ2xaZDc2dk9pT3h1d2FPandyQkI1WWlxZ3BRS1FHbDlna0x2dVRPY056?=
 =?utf-8?B?VG9VUUpydlUwdFUvWXR5clpOQi9TM0k1SXczamhsUkJnNi9tRm16MGFnMHpH?=
 =?utf-8?B?RVZkVmlhTEVlRm44NWdoWEYxRDdEdVZheVVORGdVU0dEN1BNcWwzSnB1U0Nx?=
 =?utf-8?B?NjRnUDJKQTdNSEMvUXpmd0E3akNmR3FiU1paN201YWx3YjJpbDBXTVlqeUVB?=
 =?utf-8?B?NmJqR2I1dTdCZjNadWs2VGYwdHljeVJKZ05oRnRwV3F6UGZWZFZrODZOK0JD?=
 =?utf-8?B?dzFZNlo2MHRUWlBlOEtNMzJ1Y2pYTXpZcWYyVW9uNUFGKzMreUZwbnhhbngw?=
 =?utf-8?B?dHdRL3FBQnpnem4vYkFWeE1MR21RT2d3WFFPUnFYSGFUOXoxWG5tK2lVN0o0?=
 =?utf-8?B?Uy84bklBeTBNbEpwZTNWbEU4NzdPZ25hYW1ZcCtpLzhrTndMT2FKdGNIQkFw?=
 =?utf-8?B?N3ZzaEdVLzkyaXFnN0p3RXEvTHpaQ0p4S3RnWCtQeWRuSEd6R1U2QUxVZWxq?=
 =?utf-8?B?cFYrR1o3VzdVY01CMS9qSjdBYUpvRmw1WHpaV3Q0OGFnRzhUenFyeEFUYTFT?=
 =?utf-8?B?RmM1d1drUEhUdnpzQmN0VzdBN1l2WFJBSGJZM3Uxa2l2R3JhVjZVV0tyNDJY?=
 =?utf-8?B?UmRVMmt5cXZRMzhiTXdyTE5pSGo5YjArb0F2eGFUZ284RkhkT1lReERGbzB4?=
 =?utf-8?B?cUNjd1d3U2NQQk41TldiM1BLWWYzZG5nRDF6b2FQNXBDbWppT2daVzVZeDZC?=
 =?utf-8?B?aGNrdXl3cERyNnlvbmU1NlBERlBwaElvdkVIVXlneEk5TzZUOFlmcDhxVUJ4?=
 =?utf-8?B?WEZRU0wvQS9Ib0kwNitxNkwzbjdZQzNkQnd6VUVndVNLN3JDL0FzSk92NmI4?=
 =?utf-8?B?OWx6eVN1OUpUYUg4YXpuNHQzaXoxcEV2Q3lIYldSVDQwckh1ckQvYmlndUlz?=
 =?utf-8?B?bVVIRWNzTFNnbTFycG1kVnpvTGdqQXprbm94V2szWjlmdzd1NVg5WFQ2RkI2?=
 =?utf-8?B?Sk1sR0ZlSHJNRUVkdHhQbUQ5TkNjWkJTRCsrU0lwQmRqZ3JETUdrMmczbEtS?=
 =?utf-8?B?dllXSGFhOVJubDJ0QmRuZkYvRWFIKzVybkdjdFM3RGU3eThHNjhvczdGcGNL?=
 =?utf-8?B?YXZBUXpCdWduV2pqSnNzdCtWWjNWMEV3d2VJcFNyVkYzNGhwcnYyM3FtVlVn?=
 =?utf-8?B?YVJmWWdqbjd4c2RZUTQvbnZXRnBtT1FKbXBvNmphbkhoK09TalBjbkpBbVl1?=
 =?utf-8?B?QS9PRi9kZ1JkVEE4Zkl3eEJpWGIzQ0JjcENrUENBQWJXTDc0cExRL0FUWmsw?=
 =?utf-8?B?YktvMERGZ2Y1eEI0RFhMRy81cUJPak80VGhodm93bVMxWVdYUzZjaFRrQXk2?=
 =?utf-8?B?WFd3NmZ5YVFHUTFzV1VrMWNaekJKU1VValdIazlFSmo3TThBYkpvQjkyQXhV?=
 =?utf-8?B?czBNVDZRVzE3MFNWKy93TWxWNGFaUmUvbEw5NzlYNkE5TCtaOCtJQ3YzN0g5?=
 =?utf-8?B?b2I2RnY4TEVSN3VOdDVNSUljVGIwWG1PZWdCQVo2T1JiRUNzZWRadnhEUytO?=
 =?utf-8?B?QjRKbVZ5RXJwYVRCampzQnAxdUVmSWtqeDJYSyt0NUIwOW1SdUxTY2xhZllE?=
 =?utf-8?Q?NJxgGascszkwqycM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9962f22b-c4e0-4820-00bf-08da2f3bd10f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 08:38:38.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqQzZPTRCZMfmO23VJ7UtUeiB83WgVuqIBiD7m1xUbYMLi9hPQd8wBol+F2bv/CX4TJik6h6GGmZtozfc0VaJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6967

On Mon, Apr 25, 2022 at 10:40:06AM +0200, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -772,18 +772,21 @@ static int __must_check cf_check iommu_f
>      struct domain *d, dfn_t dfn, unsigned long page_count,
>      unsigned int flush_flags)
>  {
> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> -    ASSERT(flush_flags);
> +    if ( flush_flags & IOMMU_FLUSHF_all )
> +    {
> +        dfn = INVALID_DFN;
> +        page_count = 0;
> +    }
> +    else
> +    {
> +        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> +        ASSERT(flush_flags);
> +    }
>  
>      return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
>                               page_count);

In a future patch we could likely move the code in iommu_flush_iotlb
into iommu_flush_iotlb_pages, seeing as iommu_flush_iotlb_pages is the
only caller of iommu_flush_iotlb.

Thanks, Roger.

