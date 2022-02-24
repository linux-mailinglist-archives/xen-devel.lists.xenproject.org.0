Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788F4C31D2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278513.475797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHJR-00012C-Dd; Thu, 24 Feb 2022 16:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278513.475797; Thu, 24 Feb 2022 16:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHJR-0000zj-9R; Thu, 24 Feb 2022 16:49:53 +0000
Received: by outflank-mailman (input) for mailman id 278513;
 Thu, 24 Feb 2022 16:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+U/=TH=citrix.com=prvs=04734daf1=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nNHJQ-0000zd-D6
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:49:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a09e30-9591-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 17:49:51 +0100 (CET)
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
X-Inumbo-ID: c7a09e30-9591-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645721391;
  h=from:to:subject:date:message-id:mime-version;
  bh=xdaqC3vPdlD5GBEH73xjVhaAghG0idjd8TE8lvf+1hc=;
  b=UQIESotPbnjQUaRPjjMu83Ao2DIBv6zVxapvWt0zpKEBGSapkIRfsmYe
   Hx4t/3/uNzC2+9L+8f58UPC0XVGauflAVnyKYkY1VywbHZJE/6tvcvPdO
   OyLwJrXZ6KV3EVO1XFguQx1n2T1IW0IV2qROYuwruQnWCloIBRYKQm4hh
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64358261
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:4g0Dl6q8RuStZOfbcvoDn7kaV5urL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ku90dq7MAnhHP9OkMMs1NKZPTUO11HYVb2KgbGSoQEIeBeOu9K1t5
 0QC5SWYeeYZTMR4KaKgzVQe+xQh+Vvm5rY4ds2uk0dKz2CHJsQiDuRZDzrd3FedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29LOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6d030Woqqu9jJwPr3NtiEnEESutu9uXvUiZ1S2hkF1nAho0idurD
 CDmWZlAy050QKtQoj8m2qQ5+Cn6kdp15aq8y7nvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesfMftR9B6NmOQgeisa4XZcm0BS59L7TkYvI7c2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFUgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve8PcV
 T6ISZlXEIJCjLT4Je1rex2Gzj2MRaAYQg=
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="asc'?scan'208";a="64358261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG3h2jR7BLovHHujFtcF6yJ7/W9l6JOE1kBOLB1HEy3o9zPcDhlVdHFNiWXpl6uWoQHzpH+QORtkruH2usVMIiU6RXKuoum2/WzQ9QuttHlF6u2HGvNLLKXnKgiTZMWH/mTOIbzrAZUEzT+DmijoWqAeXvTGMR77UUctCm9ImafpKfKp+Oe81f82g8HSg7ICLanuh2lrULc0ExNxQzqtyHRoO/S4PpchDZKfMAORYBKLC/49dn/ezNFysglq6wAE+h+y0S+d43j8A8ybX7gwrznohUl1GRjDQCrQlDAOj7MTZY53FOvQvXpvClqCz4VTnA9ElG7jTejZo4Ls3/Ve5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMVteJp43pHO3mYJNgHdT7wIa4xwlw5yM8lUuP2j/s0=;
 b=b+hwS0R0oAQ4z7p8v4uxPrsESxQBvFnqlNZbwEDsCC0BKLpiD9ZOf3n5SAIoKsvwTE0DOqxE/A7R4tMUHbaA17hzJljBfY56Mfsu+sIjl4IMke0MbcSllZFJ5yaW6g5sDJwf84oyhVZ+lTbyVXvAK6AJKvp//r32HL/TBuheMxcnVAUpl+g5lB3C7fcQ23QX+pJEM+XnCtUymgzrQHX+sTlNKdX0oC5B9UwMdeTLCKOAKqm8yGxI6lILniNb5KAmT1Dt1hi18J4Xy5Zzl2uVXx2OrPkYd25tUvpxwFWXdSOPbT0TRVwQLA63jO6h9XNzZpZ+w+8rQlI8cbjcAt0c5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMVteJp43pHO3mYJNgHdT7wIa4xwlw5yM8lUuP2j/s0=;
 b=V9+wlg9nJj8RgMzFPNsJoPwrE9xOyQkQc0S+nA+IjdLRo1CAq1C3iue0A+ca9DJjeQ12lFjeizozKu3zKY+wJyxwKWlIVeWDdrUSfBRGtlnCEaq91u1ftn/sAhsBIfu3dxfnvT50kUpSOHOOcjMOw9pmkXABS3XUm7rncbk4b5g=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, "Stewart Hildebrand"
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Ian Jackson <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>
Subject: [ANNOUNCE] Call for agenda items for March 2022 Community Call @ 1600
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for March 2022 Community Call @
 1600 UTC
