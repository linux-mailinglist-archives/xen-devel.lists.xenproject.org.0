Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E83322AE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95296.179839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZLv-0008GP-Ky; Tue, 09 Mar 2021 10:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95296.179839; Tue, 09 Mar 2021 10:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZLv-0008G0-Ha; Tue, 09 Mar 2021 10:12:35 +0000
Received: by outflank-mailman (input) for mailman id 95296;
 Tue, 09 Mar 2021 10:12:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBbt=IH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lJZLt-0008Fv-T1
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:12:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9eeaf6e-0d60-4248-a2a5-bc9744d91b59;
 Tue, 09 Mar 2021 10:12:32 +0000 (UTC)
Received: from AM5PR0701CA0070.eurprd07.prod.outlook.com (2603:10a6:203:2::32)
 by VI1PR08MB3135.eurprd08.prod.outlook.com (2603:10a6:803:47::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:12:30 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::bd) by AM5PR0701CA0070.outlook.office365.com
 (2603:10a6:203:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Tue, 9 Mar 2021 10:12:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 10:12:30 +0000
Received: ("Tessian outbound 67e186bef91c:v71");
 Tue, 09 Mar 2021 10:12:29 +0000
Received: from d25c2badf898.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A43D31E-DC29-451E-BA1D-59AA4EB0625F.1; 
 Tue, 09 Mar 2021 10:12:24 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d25c2badf898.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Mar 2021 10:12:24 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3470.eurprd08.prod.outlook.com (2603:10a6:803:7c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:12:21 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 10:12:20 +0000
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
X-Inumbo-ID: b9eeaf6e-0d60-4248-a2a5-bc9744d91b59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTWFWyQTcXwBDwZZFlryr9XncfO3tk1HEVK3ASeze6o=;
 b=SXvVT8oYAgUlG7gNGXwZddiWL2qA0lT5Y89+H6ORAo9a27DxWHSIzR0OAC9joSwRbqBuhuee/tHgOzg6QtW80SNMM/oEc7nqa79Hx6WGHQYLyHIXu2JSqnn/MzwDQ66klEdrcnzATuDrHWYJv+zvXoB+VjkmDCsy0lLuW1ohXdI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9b249356915e48e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oORUcIq3h4428R+aefre8XPWit0s0bB9ZusdUcoAfgaKbvx6UlTjP312kfUT24a2WpG1rhNHZMhNF2WVyE4K0GYpfKZPXLCQ/T+3bJTTB50V9MR2vXTi9OYacG5jh/bSUn7s2uP8B39DboG0QVwMmSyIxLdyAJ3ZSRKmhkX0Qr0XzNBT036ziqPWn6ewkC7Vq+RaF3OcKaHMaFNOikucmC9QUdiX/3vHpT+tDOfoDJMwMeKNp4xq/rtQfvq/ujLyCFHcjvOkzwJiZtkDXsks2qYup7WsjTqe4D57AAbMO+4ntEA+d9j2sY5oBjnP2XJD9dEcZcYIfne18Zvhy1f8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTWFWyQTcXwBDwZZFlryr9XncfO3tk1HEVK3ASeze6o=;
 b=TevBPbuQPsCbs49JsZXbbRCmwjCWveX7chNdlZufk8OH5s9YkPL8t1QwK+NZg16Jx5xwqK1TJqJUc7hZSTrNilQZEvaQPzMls848blwYrY58VluckAXBVwwyvxeUja8+tgoXsK7iTt3Rw/v11wvbkNfswruYKWSvIWcbI8k/p1honfkM/Lq28JXafitkRgGbshhcXt31a2NUMPs2JCVxg23QQmxtPRB1yLCb93JgvCkdrJ1vkmGQ5UMimIGm+0jzpvWVTLJR5K5AefFSkWOIIuQ0XIeXRB2G/uXroEfmq1LB0OqAus6GWGnnOJqOb7cOrrzKnN1XuwKpgSp105MrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTWFWyQTcXwBDwZZFlryr9XncfO3tk1HEVK3ASeze6o=;
 b=SXvVT8oYAgUlG7gNGXwZddiWL2qA0lT5Y89+H6ORAo9a27DxWHSIzR0OAC9joSwRbqBuhuee/tHgOzg6QtW80SNMM/oEc7nqa79Hx6WGHQYLyHIXu2JSqnn/MzwDQ66klEdrcnzATuDrHWYJv+zvXoB+VjkmDCsy0lLuW1ohXdI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Topic: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Index: AQHXFFQNaLCX4oSw+0OC1jGtjtl2z6p7ZSKAgAAKWICAAAE/AA==
Date: Tue, 9 Mar 2021 10:12:20 +0000
Message-ID: <E16D4BEF-B8E2-4F6B-A4CF-5D755314D866@arm.com>
References:
 <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
 <62BD194F-C673-42CD-AEA0-BE4AFA21849E@arm.com>
 <33a75f39-7626-97a9-a90b-3fe8f1fa856f@xen.org>
In-Reply-To: <33a75f39-7626-97a9-a90b-3fe8f1fa856f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.243.24.187]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c851c4b0-db74-4934-5442-08d8e2e3d94c
x-ms-traffictypediagnostic: VI1PR08MB3470:|VI1PR08MB3135:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB313511665AD8486E5F0A1B089D929@VI1PR08MB3135.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A6AEkDBGlxCriTmCkDbTDEUYIWd91RQGyAzuaVMvqhldiRDnJCd95X1EBAKicElk0vstHsXHm2bJnkHoQ9lOnBQtKQR3MgpUkoi1fx/BCvFkm3x7b+d2SL7v2e/SU+lmP4I9RlKkidWskY2j7fB5aeKhenXXCs+2NLH/n7k/zWchiLaDWnZWw+88nYsWThI+Ed6fykrmphQubAM4RwTWMjRjuJvzYKURJ+FT9KJiEDPlGInRLf0nI6YPQwYBnKbPrniXB9pge5tEq0lTy7VDRU/W8yeKKb7Shl8ndmW1W+TpXgGHqnA/MEDGbA7BCc2XBlY+BdSA1//u0TeCTPT6SN/pAwv6CwFoyPL1qxHrU947CPG7xYO1RVXKbQFDYMPoT7CPme6ux5WZe99NeA8lVIjEl2hq7G8wHLz2/KRN6J7BYdG22L/pYfFjUR6o5wq/FjK4y0qmR17WWUHADFgCZ6JbAU6sxTvMqqEyqmmfeatVLJO9jHLfq8LKLYVYcsOYJjHh9laLfrKByL+rMXSLICSdpnYQbp1krQ9v+WgS8rzftOYNpLW20O6vqbvY+twHR7UjQYdj/lJvYnpZJZhcXQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(6486002)(53546011)(8936002)(86362001)(8676002)(36756003)(71200400001)(2616005)(83380400001)(66476007)(186003)(76116006)(91956017)(26005)(66946007)(66446008)(64756008)(66556008)(4326008)(6512007)(5660300002)(54906003)(2906002)(33656002)(6916009)(498600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?akhHWFF3MlZaMExnSTJCWFRBOWxYbkErV01wWVdhSWNxYWlHSGxsL2pBaEIx?=
 =?utf-8?B?aWJvTDBld01DWkxqSnpzNUlIVGxGUmJKUDB6RXpSb2cxYWJFdXRyU3oydGls?=
 =?utf-8?B?emtCd2FwN1lpdEZNU3F4bDVVd0pQeUdrc1FudTNINDFQd2xoUXhwVkR2S0I0?=
 =?utf-8?B?bVdWUjJWUmlvVEJHakNJdldSNkZmUzlyTnc5QSs1aXllQVkreVA4WndWSnoy?=
 =?utf-8?B?RnZxN0hpSkNVa2hLcldWSnVZRGVSY2lXT1ZFaWp4RDVXTGdHQXl5VmJQUUpE?=
 =?utf-8?B?Q2N6RHh6a3YrTzRReXNUQ2I5RklrbTlPYnMramcxRkVDczIvM3NzNTViczl0?=
 =?utf-8?B?SkYyazJIbHVNUjZXemdWNWZjNXdLN1oyRHVoVU9uNGVLcW1EcE5ZV2s0VHRI?=
 =?utf-8?B?YlY4dEVzYjZucDRjczFaRmZId3RPM3hkRVNpVkpPc1JPdkhlL004TzNPYVFi?=
 =?utf-8?B?Q2daRldaNDl5THkxRHV4UjlYRFN1aFk3MEpmd2JvK0psdE81bFk2UVV4bzM5?=
 =?utf-8?B?dGRGbjdEQmVqdDkrNHhNQzRydHd5MUxENHl3Qm5vZ1IwWHE0ZldPd0lLZkFF?=
 =?utf-8?B?WjhVR2NGVDdXcFhRYTJMN2YyZUVIbVprekJqWEwwcGM4QnFPcjl5THVXUHV2?=
 =?utf-8?B?YkZqMTRuZnhQZUo2THppdnBhWlFoZWQwSTZLRTIxSUhzTEhYRFZ1dEdPbm9E?=
 =?utf-8?B?bXJtZlpOVklLdE5PTFFYZHVyM0hiQmJFckVKWjhwc0ovMmpyMjJoSU42ZzdR?=
 =?utf-8?B?SlJZblhMbFBHSzJUMm1kaW94aXlNaUdFRFBWSTVhZVJJelNoQ2UzSzErK0gr?=
 =?utf-8?B?c1ZzM1oxQ3gxTjJ3bzlEZmtxMkNDMitJMDc3d01JWGpPL0MyNHgrRWlkWkJr?=
 =?utf-8?B?RWJKSEw4YkI5YXlPV0ZpeXE1YWZ6SmtBenUwL0E5cHJ4SzNXNk9zeW5WbnF3?=
 =?utf-8?B?c2g5cDVBcTlKMmdrSExqbDRwR2M1VTQrTXN2UEljZER3NC9IcCtCbWcyZjdh?=
 =?utf-8?B?OGJCOHFRTFQ5a1FvMHl2OU1uU3hvZDFxcnhFcldHdktZay9RYW5HVVdaZ1or?=
 =?utf-8?B?V01lMnk1SENsQUg1cW90anhRM0xJaVU2YkJGMkp2OU1kOHZ1M3A1TkFZVmI0?=
 =?utf-8?B?TkdwRHk0WER5eExaeXlGLzBCT2tkQnl1Nk4xTkxZS3cwbXYrUFlIYmFFOUNo?=
 =?utf-8?B?OVRCQVZ2QTRYdkJaVW1LNnVpUmIyc05UaUpzb3pCUHFzNENoWU5VaHBuRmto?=
 =?utf-8?B?QWFvYnRDSXdPMnZLVVI3VGxCRUlVSVc3a1dzZGV2bWV0YlZYR2lvMDY2eGdU?=
 =?utf-8?B?dXlEaHArKzdvcmJLdTdCSDVweFZXSzNiM2J5SzJsNWJFbjhZK0hNOCtiTUUr?=
 =?utf-8?B?V0tUMUxxa0xrbXkxNHgxNHRvaVpSOHhXaExBZDBVNDk0QVh0MVZXRWZhQTIy?=
 =?utf-8?B?S29uT1J1MXk5VlVxYXZleFkvL2hzUFRlaGs1UktHU094aktNYm1PZHhDQVBv?=
 =?utf-8?B?MnRsTkwyczZLRWlBeGhIU2EzOG5kOHNrQ3hzM3RVMXF2alJVbnlpY0RocUxP?=
 =?utf-8?B?NTg0MTBWcHlXYjI2WTNxRVp3S09uelYyRWo0dit6TzRPTk1tTFQ3V1c5NVl2?=
 =?utf-8?B?ck1sanJyNWxrY0FoYWZvMTZKMSsrOXJoa0JDd254eUd1RlpJOHZDVGVzSUJ4?=
 =?utf-8?B?ckZ4UjF0ZGIwbDZ3YTF6Yk5ETXE4K0JiZCtTK25GNVpITnR4aXRrOVd6OGxO?=
 =?utf-8?B?S0VnZDBaN0RNd1grOXJ5b1dYSHp6OG5tYUk5NUNHWEllTkhlaGxyV0VXTkFU?=
 =?utf-8?B?QkxISFJ0Ky9idmQrTkliQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3733DD9E4C9CF04EAD974A2B4EA6AF2E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3470
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	340942bd-7c19-44d5-f8fb-08d8e2e3d394
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wvy9TOJj56lLdj5hfSurvgTzZN10MGysd+JltXYKzpDI2hCx9ZPBaUNtzC3WQ4PnTXalnEfNEEIQ+30a3gqMou/jZGuXz0KSNdRr4MiV9KW9FiFTmOR7BXiVPJUk0FYrLF0N1I3UlwpjONvILCNAnc1rekY329Ps/S9AgE8bltx3YVTSCQ5uCNSkbqR1OSABvDGnFeah6Iy0MuFkzLU33BgWE1a9He/lr+NZ/sIbmKv4MDfmVkqdbZjI/311sHhssT2DYpa8DlqvnK32B6h6BPch75N9a7PnT1dasjWMfm/dXx1st6UvjkLBe62RSwUMWvOHlHrMMXT9aXfy+Mmh+J6P7ghsIsLuj0wKHwNiENAxdjnUorPhFmKzPXfF9zvECxEi0wNrQYy+8xBv5/QnIE0yVS8LpOyi8vvU1ESMlqvq1HpjmDep3aR4AbUF5QCgCmRk80bpDFvX7hBqrJqUa+ENGEAHHNOTISouxoDeqw9svqsNO5hh8Lyl/+9fpnlmKmwTvovmYfNV2PHUT/BNJK3s92Y3RmEW4kT3vMBTnvy4azWEV7Onil5W+FrppdLaBpUM5pxjYTDRMNf0UDStpk+yJfr0iAOQQL7ylNjvsg8pTRbjzEDhc6c1bVWJ5UA7o6mWn8AhTsfoXvep7ny5tHeUWT0+EegBmVjtAzgoZ90=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(33656002)(36756003)(498600001)(54906003)(82310400003)(356005)(4326008)(5660300002)(107886003)(36860700001)(53546011)(8676002)(6486002)(6506007)(2906002)(81166007)(83380400001)(6512007)(86362001)(8936002)(186003)(70206006)(26005)(70586007)(336012)(2616005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:12:30.3487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c851c4b0-db74-4934-5442-08d8e2e3d94c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3135

SGkgSnVsaWVuLA0KDQo+IE9uIDkgTWFyIDIwMjEsIGF0IDExOjA3LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDkvMDMvMjAyMSAwOTozMCwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEJlcnRyYW5k
LA0KPiANCj4+PiBPbiA4IE1hciAyMDIxLCBhdCAyMDo0OCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4gT24gMDgv
MDMvMjAyMSAxNzoxOCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gQWxsIGNwdSBpZGVu
dGlmaWNhdGlvbiByZWdpc3RlcnMgdGhhdCB3ZSBzdG9yZSBpbiB0aGUgY3B1aW5mbyBzdHJ1Y3R1
cmUNCj4+Pj4gYXJlIDY0Yml0IG9uIGFybTY0IGFuZCAzMmJpdCBvbiBhcm0zMiBzbyBzdG9yaW5n
IHRoZSB2YWx1ZXMgaW4gMzJiaXQgb24NCj4+Pj4gYXJtNjQgaXMgcmVtb3ZpbmcgdGhlIGhpZ2hl
ciBiaXRzIHdoaWNoIG1pZ2h0IGNvbnRhaW4gaW5mb3JtYXRpb24gaW4gdGhlDQo+Pj4+IGZ1dHVy
ZS4NCj4+Pj4gVGhpcyBwYXRjaCBpcyBjaGFuZ2luZyB0aGUgdHlwZXMgaW4gY3B1aW5mbyB0byBy
ZWdpc3Rlcl90ICh3aGljaCBpcw0KPj4+PiAzMmJpdCBvbiBhcm0zMiBhbmQgNjRiaXQgb24gYXJt
NjQpIGFuZCBhZGRpbmcgdGhlIG5lY2Vzc2FyeSBwYWRkaW5ncw0KPj4+PiBpbnNpZGUgdGhlIHVu
aW9ucy4NCj4+PiANCj4+PiBJIHJlYWQgdGhpcyBhcyB3ZSB3b3VsZCByZXBsYWNlIHVpbnQzMl90
IHdpdGggcmVnaXN0ZXJfdC4gSG93ZXZlciwgdGhlcmUgYXJlIGEgZmV3IGluc3RhbmNlcyB3aGVy
ZSB5b3UsIHZhbGlkbHksIHJlcGxhY2UgdWludDY0X3Qgd2l0aCByZWdpc3Rlcl90LiBJIHdvdWxk
IHN1Z2dlc3QgdG8gY2xhcmlmeSBpdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+PiBIb3cgYWJv
dXQgYWRkaW5nIHRoZSBmb2xsb3dpbmcgc2VudGVuY2U6IOKAnEZvciBjb2hlcmVuY3kgdWludDY0
X3QgZW50cmllcyBhcmUgYWxzbyBjaGFuZ2VkIHRvIHJlZ2lzdGVyX3Qgb24gNjRiaXQgc3lzdGVt
cy4iDQo+IA0KPiBJIHRoaW5rIHlvdSBtZWFuIGNvbnNpc3RlbmN5IHJhdGhlciB0aGFuIGNvaGVy
ZW5jeS4NCg0KWWVzIHJpZ2h0IDotKQ0KDQo+IA0KPj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4+Pj4gaW5kZXgg
Y2FlMjE3OTEyNi4uZWEwZGQzNDUxZSAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3Nt
cGJvb3QuYw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+Pj4+IEBAIC0zMjEs
NyArMzIxLDggQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCkNCj4+Pj4gICAgICBpZiAoICFv
cHRfaG1wX3Vuc2FmZSAmJg0KPj4+PiAgICAgICAgICAgY3VycmVudF9jcHVfZGF0YS5taWRyLmJp
dHMgIT0gYm9vdF9jcHVfZGF0YS5taWRyLmJpdHMgKQ0KPj4+PiAgICAgIHsNCj4+Pj4gLSAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgIkNQVSV1IE1JRFIgKDB4JXgpIGRvZXMgbm90IG1hdGNoIGJv
b3QgQ1BVIE1JRFIgKDB4JXgpLFxuIg0KPj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAi
Q1BVJXUgTUlEUiAoMHglIlBSSXJlZ2lzdGVyIikgZG9lcyBub3QgbWF0Y2ggYm9vdCAiDQo+Pj4+
ICsgICAgICAgICAgICAgICAiQ1BVIE1JRFIgKDB4JSJQUklyZWdpc3RlciIpLFxuIg0KPj4+IA0K
Pj4+IEZvciBwcmludGsgbWVzc2FnZXMsIHdlIGRvbid0IHRlbmQgdG8gc3BsaXQgaXQgbGlrZSB0
aGF0IChldmVuIGZvciBtb3JlIHRoYW4gODAgY2hhcmFjdGVycyBvbmUpLiBJbnN0ZWFkLCB0aGUg
cHJlZmVycmVkIGFwcHJvYWNoIGlzOg0KPj4+IA0KPj4+IHByaW50ayhYRU5MT0dfRVJSDQo+Pj4g
ICAgICAgImxpbmUgMVxuIg0KPj4+ICAgICAgICJsaW5lIDJcbiIpDQo+PiBPay4NCj4+IERvIHlv
dSB3YW50IG1lIHRvIHNlbmQgYSB2MiBvciBjYW4geW91IGZpeCB0aGlzIGR1cmluZyB0aGUgY29t
bWl0ID8NCj4gDQo+IEJvdGggY2FuIGJlIGZpeGVkIG9uIGNvbW1pdC4gSSB3aWxsIHF1ZXVlIGl0
IHRvIG15IG5leHQgYnJhbmNoIHNvb24uDQoNClBlcmZlY3QsIHRoYW5rcy4NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

