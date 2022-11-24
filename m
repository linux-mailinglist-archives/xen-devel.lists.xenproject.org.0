Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A96374C4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447885.704497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8BW-0007PY-V5; Thu, 24 Nov 2022 09:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447885.704497; Thu, 24 Nov 2022 09:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8BW-0007N8-Ro; Thu, 24 Nov 2022 09:06:18 +0000
Received: by outflank-mailman (input) for mailman id 447885;
 Thu, 24 Nov 2022 09:06:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTCw=3Y=citrix.com=prvs=3201a854c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oy8BV-0007N0-Eg
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:06:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3f483e-6bd7-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 10:06:16 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 04:06:13 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 09:06:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 09:06:11 +0000
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
X-Inumbo-ID: 3f3f483e-6bd7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669280775;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t3EYvz1XTS+zQxJ7iA3STbW9/5xec6zWLHG0kcnaxNg=;
  b=bbGb+5eqmgAyjWw3JpLX56YNeueYGTDryqRI996EHb4UHrOwk5sRnE7a
   nJQuvZXwmMgot0WIDlu2rrMo/z0+4m0FLqCbMHYWEfzKkTlkmA1tyq6C6
   stx12JSHt1EvNg5GH3EwaMVwYJ7vI0rmdYxtIq9DxDF9omg6wbvWhzWxk
   g=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 85902443
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yJtJIKxbBcaAlNA6l7p6t+cCxyrEfRIJ4+MujC+fZmUNrF6WrkVTn
 TBKXGjVPq6DZ2ejeookbouzphsAvp/XxoQ1SQtlpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnP6wT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXFw8
 KwCdR41Vw6ao7K3xa/rac5DlO12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rKexXmnBNl6+LuQ3+5xjG+Im0gpLCITVGaghtuTq36wYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS9wWl2qfSpQGDCQAsVjdcbPQ2uclwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iIQ6jxaKQtM9Fqew14XxAWupm
 2DMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:83zizKmQ27MjHzyHPEIww15usjfpDfNMiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Xh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboX0Twk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFv9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb9rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tps+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFzxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIKzNaVwg1DwqViGLHfQIpk03ek6hlS8fsumDcS7ciFuryP6yM9vR/EyWJ
 6ISeBr6rHYXC/T8L1yrn3DsqlpWAcjufIuy6cGsnK107b2w97Rx5vmWceWAobROhAZfU66Kk
 c/fVHIVbZ9BwaQKzLFvCQ=
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85902443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SssJKId4VLsv0Hno69tlAay9NjZ8YFCKr6n8wGObNd0uJjDThjYAVXapgMp4dk+E3wlN3LNrc7IwYFd5+M9gjm/FcMaV9J1pdnoQIKB/X/MSxSjqh32TopMm0mqyxgrdt9TXUlSztQd29Q1bmcxym/hZMeQR5+SsKJscQpgJCR56TqCnTX9BERgMUqZu6PckOCT77l8/Xs8I+jQdGbTQrWRlObksVBIikFL5ORsItAoCyT2cg6VvWsdADHDB3U0RVQEalR4JOVj5Dp9AYSi1n084X/Ovm80B/WdPJWngZU0aPyveDLJcoyTeZudpihSTxlDMlr1kGtbeAHF2VSYWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3zLzs5t9KDnSrR2TlSiR/fAA72haEm1vpp5dLfJAKk=;
 b=LRoNgtvxw360a0FAokoblSG6MWGfkggL8U7FIrAsAYt5zLT18OijqYReRSSCQaudcOpiSmN1LiNiANz+jD7uemJsex4QUMfT7REmgkE6MP18aa3F/4m8PHqu82IX4fGE5n/R69KKQLtBmcquLHSmoglHh3HL3i5XUq5CN+Pub5z9+ZZua7yx417aUNIPaYjVMUDo7pfLTJq/jk6aF5PwWSzFaXPbQs++BvMMO/sWfkNBphNnS89LXIAs2zXWIzU5dOZZKYAjxemypYZTniSxi3O+8uV2634Q2j2X1NogbdF+47buZoMWNw1a+75pdjH2O9FteQ4XVwi5qIlgeXq9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3zLzs5t9KDnSrR2TlSiR/fAA72haEm1vpp5dLfJAKk=;
 b=X1jqNF3v+s/yk1QSrZxzPAPDMpIZUk3BYeGCKyISqH+x9BCnyeb0CnM06Pb7of0cWxwzDC4ur89yUrsUnLqRGQAqddTTjvHyAMJc3CYbFE6clG8uZ2ivAQ/Tl01khWpwpO25Ztst6ci7LkNp92J6nNcmED1q/J2yhvWpUScbsjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Nov 2022 10:06:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y38z/h4aEkzh5rCG@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y38ugExH9uGdw83a@Air-de-Roger>
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: b8400571-6668-45ad-00ee-08dacdfb21a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VZhYJjvoVfriiatgGqhrnhN5HP7tMzBOgtjRTK5F1gKYnDaoIPoAPUguyC4CxDiU+JVl93Ir6gLx+J9NFCLpTjpGbcMpX2OIktrrIaaJbSB2mhPSrHF9L43Z45rajl+KcmVIriJDhrqkG4WN1lQkU0WEV51qTQsjIjntuq5bhKU+Xe07zNo8NFu8xgRXIn2e27dRNVK7bi9MYr5wJfA08wJLnHrU+FZjO8K3ii1NKGu0vLrYnFpBd74nnXfWjj2Br05kJXg7tyyg3JkYG6EEaYlVqOwAVTGqmRWhJNDzmT7rEOAEic5KHM8Q9HjnZTm5GG9g00eabVOEODRUPci4lqZWLxT2opJRfE26zeACWD64SVclulnD98Bhvq72JKYV8YQhSqy0GZe/FDK3qh1e98ccKRHy4mCzrTDJ+/dtNyX2rYBKi2MyIiTUOqnJ2rhCeZzd9w6A0dD2GSVDnZgP5QQj1/8e4qndr6SVoZMLVj5+q3rkrzLCRTpEUeC6X8JjqJ14ppvJtZ2S5yrUYlY39AhPIshD0wOP7NteWDyNOCjSdz0JhG0bQ3ChrZDseVGP1kzaSAf+Jhn9AMG1z5adveMiAxK8dAw4bkfpi+mnzx6xjfV2ogQaiTi/qsaQNCd8IaHPwUgO/wi/eZBQOjgXjrOlTrm6VMr5t9i+jzTA3S0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(451199015)(8676002)(4326008)(66476007)(66556008)(66946007)(8936002)(5660300002)(82960400001)(83380400001)(85182001)(41300700001)(86362001)(26005)(6512007)(6506007)(6666004)(9686003)(33716001)(6486002)(966005)(478600001)(186003)(54906003)(316002)(6916009)(2906002)(66899015)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2trNmxnaElFcDMzbWhXYVBUak5qVjdsYXdRekp6ODlPa3haWkNaMzk4L2U2?=
 =?utf-8?B?elh6VDJoQmxBb1FCdzV4c2tpbXJ6TXplZ0E0V3ZVTFAzZ3VybjJCK0Q5Q1BG?=
 =?utf-8?B?MnczS0FUbGxQZlVpbUhGV1ZqK1NQTmNZbDdDRlgzcU9VY001WFVWaytueWNB?=
 =?utf-8?B?dzh4Y0hRQ2J1a21KdDhOd0F6SlE1YTBlSmVUN24vSSs2ajJXYk5Tb3dUL1FZ?=
 =?utf-8?B?YnpvSkEvQWc4TzI5TGVSUy9PaWZZR3kzdW9ydjBOWHhGNEl6R0lJaEN4dkg3?=
 =?utf-8?B?WCtYWkV4ajZnNFJIODJpbEkySkRYb1lYbDFsR29XbldZYzBoVGkraHZCdlZ6?=
 =?utf-8?B?TEdxYjRTRGNWQ1d6cWJiK0dHejFYSzJtcGRmYnZOVGkvZ0hiOHB3YkIwVWVN?=
 =?utf-8?B?cGY1VTFJcHpMZ1h6RDVGMlZvMTZGbHlma3puaitZd1ZyeVRJdlRGdWFmMmFL?=
 =?utf-8?B?MEJNanRaSVNQMk9VS0pXTG1MTlZxNG93b2d4K2VFNE53a2pBYStVZXgwQmNS?=
 =?utf-8?B?RDFsMW9pQ2pJaHpYRDVFeFBCMDAwdzdYQm0wNXUxdDNjS3p6NEpTeTlsaWJP?=
 =?utf-8?B?N2JFNElCQ1RFUGhKa3lTTmE5Z1phdjMwbVlkWlFqWnN5dkcvbTBQVzQwUXVQ?=
 =?utf-8?B?dnBKbUxIMFc5aTFiSXkzVmR1U0lHRkhvc3Y3RmduR0MzTmZwOEFPY0xhd2hM?=
 =?utf-8?B?SlVPTFF0c0xPM0h1ays5UTdrRDVPYTFlUUNkVUt6ejFnQzFaK3MxRmw1em4y?=
 =?utf-8?B?UnkvTmk4dXY1NHZpWFBZZlovSDBGZkFnNzJIUzJlTEJ3eEcyK1RHY3Q1OUtO?=
 =?utf-8?B?c3BGck9zTTB1L1FITkQ2cjY1bkJPMjVZSTg1SkJ3ekd3UnVucVNFWVgzTHZI?=
 =?utf-8?B?RHMwVHhwaG1WRTFyMU5vVlVEazYzSHpqKzBVY3JvUVpEdWltdFp6MzlFd2h6?=
 =?utf-8?B?QWZlY3N1b1NqNGVZSDhFcllYYjJ1ZlNQbzBLZkNnYXBEandUUTE5Z2IzRzBn?=
 =?utf-8?B?RU5PenBzRGI1NTVZYlIyeXRLRU5TRzdBY09RZnQvM2FNMUdnOXdwUkNQdjJD?=
 =?utf-8?B?TDlqOGJIWTJ4UjNxL1U5ZTdCTWQ3MFQ2ZzNnNDU3dmdsMzBSc3pyWGtiSmVv?=
 =?utf-8?B?WlR2M3F1SVlCSjduNUF0WDVzUEJoSGlGMVhzVkorYklrVmRIQTVVZThHRkMv?=
 =?utf-8?B?dnhMSGN4Unl1VXdialQ2alpjemRlNndlWDBjYVV2WE8vSjBJQlhnQSsva2tB?=
 =?utf-8?B?ajg4cm1Lb0tXMm5ia01odE9UalFnK1FxYzBlTWMvSmdTS2hRQXR1NkJ6MFd4?=
 =?utf-8?B?SHR4dGR5M0JMbGJsb1N3RGZDRDJpLzI2YWtrNUxrMEN4UzR4R0hOVTQ1eWZn?=
 =?utf-8?B?Nk9WNjBzVjQrcTFFYm1OVW1wZ3NOZ1c3K2tWbllUWUYvQk5GK1lHR2wyTmh1?=
 =?utf-8?B?KzdkK082WEJ3YlJua1BNcTdYcGV3bEdaak0xK0VHY2t3TFRjdXZENktxeHNl?=
 =?utf-8?B?dGxSSG5sQVdUN01peFRwQ2FpMEg3ZndHNFg3OUc2RjhhelJkWkN0c29HUmVS?=
 =?utf-8?B?VHRvRzhSc1RrNVpKb0xuUXoyQ0lyZmFMQ2M0RTV0ZTFKS1BpMDR4VHNxVXBx?=
 =?utf-8?B?amlVNTVqZ3dzNkFlNkZ4L0kzUXhwTEttYjAxTVNudk0zSUEzSmc3d0hYM3lE?=
 =?utf-8?B?NHRRM1RhQzc2NnJQTGtzb2wyMkVJQnZodUYyQVp2R3RtVXhRZnY1YU5uVGgy?=
 =?utf-8?B?NWI1RHU1SVRLbUhTeGhEejdoeWtZbzRjZjFFNlMrZXFaZjNNVVVzdkJJYUtM?=
 =?utf-8?B?Z0tTbmowSE9LYkpPelNKRU1adkRCUjhFNDFOT1BBYjd3Q1hNTWNIeks4MlFI?=
 =?utf-8?B?aC9kRXBiekNQRjkydnJyaURTeEdKd09TN3hBUFNCczduQUkxU25hNmJpQlVW?=
 =?utf-8?B?enNXZHRiZDlUQklXcFFXTjFMQ3ltcE0vNlBYeHQ4QzU4NUlmWXc3UllDOWFP?=
 =?utf-8?B?TTVkc2VWdmpGN2EzdmNGaXpEVE1oTzB5b3Nla0x3ZCszcTE3eTBIY1lzSElH?=
 =?utf-8?B?ZGRtMXIwSE5CNTkvNkZ1RkE2UkxOZWs0QXNYVkVKd3g3UzFMbXk5cW9GcHRH?=
 =?utf-8?B?WnoxYzdRMG8rdXhIdFBxb0hFNGJxeGJBb084cW9lREQra0pFUHFlQnVGQWZG?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bNJ965KU1gX0TVcBpGrfMNJsGt1qQgLF4LMidA6fKmf60X3OhYBdNPkkoR0BZufcpgYmyQeUL7JUzolZxvWkMLjlCXeJ1suVvhqLK8jtbI6mu7vBGC0RwGOhXFj8jW2rKyuj9aTG5joUrXlsaaQFJxppM4tbrlc9hb5NE0ggLOSbnIdv5ZzP1BRbVrkUc2K/CfB/naJCpXdj3DRmnz1jQY/E79HGt/2DJY/LMqtzyOxZlZuJeIrJ/MX6a2t+iMIy/zR/NftgL5cZ2OaQDNNmxnmOogeV3zSr/cZzoJuC/9jfOqhJg8OP0C6B+FBLOPzC2bzTNT2fD4b1J1vDM+s2SU3QkSXLW+zhn9Zx2sgY5mFNJsFqkHtQ/wsKVPpZv0vAu0A+ZmtHeorG+9W2J4N6gfFZI99J83Uzk8TsFcqKxLaGAnOETUsEAnZ9wVLapJTW+7J3vJPX14nWVHuWzV+ZT5Hc5bvG2gmivnkl+tX9gESiqXJO5dcC/VwjQeTD1AX44Golxdf4PEW3wVZtBPqKJBT7FvM8j1FcjDw9wj/3mih8Ub6w/Kgq8eyvFvRmH1SI2GA/unsS09uBRGPhm1H0pxvxRSf+wP6ofkUup5/tA0V6NBkpd2fHpZS+wNPk3NXHN1OC5fBDu07aKLJ5SvEgqUdznS2Ytm2g7/mGHlSyc9WG5PNFis5LbYe4om+VcPbBdfb/sa0bGu7zOjSvKzc4qBPIMYce572jEUA04SR1Xc91JmW5CEo3Y+RvG5moIht2BvrxUp6qDV3h5t1wOPXoTCfSKYXVnrZK025HuOmTvc9/U0bRvoMgJsvqLLu8b3OHbKnIU7abMf3x6npZewWaP+1uUJ6UcO89q+NLLBkbEjM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8400571-6668-45ad-00ee-08dacdfb21a4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 09:06:11.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAbJu1CTWBfAsc+HK0bFfqkqBP59GZmJTUpvErGELMVkFbLa7U0IZ52tMW6IzcsCpC1fPNijiyV1r873OO0zsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
> > - problematic wrt evtchn_upcall_pending, once set, preventing event
> >   injection later on.
> > As you may have inferred already, I'm inclined to suggest to drop the
> > the is_vcpu_online() check from hvm_set_callback_via().
> > 
> > One related question here is whether vlapic_do_init() shouldn't have
> > the non-architectural side effect of clearing evtchn_upcall_pending.
> > While this again violates the principle of the hypervisor only ever
> > setting that bit, it would deal with the risk of no further event
> > injection once the flag is set, considering that vlapic_do_init()
> > clears IRR (and ISR).
> 
> That would seem sensible to me, and was kind of what I was suggesting
> in:
> 
> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/

Another option would be for vcpu_mark_events_pending() to
unconditionally call hvm_assert_evtchn_irq() regardless of the state
of evtchn_upcall_pending.  This will create some spurious events.

Regards, Roger.