Thread-Index: AQHYKZ6GWVOKVKgeEke5Ycz2R+cy2g==
Date: Thu, 24 Feb 2022 16:49:44 +0000
Message-ID: <7914A3A3-9907-425D-A455-C30A105187C5@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c793595-ca36-4818-880a-08d9f7b5a8f0
x-ms-traffictypediagnostic: BYAPR03MB4119:EE_
x-microsoft-antispam-prvs: <BYAPR03MB4119B4576A21986ACE2EE997993D9@BYAPR03MB4119.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fmKRhp/56r/mybdfPuQl0Jc1cX0422fwidjxeI3bnexwgXcP86QGqTR1NzhR/p4T0CltDqecir76blB2jwCFnx+NPf+6gL8vohPKOTp1tvidV9oB/PoMutNR7WUbf+3J6TsrDox5d3XGqhQoc8QqXl0RNGzpGmRmE2D4kjrA2w651aoc6N2pyhFwJcyFfVR/JZmiuFvh4pHNSj0IbBZA427EWPqvXPPqvF30h+7RpW1oS9yeINBCdqEPF43KI+4GcAhJa6fWBi8HZz/v4KJ3IzHa5JVLjfChtId6Koadlrp4wzCECU+IWmDPaBh8QfnEW0FqLXR9L0xFMNuVfNvYLdPI7WluQoEhpM6tOCUhL8FNz4CD/JPUjNGQ65CMSL6xqS2k+WMEYxsPS1ChFvWy1XMeiJTqzar6swP3SIpFinHRgGi2n0gkxbxNywbLJLo7FXTDcNAOvMAQHJBTvIPM1EJC3HZPkqV4ucny0VBQ+/FSTRUrUQ9iOpLLvPhHyP6bH1P9GEAT5B4S2O1ZFpd5sqY7TxadLTrLdhg97Vl75zQY4Mq12ysR4fEIZTkOnuXRbwpWEv4Orygk2IItC6PF+CEr70f2NSycbbh8RI4CaYOpWY/tYZiCM5MKJV5QKkQsVI3wsKBX0wleGXHkMiSi5fs9nd0wY3X1fTLACj5ht2QURFq0Fk+SUkc/AGN0Z59HHEKERE4r41T/hQU2PNOzoUqOvge1K6kdfqJUC/7bwbisXAUj7HY/KnlyoOy2oFpxbjlNDQXpaXXq98bnxVSEEWvK9hErzRWvuHLZmDJifBDaYCN2OQjYYgJBPABLsrcwr8DBjG7nhXoiEe/Ym7+e3oircvQROqM00t2QC1L15sAw+BOl8we0p1X6d8l4ijcU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(6486002)(66476007)(110136005)(66556008)(966005)(508600001)(64756008)(33656002)(91956017)(66946007)(76116006)(7406005)(316002)(86362001)(7416002)(5660300002)(66446008)(2906002)(6512007)(38070700005)(82960400001)(71200400001)(921005)(26005)(186003)(99936003)(6506007)(122000001)(8936002)(38100700002)(83380400001)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlpRQ2JveWdxMW1IN1V2TFVuUGdEYVdXcW4yTlViNkJ2U3FBaXkzSDRVRGZQ?=
 =?utf-8?B?bnE0b1pQU0xoTFF4U0dsRlJycElnRXpFVlhWMC9FTDhMZEVzTlF2V2Q3ZUpq?=
 =?utf-8?B?RzZYNlhueEw0UElZQnRuWDZXUFgvY3JSWHpRYnhRYXBvclVRQk9DenJoQ0lF?=
 =?utf-8?B?UzRTOFIrRUcydkxZaFJwc0V5QjMxWGI1TVdlRWpkLzFQei9NOE9uV0hmWjhW?=
 =?utf-8?B?TlhhNzI3YzhST0gwZ2t3V2RBSjEvR3FMV2lFakRvdVpVNHZrRmdMSkpkSGZu?=
 =?utf-8?B?SUJWM0gzWEtrK1RnTmVxYlFzRUVxNEp6ZlpZRFlDNjdJNEdabkF0NXh5OEtT?=
 =?utf-8?B?ZFoyTC83UGpNamxnd2lYSHVSMFVDa29EeVNnVlZ1bE5jTCtjQndKTW55OWpR?=
 =?utf-8?B?QVBXeklRRWNyeER6cTJKOEtnLzRBV2hWZ1NwZGNZM0I5T0RzRW5MS1RTQk5a?=
 =?utf-8?B?cWk1OTlNT0Z4NStiQ1R4Q3duQmQ2NlloVkpIbDlneDFJSDNiRGtPTFhwcGdP?=
 =?utf-8?B?V2doVFNYT1dLZWpuZnVvV2tnQnBpWHNjci9BbnpjSkFtOFJFVmdRUFVwVUdi?=
 =?utf-8?B?R096bHRIQ0luVXYxVFVEVjJhaTFNd1dOLzhCL3pNUGtyelFGcENvRllUVkRn?=
 =?utf-8?B?Tm45YlArdi9uTUs5SktzenlnVlVIc09aUWJodC82L3E1cTF6blpyVnl2LzY2?=
 =?utf-8?B?cnVXSXB1NzI3MTJNZStUVnhrRWdOa0RQTktKcXdsV2lQeThjZ0x0RVJRZW5O?=
 =?utf-8?B?QzJQNG9SMVBLYnpvK0ZEd29SSEZsYXlQbnBQa0VrVE9UNWlCV3ArUm1CcVFt?=
 =?utf-8?B?dTJXOHRGMm83SmNoK2JuNEF3TXYvRmRPaGE1ZzlpanNZVnlUNzNsWnA2b0cw?=
 =?utf-8?B?akNCelhGRDk4NDM5MXBkN3FROWdsYjYyRjZvRUZ0Z2lJc3NNZ0tMUU9HRmF5?=
 =?utf-8?B?Tlo3RzJWQ0FnOUVLVVlRazdXQ2dnTFcydWszb1RVdkVhWTZsbHVpVkFaanIw?=
 =?utf-8?B?NE8xTmtYQVZKVFc2dnExd1BHMjhQK0hRQkdwdXdyK3RTaWpDQ0oxY2RSWnlu?=
 =?utf-8?B?Z29nN2JIZ0FSTnZsVHE1TkxQNDNHdjVIcHdMVk5pRjVCL2ZTckNoTVlCWFJw?=
 =?utf-8?B?N0NLMzNqa09NS0s3dW5iNmFVL2JjZnZhQVUzM0NTa0FPWU9wcStsZ3JEb09v?=
 =?utf-8?B?SElVMTdnTDM1SzVmVjZKK2JoenhRQUV4OG1wRXJ1aFpHK1VWaWJ2Y2FtZTd6?=
 =?utf-8?B?Y3N0ZDAvNENnbkpiVndBdFZ2K1ZjcENvMzUwVTRJQ0NlbEJvT2ZwNkVlem1a?=
 =?utf-8?B?V2R2SDhaNFJlOVZWUmZ4d2J4TUtqWFBzSk5tWS9kaDJnWDlXakk5bFlPeGJo?=
 =?utf-8?B?M2lPekR6Mm54NjdRa2lIWTNHUkRxM2k2cjM0QXRGTWtZamdaeklJUmxDVk1p?=
 =?utf-8?B?dFNYYzF3dlltWExUU0VKT3k5Vi9iditlQUN2VE5pRHJFK1lmWFJmRkZyTTgr?=
 =?utf-8?B?d29mVlpGRWhaQ1NSUTNkVzZRSHJHMkFsUGtSc2tCMmZFOTNZYi9Mc2JOZG1G?=
 =?utf-8?B?QXQwVTFuNnl0K3VDbm5LVGE4TE1lRXVlcFFYeGRSTEpkeVlrNENuN29aakRa?=
 =?utf-8?B?ZndtNHpOeG9PYWptOGVJL3FWbXRtQ3Z1TTQwTTEyVTNyN0hHeE96NzhFdjJG?=
 =?utf-8?B?MTdBMElzSjJXaU9qT0orQklDSll1QWMzME8wZnlPdWRzWGVGUFZxeHAySG41?=
 =?utf-8?B?Y3RvQkFOakZHZVdPSFVtbUpZK1JGZFJBaGE0QmZwZW5tNXJ0RWhvbVhlN3RU?=
 =?utf-8?B?MFpNQkRhaVA2cXpQWFdOTDhEK2lMaWdBdDFTQWdWVTBSckVZU0xES3JyOUtF?=
 =?utf-8?B?Vi9rWnU1dEJFeEF1UlFjTWVDWWhScndSV0kraGUrTXVhWERtRmhkd0xjWFJ6?=
 =?utf-8?B?VE9EcC81WHIyc2h6eFFuamVLU3ZmNmI0YjhIYzROaU93QkVHOGZVRWNwNWtK?=
 =?utf-8?B?QWR2ekpKUEhqSkpvSE9JcWdaQkRNUkVBQVlkSnV4WXhaSFpvK0FuYUZkbCtH?=
 =?utf-8?B?SXl6c0dOYUpreWJ3ODJ6cGFaaXp6QUl1WlgxamxMOThLMEdzSGR3N2FwYld4?=
 =?utf-8?B?VGFPYUFuZ1o2RFlqVEVFd0pzcHBNK3NmWTdqekpZUithQVBrY1NnQ0hvZS80?=
 =?utf-8?B?ZUJ1elVGczNKUWdjdFdIK296SlRYVVZEZVkvQzF5S2oyZkI4K0hDV3h0clAv?=
 =?utf-8?Q?qjbaP+sqLUZdZnAig/XvSiaEivn+IDiSV8L1Kyy5WQ=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6C137B20-D43B-4D0E-BA19-3F791BD06FC0";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c793595-ca36-4818-880a-08d9f7b5a8f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 16:49:44.2457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVSiyETcUhPVEK6rDN/AHhi6cI3MwcPvw8a/e5UAjjOS/cYwMsIJlrPP9Kf4/RLHafJRFAuaSBH2wGRq+NfJDT20ip7bcKLJMc81NYo3w80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4119
