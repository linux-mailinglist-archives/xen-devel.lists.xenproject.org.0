Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D33EAE9D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 04:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166616.304119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEN0o-0005jE-4y; Fri, 13 Aug 2021 02:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166616.304119; Fri, 13 Aug 2021 02:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEN0n-0005hU-Va; Fri, 13 Aug 2021 02:33:33 +0000
Received: by outflank-mailman (input) for mailman id 166616;
 Fri, 13 Aug 2021 02:33:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9ox=NE=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mEN0l-0005hO-WE
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 02:33:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d82c9638-fbde-11eb-a247-12813bfff9fa;
 Fri, 13 Aug 2021 02:33:29 +0000 (UTC)
Received: from AM6PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::26)
 by VI1PR0802MB2141.eurprd08.prod.outlook.com (2603:10a6:800:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 02:33:28 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::30) by AM6PR10CA0049.outlook.office365.com
 (2603:10a6:209:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Fri, 13 Aug 2021 02:33:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 02:33:27 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Fri, 13 Aug 2021 02:33:27 +0000
Received: from c62b779bcd5c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D12B0596-396E-4B51-9084-09E579D8B577.1; 
 Fri, 13 Aug 2021 02:33:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c62b779bcd5c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Aug 2021 02:33:17 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR08MB2872.eurprd08.prod.outlook.com (2603:10a6:6:24::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 02:33:15 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 02:33:15 +0000
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
X-Inumbo-ID: d82c9638-fbde-11eb-a247-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRy9fdmkwQoI6f2ZMyk9mX7UsReHdeE+mbBwUyJHijE=;
 b=MACb/G6tYqIu7i4nJcLUs7cJeit6bRK2uQe+llWAuGa59Nor5Rxv6vPbkzYV5QrpoHqW5cQ28TQlqvrtOSRMNL9rZTpljemfNm0wh6Ci0yItcuZH7p46UP8HoUXCHlNICCMoJexBEsq7GwwInFDezdbsR38DrTWzSWNr042sGLk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y99+/DL5vnXpLGGoWGUpJuBKGj+cSIfYqxAhNLQAyKMpt2Xqez1Hzh0qt7AcBY8K4Zgxt7gWuEKsP9RCpeyVk7+q7sZSVErSNEez6bNeJClUaZpEPNjXrtBgzlQLm2z1VUaWX7TgPNGDz0Rdxp2M+K7QJjj7dlDrq326iGaJ+eJB1f9eQxGnSmxnOampMUYYtCLmhdr+G8yBBzaUX/Bo4vnB7NAzi2tbtD4BZDnhsE93RjuCiBblxhQAXAvz3z3flyuuGhxwo2jtjKTsj0WyDpqnM6eWmH3nOxUD0ZnZM3VpJpf/fO0yiFESO+bZzjTtvL6pWyRFwp7Rnkf+sKzN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRy9fdmkwQoI6f2ZMyk9mX7UsReHdeE+mbBwUyJHijE=;
 b=oDiJm+PWY0BU+f7PZJQkaYTIbkMlZ9662e1DQfxsz1RZH7JUPOpMhSorSiPLG2paI8bLHYkWpG1Li440k+F7IuCCOIr6bk0bNhoIzFY7WutFb49Wcx+ZNkGy7kVLS/Hsl9Cec9GJVi6CXTH+BgzMYyPridT9kqPtsrri6UQAKdGSzpgk3Ctgy8Xzx/97fzgRPX2a9yb/i9i6MZPw6fMckpBoTjFtvtRswl5CwMZdAQZ/uTYaQUnaLJsY2bx1XOZD5E6QkdvmbhNPUKqrsPYz/sF8NFkC7iBMsWm8kWptPqdxXoaoKB4HtbJkc202zdRCV/Gp8kew5Vb2ky7fl2fsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRy9fdmkwQoI6f2ZMyk9mX7UsReHdeE+mbBwUyJHijE=;
 b=MACb/G6tYqIu7i4nJcLUs7cJeit6bRK2uQe+llWAuGa59Nor5Rxv6vPbkzYV5QrpoHqW5cQ28TQlqvrtOSRMNL9rZTpljemfNm0wh6Ci0yItcuZH7p46UP8HoUXCHlNICCMoJexBEsq7GwwInFDezdbsR38DrTWzSWNr042sGLk=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
Thread-Topic: [XEN RFC PATCH 00/40] Add device tree based NUMA support to
 Arm64
Thread-Index: AQHXjpsd4nR+5Zr0JUK+Jd3HYcfrq6tuHbQAgAKaELA=
Date: Fri, 13 Aug 2021 02:33:15 +0000
Message-ID:
 <DB9PR08MB6857FD05AA5D73C8C59C9E419EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <bb62f56a-6023-58df-99ed-a4588c4d80b9@suse.com>
In-Reply-To: <bb62f56a-6023-58df-99ed-a4588c4d80b9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 32DA4CF67AAB8848891395D352AA466E.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 312c94aa-14f0-43d0-9177-08d95e02bb72
x-ms-traffictypediagnostic: DB6PR08MB2872:|VI1PR0802MB2141:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB21419B7C61FABEB3C6F034EF9EFA9@VI1PR0802MB2141.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RJIpTbnJPc+pVoWGwsjSvJIGATw3R21QAtuNG3bZcjcVaA86diOW7y6sY8/bqW9lDKI0zkM1vNQsVaGAXSgqLKurI1ojCRJtDgvz4nZ5OJKjMzF9u8gVAfU9JmYoQJVcKzm4s/8zRn1sqycBiOQGROul+DB5eGg6MKxqAGGe5/HS2+l7OHaHHPjWdldFggGjKPYEgQAVTT62ZdHNnptusDkMMx5caw8bOwexUM0H3r8Iovh4+W4f8LzEHVUcJEqqdr+nbHoktBkS/ymVUJPH0+v46JDG942mzovGlGj4gve2NZefDbJvekTGfwBlD8+XYyKoy2x2AmCLYSfM3GHFxRFZNqSG5p0yHoIPJOgK6xR1noDjCldV45xxEQX22GTVQgkncMxIO2Gxq4Md6W+cWDEjBhNyDmFGdKBM19nD3qhuXfZ/SnB//y/bZbkbdhzXY0A9PVW3ngEnuGG8tseVw/195b2nqbtf2g4diE81bv51vn33Hc85ptC4aovnI/CWUlnlz31Q61mEarPBi0LGH9StGxweG02X4eAj7wBI4F+wirqj6Uqq3aAVvQKjkyu/gzNFm5DNOg9/VWo8gWhwzq5Z68tpcZeHmGHjRom5B6n2vo3OKqIi2spIojFAoBsqXKQUBs5tOCX2G/NPiB8DGojTi+A2HzJt80sT79dixYqdXsCiZIdrhdBQGVSzabiQSi30HR/lNg/kDIAVpM/Grw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(122000001)(55016002)(66556008)(6506007)(53546011)(186003)(38100700002)(4326008)(8936002)(33656002)(7696005)(66446008)(2906002)(86362001)(9686003)(26005)(66476007)(76116006)(8676002)(66946007)(71200400001)(64756008)(54906003)(6916009)(83380400001)(316002)(478600001)(52536014)(5660300002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmYrWlU1dExCdVZwNkFaT3ptRzY3N0RtejFxM1RJQnl5R0t4UkNJTllIRTF0?=
 =?utf-8?B?MzFLMWQ4ODR5NGZuMkFDRGpmbmZHdFd2aGs5dnlTTGFsMExUZjc5SEZweHcw?=
 =?utf-8?B?TU4xVUpNcVRaemRoeWdVUHVrNkUyY3VETHF1VTBBeHplTTNleWpHL3lwL2tR?=
 =?utf-8?B?aDJ4dkR4eDJMZ1gwZzBRVEZSUm9SMFFycG5ldCtNdkU4WWlvZVg2NUNlU2tk?=
 =?utf-8?B?dGdjUzVFZFlXbmt5RGEvay9yUnFrOVpBT3dCbkt0SjcwVStIcE1YNmhGSmdn?=
 =?utf-8?B?b0QrbjBCZi9ZV0I5a1p5NzVwVXpjR3UwNmhFbGt2bE5uVWExUHpCOUxjMDZX?=
 =?utf-8?B?Y1VRR25jSVFNcVN0c0N3TTJyV3hMcEZvRVE0TnE3Rm9jR2lDU2l2MW8ySGdw?=
 =?utf-8?B?N0tDbWtHN2Zwdzd0RXZsdk8xZlQ2L2t2bXVEU28xZEQvcnlIN2dSdXh3ZHR2?=
 =?utf-8?B?N1YrWTZ6VU4yOVB3VkZJWjhJNTdoVitOVFh6TFZzbFZ3MVNsV3lweHM2R1Nk?=
 =?utf-8?B?SEU5RTgxUGFXRVdDSVNZcWE0cURxb1JiT1N6OWFGZUJUTDk0dUxOWTdZaStx?=
 =?utf-8?B?MEJtMGFTeFpsVnNzUHZqd1RHZ2krMXlCTzBuZ2xsUVdOMG1nRWllNEtaK3Fj?=
 =?utf-8?B?UjBWRXZ2UElzZ2tRc2VQZDJqdGNoM24ydjNxU3lYY0pwblM3RGt2ZlJqaHI2?=
 =?utf-8?B?YkczektGTmpHbGd3SzJIb0dkUGdyem1rTktldVArWjZDbER4RW8wQUh0a0lJ?=
 =?utf-8?B?ZXpPWVlLL1JoNUtxNUpTNWo1ekZpOU10d1NGSnFCbis4WjUzN1hjczFTa2Jv?=
 =?utf-8?B?Y1JSSWgvZE5MMUkweWFwNFBqL0x4Sml1b1czYzVUY2dhQ2QvdEpRbWJxQUZz?=
 =?utf-8?B?eWtkU1Zkc1Z6QWJyYnY2TWZYaitmU29CZVF3dXluZFFxQnVSYVBNTnUvZkxi?=
 =?utf-8?B?WnpKWTlrQk9wMUtURElQTkFlQnh0a1BhNVppQnV0YWRyUCtYNmZMNER2QmVF?=
 =?utf-8?B?L3gwNG45VVZEcjFCU0R3WVBNWGkyb1NSOEYzL3pkUkd1bm5oaGVLNzZxejdm?=
 =?utf-8?B?aEpvYjNsZzlOU0Q5aWp6RFJOZTRkTno5dTNtOWE5d3I3NEdpWm9DaTV2UnlY?=
 =?utf-8?B?bW1WYnp6c1lFT05BV2ZCMUNZRlVjRHZRMmt0M1JxVEptbU9SOWxsTGNtSGFj?=
 =?utf-8?B?UFZJajdaK0FvZ3RoMTNnbTNYZFI5R1lYMjE1MEZwcWc4Uy93STY1dy93NDVx?=
 =?utf-8?B?MHBSS1pzb2lPOVR2L09Cc1NDdDhTUGtndGxOcHYwZTgvdnBTWUNPclpsTjcy?=
 =?utf-8?B?TkQ4OUwwVVQ2Q1RIL2ZPTS9NVC9STEtYYXVyZ3FLcnNsTmlNeUY4SXU1RTU5?=
 =?utf-8?B?WjdLVmRkWVlraUcxNnZDOVZVdFZFMzVvSmZQbVNacldSQTIwYXBBbGoyTFI5?=
 =?utf-8?B?T2RUL0UzWFNZbDFkbmp4UkZ1VytPaGl1d0ZwSXR5NE83UU9ldDlhTDFOY2Nn?=
 =?utf-8?B?L2djQzUwRU9TQVpUemQxbUpqbFhrck9JbzdVTEhjcjc3TXNiak9NU00wdHMv?=
 =?utf-8?B?Y0xYUnBBRiticEtJcVVCeERWUUlXU3lsUUFiSndnMEtXSEJ4MUUvQ2hmT1d1?=
 =?utf-8?B?dkhydS9kQWhpUmM4MUcxR2VZUVZTcDh6UG5ZaTJMN1JIVDlxV1M4dDB3eGhP?=
 =?utf-8?B?bDNyK2ZVV1pKblQvLzRNS2JYeHorY2FFQW42MmJBYWg0MGdYR3U5ZXBDbjQ4?=
 =?utf-8?Q?d+k7lDbmQ5oXGUfRTY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2872
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	051bf2ca-e7d0-42fb-c807-08d95e02b413
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Deok13j70nhLdHZpIJ/cadMBfM9O6h8paj/6BVyd88EEe4MFeinPd4xyxm+f8yKOZw+AsjBjZ/m0uJ/P1sJCv1r+vt0owOYf+utsgmjJ/sDBowXtaaKIqlvVbHBp3aW12cK2bOez9FVl+DODrHMvopQJX401/jgzw9OZA48LpYDguNgzmKXG98DnigxdxAcTxW2wQVNr11myZPwxZy5kJ/IRuRQnp/Vz04kf0w5tIlRMKoxjEUsKa+cTbp7cTL6L2KN4jI7FvwyV0zsg5ZF3gxcw473ndEzoF3UIaMkv5S3muJrzIr9rprZL0G/TXAE29dKJE2Rfjd3HezVD8KTeQma5TcuuijAP0ygk1PStIU/5oTiT3d3GZkkqgSpxFekSPLlUsbOF9W95TChFntknhulwALULYyp+owYdnE2ba19PDJcyyMyUOmBWXAn5v0opkrNY+yA2+Ph4hH9uBEHZPboKxxG2NtUQzXW3+9Roa+qV6nP0rUyMdcYaKYeUvQdbmDZ56uHq1TX2pJ5mHdyPlU3UmIOIskxKI/hQoarxm5Nk5jMAgTlk+Q39bTBDgxWsgyLGjszmBJjihpBYzraVHr48AJHrsBx/wZ3+qgZ16p+IA9LrFpHw2VKMjV7mHsg7dUY+whdMocdQ+B3b7r/Q9ouHqXFp6bSPb9/e1zUPCXeJ2vB37X9P6QrwvTpFN3fb4CTRUCEIPt6Ql7hHdW+Z0w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(46966006)(36840700001)(55016002)(316002)(36860700001)(47076005)(54906003)(9686003)(70206006)(6506007)(7696005)(186003)(70586007)(26005)(478600001)(53546011)(8936002)(82310400003)(5660300002)(52536014)(356005)(82740400003)(8676002)(86362001)(83380400001)(81166007)(33656002)(4326008)(336012)(6862004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 02:33:27.6289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 312c94aa-14f0-43d0-9177-08d95e02bb72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2141

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgxMeaXpSAxODo0Mg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOw0KPiBq
dWxpZW5AeGVuLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6
IFJlOiBbWEVOIFJGQyBQQVRDSCAwMC80MF0gQWRkIGRldmljZSB0cmVlIGJhc2VkIE5VTUEgc3Vw
cG9ydCB0bw0KPiBBcm02NA0KPiANCj4gT24gMTEuMDguMjAyMSAxMjoyMywgV2VpIENoZW4gd3Jv
dGU6DQo+ID4gSG9uZ2RhIERlbmcgKDIpOg0KPiA+ICAgeGVuL2FybTogcmV0dXJuIGRlZmF1bHQg
RE1BIGJpdCB3aWR0aCB3aGVuIHBsYXRmb3JtIGlzIG5vdCBzZXQNCj4gPiAgIHhlbi9hcm06IEZp
eCBsb3dtZW1fYml0c2l6ZSB3aGVuIGFyY2hfZ2V0X2RtYV9iaXRzaXplIHJldHVybiAwDQo+ID4N
Cj4gPiBXZWkgQ2hlbiAoMzgpOg0KPiA+ICAgdG9vbHM6IEZpeCAtV2Vycm9yPW1heWJlLXVuaW5p
dGlhbGl6ZWQgZm9yIHhsdV9wY2lfcGFyc2VfYmRmDQo+ID4gICB4ZW4vYXJtOiBQcmludCBhIDY0
LWJpdCBudW1iZXIgaW4gaGV4IGZyb20gZWFybHkgdWFydA0KPiA+ICAgeGVuL3g4NjogSW5pdGlh
bGl6ZSBtZW1ub2RlbWFwc2l6ZSB3aGlsZSBmYWtpbmcgTlVNQSBub2RlDQo+ID4gICB4ZW46IGRl
Y291cGxlIE5VTUEgZnJvbSBBQ1BJIGluIEtjb25maWcNCj4gPiAgIHhlbi9hcm06IHVzZSAhQ09O
RklHX05VTUEgdG8ga2VlcCBmYWtlIE5VTUEgQVBJDQo+ID4gICB4ZW4veDg2OiBNb3ZlIE5VTUEg
bWVtb3J5IG5vZGUgbWFwIGZ1bmN0aW9ucyB0byBjb21tb24NCj4gPiAgIHhlbi94ODY6IE1vdmUg
bnVtYV9hZGRfY3B1X25vZGUgdG8gY29tbW9uDQo+ID4gICB4ZW4veDg2OiBNb3ZlIE5SX05PREVf
TUVNQkxLUyBtYWNybyB0byBjb21tb24NCj4gPiAgIHhlbi94ODY6IE1vdmUgTlVNQSBub2RlcyBh
bmQgbWVtb3J5IGJsb2NrIHJhbmdlcyB0byBjb21tb24NCj4gPiAgIHhlbi94ODY6IE1vdmUgbnVt
YV9pbml0bWVtX2luaXQgdG8gY29tbW9uDQo+ID4gICB4ZW4vYXJtOiBpbnRyb2R1Y2UgbnVtYV9z
ZXRfbm9kZSBmb3IgQXJtDQo+ID4gICB4ZW4vYXJtOiBzZXQgTlVNQSBub2RlcyBtYXggbnVtYmVy
IHRvIDY0IGJ5IGRlZmF1bHQNCj4gPiAgIHhlbi94ODY6IG1vdmUgTlVNQSBBUEkgZnJvbSB4ODYg
aGVhZGVyIHRvIGNvbW1vbiBoZWFkZXINCj4gPiAgIHhlbi9hcm06IENyZWF0ZSBhIGZha2UgTlVN
QSBub2RlIHRvIHVzZSBjb21tb24gY29kZQ0KPiA+ICAgeGVuL2FybTogSW50cm9kdWNlIERFVklD
RV9UUkVFX05VTUEgS2NvbmZpZyBmb3IgYXJtNjQNCj4gPiAgIHhlbi9hcm06IEtlZXAgbWVtb3J5
IG5vZGVzIGluIGR0YiBmb3IgTlVNQSB3aGVuIGJvb3QgZnJvbSBFRkkNCj4gPiAgIHhlbjogZmR0
OiBJbnRyb2R1Y2UgYSBoZWxwZXIgdG8gY2hlY2sgZmR0IG5vZGUgdHlwZQ0KPiA+ICAgeGVuL2Fy
bTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3IgQXJtNjQNCj4gPiAgIHhlbi9h
cm06IGludHJvZHVjZSBkZXZpY2VfdHJlZV9udW1hIGFzIGEgc3dpdGNoIGZvciBkZXZpY2UgdHJl
ZSBOVU1BDQo+ID4gICB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UgZGV2aWNl
IHRyZWUgcHJvY2Vzc29yIG5vZGUNCj4gPiAgIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0
byBwYXJzZSBkZXZpY2UgdHJlZSBtZW1vcnkgbm9kZQ0KPiA+ICAgeGVuL2FybTogaW50cm9kdWNl
IGEgaGVscGVyIHRvIHBhcnNlIGRldmljZSB0cmVlIE5VTUEgZGlzdGFuY2UgbWFwDQo+ID4gICB4
ZW4vYXJtOiB1bmlmaWVkIGVudHJ5IHRvIHBhcnNlIGFsbCBOVU1BIGRhdGEgZnJvbSBkZXZpY2Ug
dHJlZQ0KPiA+ICAgeGVuL2FybTogQWRkIGJvb3QgYW5kIHNlY29uZGFyeSBDUFUgdG8gTlVNQSBz
eXN0ZW0NCj4gPiAgIHhlbi9hcm06IGJ1aWxkIENQVSBOVU1BIG5vZGUgbWFwIHdoaWxlIGNyZWF0
aW5nIGNwdV9sb2dpY2FsX21hcA0KPiA+ICAgeGVuL3g4NjogZGVjb3VwbGUgbm9kZXNfY292ZXJf
bWVtb3J5IHdpdGggRTgyMCBtYXANCj4gPiAgIHhlbi9hcm06IGltcGxlbWVudCBBcm0gYXJjaCBo
ZWxwZXJzIEFybSB0byBnZXQgbWVtb3J5IG1hcCBpbmZvDQo+ID4gICB4ZW46IG1vdmUgTlVNQSBt
ZW1vcnkgYW5kIENQVSBwYXJzZWQgbm9kZW1hc2tzIHRvIGNvbW1vbg0KPiA+ICAgeGVuL3g4Njog
bW92ZSBub2Rlc19jb3Zlcl9tZW1vcnkgdG8gY29tbW9uDQo+ID4gICB4ZW4veDg2OiBtYWtlIGFj
cGlfc2Nhbl9ub2RlcyB0byBiZSBuZXV0cmFsDQo+ID4gICB4ZW46IGV4cG9ydCBiYWRfc3JhdCBh
bmQgc3JhdF9kaXNhYmxlZCB0byBleHRlcm4NCj4gPiAgIHhlbjogbW92ZSBudW1hX3NjYW5fbm9k
ZXMgZnJvbSB4ODYgdG8gY29tbW9uDQo+ID4gICB4ZW46IGVuYWJsZSBudW1hX3NjYW5fbm9kZXMg
Zm9yIGRldmljZSB0cmVlIGJhc2VkIE5VTUENCj4gPiAgIHhlbi9hcm06IGtlZXAgZ3Vlc3Qgc3Rp
bGwgYmUgTlVNQSB1bndhcmUNCj4gPiAgIHhlbjogaW50cm9kdWNlIGFuIGFyY2ggaGVscGVyIHRv
IGRvIE5VTUEgaW5pdCBmYWlsZWQgZmFsbGJhY2sNCj4gPiAgIHhlbi9hcm06IGVuYWJsZSBkZXZp
Y2UgdHJlZSBiYXNlZCBOVU1BIGluIHN5c3RlbSBpbml0DQo+ID4gICB4ZW4veDg2OiBtb3ZlIG51
bWFfc2V0dXAgdG8gY29tbW9uIHRvIHN1cHBvcnQgTlVNQSBzd2l0Y2ggaW4gY29tbWFuZA0KPiA+
ICAgICBsaW5lDQo+ID4gICB4ZW4veDg2OiBtb3ZlIGR1bXBfbnVtYSBpbmZvIGhvdGtleSB0byBj
b21tb24NCj4gDQo+IE1heSBJIHBsZWFzZSBhc2sgdGhhdCB5b3UgZm9sbG93IHBhdGNoIHN1Ym1p
c3Npb24gZ3VpZGVsaW5lcywgaW4gdGhhdA0KPiB5b3Ugc2VuZCBwYXRjaGVzIFRvOiB0aGUgbGlz
dCBhbmQgQ2M6IHJlbGV2YW50IHBlb3BsZS4gRnVydGhlcm1vcmUgSQ0KPiBkb3VidCB0aGF0IEkg
bmVlZCB0byBiZSBvbiBDYzogZm9yIGFsbCA0MCBvZiB0aGUgcGF0Y2hlcy4NCj4gDQoNClRoYW5r
cyBmb3IgeW91ciByZW1pbmRlci4gQmVmb3JlIEkgc2VudCB0aGlzIHNlcmllcywgSSBoYWQgcGFp
ZA0Kc29tZXRpbWUgdG8gY29uc2lkZXIgQ0Mgb3IgVE8geW91LCBJIGZvdW5kIHlvdSBhcmUgaW4g
dGhlIFg4NiBBcmNoLA0KeDg2IG1lbW9yeSBtYW5hZ2VtZW50IG1haW50YWluZXIgbGlzdHMuIEFu
ZCBpbiB0aGlzIHBhdGNoIHNlcmllcywNCkkgaGF2ZSBkb25lIHNvbWUgY2hhbmdlcyB0aGF0IGFm
ZmVjdHMgeDg2LCBzbyBJIGFkZGVkIHlvdSBpbiBUTyBsaXN0Lg0KT2J2aW91c2x5LCBteSB1bmRl
cnN0YW5kaW5nIGhhZCBzb21lIG1pc3Rha2UuIEkgd2lsbCBhZGQgeW91IHRvIENDDQpsaXN0IGlu
IG5leHQgdmVyc2lvbi4NCg0KPiBUaGFua3MgYW5kIHJlZ2FyZHMsDQo+IEphbg0KDQo=

