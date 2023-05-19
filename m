Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9E7095FC
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 13:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536985.835730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzy0N-0005ZE-0Q; Fri, 19 May 2023 11:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536985.835730; Fri, 19 May 2023 11:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzy0M-0005W4-Su; Fri, 19 May 2023 11:10:38 +0000
Received: by outflank-mailman (input) for mailman id 536985;
 Fri, 19 May 2023 11:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pzy0K-0005Vu-Ro
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 11:10:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6609db4-f635-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 13:10:34 +0200 (CEST)
Received: from AS9P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::9)
 by VE1PR08MB5728.eurprd08.prod.outlook.com (2603:10a6:800:1a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 11:10:31 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::e9) by AS9P251CA0007.outlook.office365.com
 (2603:10a6:20b:50f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 11:10:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 11:10:30 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 19 May 2023 11:10:30 +0000
Received: from 62848bcf881c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A5908B4-1D24-4C4B-84C4-EE0EB33623C0.1; 
 Fri, 19 May 2023 11:10:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62848bcf881c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 May 2023 11:10:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9713.eurprd08.prod.outlook.com (2603:10a6:20b:607::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 11:10:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 11:10:16 +0000
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
X-Inumbo-ID: c6609db4-f635-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzdU8G0j7JJ8NyWlHgRsEf2AwWK9aby/sOqP4FNFMc8=;
 b=p7g+aS3kKrhywn1w3vHFW05qXAgxUVFYdwFAPzubdKHqkwjJChhd2P2MhGIcph939XHUNXaFuEGefXJyt/5uxe6D825cHL7NRqcmZTcQ9y5sqB5yupu3yLdfQP1kI73nUnlBJMzeq3qzBfu+F5Jdnh7ypbQBiLau0HldkxoDuBo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ef959593854b2fa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJZ7sDTO4NyLK+ndBOMm/SBTC60lC4o8gbpZpAfb+0ChflScBt17PGbthDH4NW6QnRcm+6VqgSDuvupEtsA1+nv7IEbb2BAruZBXDsfakYtGhqMF1zOBpEwegUWNGB0MBqe+nw1rnDr6LDoPsQj793d5KCTIAekJL1H2T9Q4xyJtwAsmZa8AKm3Ivdd783ulfvw5IheDAGsZ4AkB5kMWvP6ga43mKS59NfvePZ6dIDvEz/Et2rIoywsTOQ4Fp7G1M4bjJkH1aKODZqBKpF5pwuy+LalmZr7Z6wtmhS6VgHVsBRZx00VJmWTAipabpIY0ut4NE7S9GepTBrTvP4Qrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzdU8G0j7JJ8NyWlHgRsEf2AwWK9aby/sOqP4FNFMc8=;
 b=IOmmycFuqGMHquMk/vWtKXUkfAvO17UCCq5x6asNpnd/wYR1dqXr9YUvgCOikPz2nz8gCAx9wH9+FTCcYJpDtuoWFZEH3kBaYr74E4kBXCsurFPMZtcef29orjfd/qTueYWlAzqw4EWI2j5FKnqvC4wZbElHaH3TYsktiUdyde8AQ5HGnJIb35pfYwtEqzNSeCaTkI/f9QHSMjHv38DnoGgCVpWQACpLm4FSK2tR+xhyrNrKGLR4d1OumRW0k3X8XezHzx202JjGorlERfdLas7v5ggIDtLgikzvDw/eIPr09kOGXoR2J+z/E+KkxLdgDZUA88rwmDuPZYbvTWqO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzdU8G0j7JJ8NyWlHgRsEf2AwWK9aby/sOqP4FNFMc8=;
 b=p7g+aS3kKrhywn1w3vHFW05qXAgxUVFYdwFAPzubdKHqkwjJChhd2P2MhGIcph939XHUNXaFuEGefXJyt/5uxe6D825cHL7NRqcmZTcQ9y5sqB5yupu3yLdfQP1kI73nUnlBJMzeq3qzBfu+F5Jdnh7ypbQBiLau0HldkxoDuBo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/misra: add diff-report.py tool
Thread-Topic: [PATCH 1/2] xen/misra: add diff-report.py tool
Thread-Index: AQHZijbarhOmFRE5RUW1W8RyRgYzra9ha/uAgAAEhIA=
Date: Fri, 19 May 2023 11:10:16 +0000
Message-ID: <4BCB4841-3E13-468E-BB89-E72EDFF9D3E1@arm.com>
References: <20230519094613.2134153-1-luca.fancellu@arm.com>
 <20230519094613.2134153-2-luca.fancellu@arm.com>
 <94cc53ec-17c4-6ec7-7f13-e4f0f9e31e2d@suse.com>
In-Reply-To: <94cc53ec-17c4-6ec7-7f13-e4f0f9e31e2d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9713:EE_|AM7EUR03FT031:EE_|VE1PR08MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a63b69-4e37-4b93-e65e-08db5859a859
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S/1fRWkP0LkEL4cq0FMsa+A7zf+JerpLCYokfiWmhLqVJgn4f5IBrbQJviKG6M9CFAB+REno8NKx5yvFAA0bdGxWWKyhq8aMNvoMHJEtuolfA5dDnB4rIm4Cnruc7t7wj2swNLU682+VeGBkg6eec5ZApo4ibX5eU9sbtEibvaBcrwPCw+F5hp1UthixQbib2SRhKwfOBY8gmr7InzasI+9WiL7HQhw5BIVR2txjycRNYBnh5ji/obiZw3PRs8FwQjluHbJqJpg/qmsw/Jo7tf2z18IgOytzEMEFEaDkBnQZr270PIA3xktGAvwZNv0XfAQvir6hscWH2bNvWqfLsxmhype3zEdcPunL9/OmjOr+lNmgWsa2jcRiSBoKjMdzT9qv00Efbut+tay0f3Fn+VWwefsVCWGnqRHgV178oDUWts0Wm8lpLZ6k25wSXNXE8Qsx9yeoo32DwosaBMGUvd5UP+akzwQB1z1mDAlaZ2RWEsqJnzrvgyzv1UNABYhYzGwbNKGACbe6kcEI7OobDVQrXxXJ3dx8Y18UOQR1rOiC9FQFQpmYztq8q3f1IhxYxZOrtgVzklB327wdqletn0//ntL6q4th8Qk6q/YdcPYzrt7ob1fvoYsmH+H843KCPS9d6+aszIIVZRE8B/4T9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199021)(71200400001)(6486002)(41300700001)(26005)(6506007)(6512007)(53546011)(38100700002)(5660300002)(2616005)(36756003)(186003)(38070700005)(2906002)(33656002)(86362001)(122000001)(8676002)(8936002)(478600001)(6916009)(66946007)(66446008)(64756008)(66556008)(76116006)(66476007)(4326008)(91956017)(54906003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01CED32C5C31714E94B3034808742752@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9713
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8553e973-e9f5-4cda-cbe1-08db5859a050
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmadSVlJ53dyI5pUDnEXbmC48lXG8hmeb06iyO2crLxVTsQphw61ocVs52hYaNy4GRc2Sv7LPk20M3gpS3u87Ll9x22JCqq0WWjl3ALbWmrIGZHgBDjcWwhx36EgniFmiWIexcobGq10M11yOo8JKjiUPkpue+WGyK8ooTudiny1hRHr4qdEp/i9yKwroamk3Hk5ye6tDnlDD19rmIxmIfEUxQlmARNBzlnTCpry0ubakG4mc9vo0xI81epwARlbDbSm2hpLrJTljPX9C99AzdO9BA4RAocBAMceAld7v1PaeVfNBRbDwOyaWyGgL85LPqQ4ifV5HsIguBcmWRzFJi33M3WiErhntaTSpyX1nYshiyaqnyyh65V65b9Xg1yxuJGdlp+IoidwIeAbLf3U94PfZWr8w4xImXtxfrSXvyWO9KB1EHop4gnnvswinJC5ZIjznyAtL7bVMWK34yF4O97lUgRjTA90DfXuO6FnByk6ZIbvriSd5wHq2ZKT2ASliW6bP/e0+8enjVolRV+zWH3CArTG8tbYfqNJ9fnrjJ2OIdLLG8zgngYvXkEhTbIodZvJWbGk9NJAOtXXNFlMk4BXUkH/vb5UPaCRxkHcJwEjxd5AbRJ4qMnhFRXhiIz2z0j+MdZ/aPKJ065cMf9wFkfwTGmv7/NmvDeYoI/ZTky2nsYnOO9RBChAtHdyH38B0wW/dSLTuWU2CF2uQ0EpM3HO7HoX+UZghuMlaVScZ7w=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(186003)(6512007)(40480700001)(33656002)(2906002)(6486002)(478600001)(82310400005)(86362001)(54906003)(36756003)(53546011)(82740400003)(81166007)(40460700003)(356005)(26005)(6506007)(41300700001)(316002)(8676002)(2616005)(70206006)(70586007)(6862004)(8936002)(4326008)(47076005)(336012)(36860700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 11:10:30.2229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a63b69-4e37-4b93-e65e-08db5859a859
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5728

DQoNCj4gT24gMTkgTWF5IDIwMjMsIGF0IDExOjUzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMDUuMjAyMyAxMTo0NiwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEFkZCBhIG5ldyB0b29sLCBkaWZmLXJlcG9ydC5weSB0aGF0IGNhbiBiZSB1c2Vk
IHRvIG1ha2UgZGlmZiBiZXR3ZWVuDQo+PiByZXBvcnRzIGdlbmVyYXRlZCBieSB4ZW4tYW5hbHlz
aXMucHkgdG9vbC4NCj4+IEN1cnJlbnRseSB0aGlzIHRvb2wgc3VwcG9ydHMgdGhlIFhlbiBjcHBj
aGVjayB0ZXh0IHJlcG9ydCBmb3JtYXQgaW4NCj4+IGl0cyBvcGVyYXRpb25zLg0KPj4gDQo+PiBU
aGUgdG9vbCBwcmludHMgZXZlcnkgZmluZGluZyB0aGF0IGlzIGluIHRoZSByZXBvcnQgcGFzc2Vk
IHdpdGggLXINCj4+IChjaGVjayByZXBvcnQpIHdoaWNoIGlzIG5vdCBpbiB0aGUgcmVwb3J0IHBh
c3NlZCB3aXRoIC1iIChiYXNlbGluZSkuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFu
Y2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBmcm9tIHYx
Og0KPj4gLSByZW1vdmVkIDIgbWV0aG9kIGZyb20gY2xhc3MgUmVwb3J0RW50cnkgdGhhdCBsYW5k
ZWQgdGhlcmUgYnkgYQ0KPj4gICBtaXN0YWtlIG9uIHJlYmFzZS4NCj4+IC0gTWFkZSB0aGUgc2Ny
aXB0IGNvbXBhdGlibGUgYWxzbyB3aXRoIHB5dGhvbjIgKFN0ZWZhbm8pDQo+PiAtLS0NCj4+IHhl
bi9zY3JpcHRzL2RpZmYtcmVwb3J0LnB5ICAgICAgICAgICAgICAgICAgICB8ICA4MCArKysrKysr
KysrKysrKw0KPj4gLi4uL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wvX19pbml0X18ucHkgICAgICAg
IHwgICAwDQo+PiAuLi4veGVuX2FuYWx5c2lzL2RpZmZfdG9vbC9jcHBjaGVja19yZXBvcnQucHkg
fCAgNDQgKysrKysrKysNCj4+IHhlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wvZGVi
dWcucHkgICB8ICA0MCArKysrKysrDQo+PiB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvZGlmZl90
b29sL3JlcG9ydC5weSAgfCAxMDAgKysrKysrKysrKysrKysrKysrDQo+PiA1IGZpbGVzIGNoYW5n
ZWQsIDI2NCBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA3NTUgeGVuL3NjcmlwdHMv
ZGlmZi1yZXBvcnQucHkNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vc2NyaXB0cy94ZW5fYW5h
bHlzaXMvZGlmZl90b29sL19faW5pdF9fLnB5DQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Nj
cmlwdHMveGVuX2FuYWx5c2lzL2RpZmZfdG9vbC9jcHBjaGVja19yZXBvcnQucHkNCj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvZGlmZl90b29sL2RlYnVnLnB5
DQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2RpZmZfdG9v
bC9yZXBvcnQucHkNCj4gDQo+IElmIEknbSBub3QgbWlzdGFrZW4gUHl0aG9uIGhhcyBubyBpc3N1
ZSB3aXRoIGRhc2hlcyBpbiBwYXRoIG5hbWVzLg0KPiBIZW5jZSBpdCB3b3VsZCBvbmNlIGFnYWlu
IGJlIGJldHRlciBpZiB0aGUgdW5kZXJzY29yZXMgd2VyZSBhdm9pZGVkDQo+IGluIHRoZSBuZXcg
ZGlyZWN0b3J5IG5hbWVzLg0KDQpIaSBKYW4sDQoNCkZyb20gd2hhdCBJIGtub3cgcHl0aG9uIGNh
buKAmXQgdXNlIGltcG9ydCBmb3IgbW9kdWxlIHdpdGggZGFzaGVzIGluIHRoZSBuYW1lLCB1bmxl
c3MNCnVzaW5nIHNvbWUgdHJpY2tzLCBidXQgaWYgYW55b25lIGtub3dzIG1vcmUgYWJvdXQgdGhh
dCBwbGVhc2UgY29ycmVjdCBtZSBpZiBJ4oCZbSB3cm9uZy4NCg0KVGhlIHN0eWxlIGd1aWRlIGZv
ciBweXRob24gKGh0dHBzOi8vcGVwcy5weXRob24ub3JnL3BlcC0wMDA4LyNwYWNrYWdlLWFuZC1t
b2R1bGUtbmFtZXMpDQpTYXlzOg0KDQpNb2R1bGVzIHNob3VsZCBoYXZlIHNob3J0LCBhbGwtbG93
ZXJjYXNlIG5hbWVzLiBVbmRlcnNjb3JlcyBjYW4gYmUgdXNlZCBpbiB0aGUgbW9kdWxlDQpuYW1l
IGlmIGl0IGltcHJvdmVzIHJlYWRhYmlsaXR5LiBQeXRob24gcGFja2FnZXMgc2hvdWxkIGFsc28g
aGF2ZSBzaG9ydCwgYWxsLWxvd2VyY2FzZSBuYW1lcywNCmFsdGhvdWdoIHRoZSB1c2Ugb2YgdW5k
ZXJzY29yZXMgaXMgZGlzY291cmFnZWQuDQoNClNvLCB5ZXMsIHRoZSB1c2UgaXMgZGlzY291cmFn
ZWQsIGJ1dCBoZXJlIEkgdGhpbmsgaXQgaW1wcm92ZXMgdGhlIHJlYWRhYmlsaXR5LiBVbmxlc3Mg
d2Ugd2FudA0KdG8gdXNlIOKAnGRpZmZ0b29s4oCdIGluc3RlYWQgb2Yg4oCcZGlmZl90b29s4oCd
IGFuZCDigJxjcHBjaGVja3JlcG9ydOKAnSBpbnN0ZWFkIG9mIOKAnGNwcGNoZWNrX3JlcG9ydOKA
nS4NCg0KQ2FuIEkgYXNrIHRoZSByZWFzb24gd2h5IHdlIG5lZWQgdG8gYXZvaWQgdW5kZXJzY29y
ZXMgaW4gZmlsZSBuYW1lcz8NCg0KPiANCj4gSmFuDQoNCg0K