X-OriginatorOrg: citrix.com

--Apple-Mail=_6C137B20-D43B-4D0E-BA19-3F791BD06FC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/UQhtWwPPUUD6p2gWGXEPrIc1/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Tuesday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a =
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George



=3D=3D Dial-in Information =3D=3D
## Meeting time
16:00 - 17:00 UTC
Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D03&day=3D1&hour=3D16&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_6C137B20-D43B-4D0E-BA19-3F791BD06FC0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIXtycACgkQshXHp8eE
G+1HCAf/YsOvf4gH/4S4ZF0PazsLhbQxTZCvqGKvny4sAZg9AQZXrPKzbsXgrlHv
JHyF8yYkGsBohXP5V7Z1H4IcwtwEa+ayDiGHRzrPewrASA8PMcRCG3wQkzEEu1a8
FjT8W7XGDwXnDFc1Q3CA6yzzq7MvZJaA9yrzPMop3yBNszj4xzl6dn1K1JWrK+0B
Kn2XGALE2ByAiznVBMICfwKXmkhEz+KVKlwGspr+mL4RPoTWX1fZhp42GBjDjttv
LXVatHtUCwfhOKHpv9Dik/anAqqhHWnRLRzNBbziY87Rnn5f3ap77cH7WvvxuBIL
X7+KXezWQ/M9NsEU4t2MPrnsCF+UPA==
=+Ufr
-----END PGP SIGNATURE-----

--Apple-Mail=_6C137B20-D43B-4D0E-BA19-3F791BD06FC0--

