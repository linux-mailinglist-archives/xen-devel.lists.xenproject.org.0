Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB56CD731
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516142.799791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSco-000538-3u; Wed, 29 Mar 2023 10:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516142.799791; Wed, 29 Mar 2023 10:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSco-00050c-0y; Wed, 29 Mar 2023 10:01:50 +0000
Received: by outflank-mailman (input) for mailman id 516142;
 Wed, 29 Mar 2023 10:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTc=7V=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1phScm-00050W-KS
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:01:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4f206e4-ce18-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 12:01:43 +0200 (CEST)
Received: from DUZPR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::28) by AM9PR08MB6049.eurprd08.prod.outlook.com
 (2603:10a6:20b:2de::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:01:37 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bb:cafe::80) by DUZPR01CA0109.outlook.office365.com
 (2603:10a6:10:4bb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Wed, 29 Mar 2023 10:01:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.20 via Frontend Transport; Wed, 29 Mar 2023 10:01:37 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 29 Mar 2023 10:01:37 +0000
Received: from 857a78d42278.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9A4B248-95D3-48B5-B828-E01E1C239F09.1; 
 Wed, 29 Mar 2023 10:01:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 857a78d42278.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Mar 2023 10:01:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:01:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 10:01:24 +0000
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
X-Inumbo-ID: b4f206e4-ce18-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHnZMbeMZ3PnoU9T9KfP0M6BS5FCYGfEcsoEL51V7PE=;
 b=ig54hKC7gyhM3qWoyp1fwQK5jwaqP327Ehb6N4yzYxiOm2/kDclZ+DkEYyjxLNpFXHDevNuIAP/plpXS9DfVCjuKTWbbKGndDxVrQHnWox6O1TayQomMjpmT2EgJP+bsA7NBFYl5m5XhwhABgv9V5oVYPZtzUbTXKVe1iUo9VT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2063f362ab453502
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLYk30J/DXiQ0CHAm5TxUXW2QVekS8lDuOoBn82g405hWVE8J1/bdwIaqVr4GqAE7FI6mlAKULZ5KapTaWZcILW9s8CASJwbjCEWgt4L5Y/KInutxJ1VEhCwxKrGlnJjOVDvxnoIc/NLJCMgeaF6PFI0IWsMb/3lWS7Z7EjxOJ4Tq9sozQwIix12Edf6D9SovGrY0tR+6hYOIB+N4xASwxM8GQ23X7/6nL3MA5Joy4jC5gLUxVnDFgACM4YouSWI94pywIUrYzHnlrQNaHjDLrpxiatRYOXVm6myI7/zjmqFTUFT+mquHjSi+9r9HRwS/t1T0v2dGzhH79D2g3XTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHnZMbeMZ3PnoU9T9KfP0M6BS5FCYGfEcsoEL51V7PE=;
 b=IJKB6KlYHN2WWSrNd4N25wc8elF/O5to2hjXivPa/Tkb363wbibvlzfWEvDkxOyEI/CgXX0LtJLQi2j9/Dm4x4MLLs3l01sIsRo5bMisG2eXAxdC/pdN+3WGn3ozMmVOO9cVfz/YgVGsHxIYIDxt0SS2g0LyvbJwmuEudJsnw+hyKoOOwM6V3ogmGRrdULA6wNdG30XpGnBpvFNVdGNq7192/WTvp4NiPOr4XzVVEYQIUuL4QyIgQ/JQXUL4CnuhWcih+sB3lywsMFrOm7oPpwLWV138sfCPa8oE3yFI4eSDu/fCeNvXhYmZRSYAbBTwowyZ1JxiU5/Dbg/4plo33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHnZMbeMZ3PnoU9T9KfP0M6BS5FCYGfEcsoEL51V7PE=;
 b=ig54hKC7gyhM3qWoyp1fwQK5jwaqP327Ehb6N4yzYxiOm2/kDclZ+DkEYyjxLNpFXHDevNuIAP/plpXS9DfVCjuKTWbbKGndDxVrQHnWox6O1TayQomMjpmT2EgJP+bsA7NBFYl5m5XhwhABgv9V5oVYPZtzUbTXKVe1iUo9VT8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v4 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZYJtYhPNp4K3qPECnSSUY8aM6MK8P8D+AgAGZUgA=
Date: Wed, 29 Mar 2023 10:01:24 +0000
Message-ID: <D3910D5E-BA1E-40AB-B960-CF8806F0D9E6@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-3-luca.fancellu@arm.com>
 <71f3e78a-aa70-a12f-8380-ab8806cefd39@suse.com>
In-Reply-To: <71f3e78a-aa70-a12f-8380-ab8806cefd39@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7337:EE_|DBAEUR03FT031:EE_|AM9PR08MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 100fa5c8-dbf8-4d16-7992-08db303c95e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cTat4mkavOiYpuDVnPWW9PYP2tw/83qryNERY9Uj45La8FQQTblG1lNg5WEdMaXI5whD/EixOtGodziapLPPX88zQDykxGLJTLNfbJHLx50lIYN+LsKyv7Tal8Yxz8RDJf5zbT+gryY2fnmfUqIY8wsR7Srati6Xs9cm7YbRgKeFZTJyPWPKjLo06MrSaYpSJb4oFJHN/9jhwgBZAQHTcVLOWG0andm/+0AHPot+sr8KGfHkGWldaL3WK8nom1KsWt89Dz2iTgLF6dd8gm7L/9e4FERHacbaK4C1PlEmv/7Bm1BEydlkU87B4T1SFgzbKmwo10SevMTniPJVR86tdNNV6TWnVqIKhGNEGb3LFtrqSLM1N3ooNG+Ane0wMzhziV1RVWANJQAoIkrtKJ4npGUyYVFHe40Ct3YZ8mXrLcKGxiDhLafaSKfPNKYEp0kpIDwOTkz39qfhsuQY1IbuftaTxR3qw/rSF4BpEba2b118ZAf/VzkX7sOnDTlA4wsJ1HJdduVjn9XQBHPRAP0b3j41kKd1fBiN24O5b5HJM+IQZCpCchb0f18GtSPoOL7Kz+Q/nGkk305/T7PxVkhd46bBwXRjgJOHcW1KeEHnIeqmJ74KQlsu5gM1Uwjr7aVIxGgk/R2AOZwDNGH0Bq3k0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199021)(8936002)(6916009)(4326008)(66899021)(41300700001)(122000001)(2906002)(38070700005)(38100700002)(6506007)(5660300002)(8676002)(53546011)(6512007)(26005)(2616005)(83380400001)(33656002)(36756003)(186003)(6486002)(54906003)(316002)(66446008)(66556008)(66946007)(91956017)(64756008)(66476007)(76116006)(71200400001)(86362001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <42181EF41F58214B9AA4FFFEE68D8053@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7499b5f6-a397-4caf-4ec4-08db303c8e22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dsGx+tRXrGvHKolUdfy7ILieUgvE0mLz2rjA9Pv3tOZl+bwhskkGyKDNKGj7+LVfeKJ25/TOYSs03tJ1SMGxz3g/luu3WKKhThB+Alev68Y7xwyMuMQTDjw+sB/OlF0iaqZA/7dq4DgdmCAkmNzfRO57ZrKRPmAIvvF+5zoOMrFPUgmcZnhJvBVf815+dRwf3wmm2QXo/r5PNwEnMb0hbr3yy/dzPnppQCeQONSc2cJBT+u9dDU0eo4MhhQPofFUAV44GHRYGiNeWrEE2N4IeBgNfAdOPLVYqGzRiw54/HZ+L9KXfEeyZ62nmFcGQgSgU4YXLQOkTHLFqy/C2fhMjwf6Lzc7uQ7QVJLJoAkLeVbBOkp/ZT+XCCBpLKR0Ty96uCVfdmB4wNxpAtqyTWDvF+2PgpT9OwslJWNmkdsvrLkhy7GND+1G0boQnSwsMKgHNUOChhnvcwpHWqlh+gT9Pl612O9ZOLW9sIsxs9PEGEP14vHBP4369TMMl3RgiWv9f2a+9db14rvYYYE/pSfjRPUGTj62PcoR2Ziae1Rs4h34YfKTe/1yk30DkcpXAiHbXixXL8K5SYmBU1f2FiEd62fUATJink1L93U5WbvGJ3L0ukqmhFo20S6XvfYZ2R3Y96cyNaENx9lDmuB5rXCn9lSy4UgSvIvdCzfpYRM7f/SnvNwY8M746vYAMzHMEMcCNFJwpEtJ5mijoLfliY2ndA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(66899021)(81166007)(82740400003)(356005)(53546011)(26005)(478600001)(82310400005)(54906003)(316002)(6506007)(36756003)(8676002)(70586007)(70206006)(40480700001)(86362001)(4326008)(41300700001)(6512007)(2616005)(47076005)(6486002)(6862004)(33656002)(336012)(5660300002)(8936002)(40460700003)(2906002)(36860700001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:01:37.3784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100fa5c8-dbf8-4d16-7992-08db303c95e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6049

SGkgSmFuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LCB2ZXJ5IGFwcHJlY2lhdGVkLA0K
DQo+IE9uIDI4IE1hciAyMDIzLCBhdCAxMDozNiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4gDQo+IE9uIDI3LjAzLjIwMjMgMTI6NTksIEx1Y2EgRmFuY2VsbHUgd3Jv
dGU6DQo+PiBAQCAtNDMsOCArNDQsMTYgQEAgcmVnaXN0ZXJfdCBjb21wdXRlX21heF96Y3Iodm9p
ZCkNCj4+IH0NCj4+IA0KPj4gLyogVGFrZXMgYSB2ZWN0b3IgbGVuZ3RoIGluIGJpdHMgYW5kIHJl
dHVybnMgdGhlIFpDUl9FTHggZW5jb2RpbmcgKi8NCj4+IC1yZWdpc3Rlcl90IHZsX3RvX3pjcih1
aW50MTZfdCB2bCkNCj4+ICtyZWdpc3Rlcl90IHZsX3RvX3pjcih1bnNpZ25lZCBpbnQgdmwpDQo+
PiB7DQo+PiAgICAgQVNTRVJUKHZsID4gMCk7DQo+PiAgICAgcmV0dXJuICgodmwgLyBTVkVfVkxf
TVVMVElQTEVfVkFMKSAtIDFVKSAmIFpDUl9FTHhfTEVOX01BU0s7DQo+PiB9DQo+PiArDQo+PiAr
LyogR2V0IHRoZSBzeXN0ZW0gc2FuaXRpemVkIHZhbHVlIGZvciBWTCBpbiBiaXRzICovDQo+PiAr
dW5zaWduZWQgaW50IGdldF9zeXNfdmxfbGVuKHZvaWQpDQo+PiArew0KPj4gKyAgICAvKiBaQ1Jf
RUx4IGxlbiBmaWVsZCBpcyAoKGxlbisxKSAqIDEyOCkgPSB2ZWN0b3IgYml0cyBsZW5ndGggKi8N
Cj4+ICsgICAgcmV0dXJuICgoc3lzdGVtX2NwdWluZm8uemNyNjQuYml0c1swXSAmIFpDUl9FTHhf
TEVOX01BU0spICsgMVUpICoNCj4+ICsgICAgICAgICAgICBTVkVfVkxfTVVMVElQTEVfVkFMOw0K
Pj4gK30NCj4gDQo+IFdvdWxkbid0IHRoaXMgZnVuY3Rpb24gYmV0dGVyIHJldHVybiAwIHdoZW4g
IWNwdV9oYXNfc3ZlPw0KDQpZZXMgSSBhZ3JlZQ0KDQo+IA0KPj4gQEAgLTYwMiw2ICs2MDYsMzEg
QEAgaW50IGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVh
dGVkb21haW4gKmNvbmZpZykNCj4+ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiAgICAgfQ0K
Pj4gDQo+PiArICAgIC8qIENoZWNrIGZlYXR1cmUgZmxhZ3MgKi8NCj4+ICsgICAgaWYgKCBzdmVf
dmxfYml0cyA+IDAgKSB7DQo+IA0KPiBOaXQ6IFN0eWxlIChicmFjZSBwbGFjZW1lbnQpLg0KDQpX
aWxsIGZpeA0KDQo+IA0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHpjcl9tYXhfYml0cyA9IGdl
dF9zeXNfdmxfbGVuKCk7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFjcHVfaGFzX3N2ZSApDQo+
PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlNWRSBp
cyB1bnN1cHBvcnRlZCBvbiB0aGlzIG1hY2hpbmUuXG4iKTsNCj4+ICsgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgICAgIGVsc2UgaWYgKCAhaXNfdmxf
dmFsaWQoc3ZlX3ZsX2JpdHMpICkNCj4gDQo+IElmIHRoaXMgd2FzIGNvZGUgSSdtIHRoZSBtYWlu
dGFpbmVyIGZvciwgSSdkIGFzayBmb3IgdGhlICJlbHNlIiB0byBiZQ0KPiBkcm9wcGVkLiBQbGVh
c2UgY29uc2lkZXIgZG9pbmcgc28sIGFzIGl0IG1ha2VzIG1vcmUgdmlzaWJsZSB0aGF0IHRoZQ0K
PiBlYXJsaWVyIGlmKCkgY2Fubm90ICJmYWxsIHRocm91Z2giLiAoVGhpcyBjb3VsZCB0aGVuIGJl
IGZ1cnRoZXINCj4gc3VwcG9ydGVkIGJ5IGluc2VydGluZyBibGFuayBsaW5lcywgaGVyZSBhbmQg
YWdhaW4gcmlnaHQgYmVsb3cuKQ0KPiANCj4gQXMgdG8gdGhlIGNoZWNrIC0gdGhpcyBiZWluZyB0
aGUgb25seSB1c2VyIG9mIGlzX3ZsX3ZhbGlkKCkgKGF0IHRoaXMNCj4gcG9pbnQpIEknZCBsaWtl
IHRvIG1lbnRpb24gdGhhdCBoYWxmIG9mIHdoYXQgdGhhdCBmdW5jdGlvbiBjaGVja3MgaXMNCj4g
bm93IHBvaW50bGVzcywgYXMgd2UncmUgZGVhbGluZyB3aXRoIGEgZGVjb2RlZCB2YWx1ZS4gRnV0
dXJlIGZ1cnRoZXINCj4gdXNlcnMgbWF5IG5lZWQgdGhlIGZ1bGwgdmFsdWUgY2hlY2tlZCwgYnV0
IGdpdmVuIHRoYXQgYWxsIGludGVyZmFjZXMNCj4gYXJlIG5vdyB1c2luZyBlbmNvZGVkIHZhbHVl
cyB0aGlzIGRvZXNuJ3Qgc2VlbSB2ZXJ5IGxpa2VseS4gSGVuY2UgdGhlDQo+IHJlc3BlY3RpdmUg
cGFydCBvZiB0aGUgY29uZGl0aW9uIHRoZXJlIG1heSB3YW50IHRvIGJlY29tZSBhbg0KPiBhc3Nl
cnRpb24gaW5zdGVhZCAob3IgYmUgZHJvcHBlZCkuDQoNClllcyBJIGNhbiBkbyB0aGF0DQoNCj4g
DQo+IFlldCBhbm90aGVyIHF1ZXN0aW9uIGlzIHdoZXRoZXIgYm90aCByYW5nZSBjaGVja3MgKGFn
YWluc3QNCj4gU1ZFX1ZMX01BWF9CSVRTIGFuZCB6Y3JfbWF4X2JpdHMpIGFyZSBhY3R1YWxseSBu
ZWNlc3NhcnkgLyB1c2VmdWwuDQo+IElpcmMgMjA0OCBpcyBhIGhhcmQgdXBwZXIgYm91bmQsIHNv
IHpjcl9tYXhfYml0cyBiZWluZyBoaWdoZXIgdGhhbg0KPiB0aGF0IHZhbHVlIHNob3VsZCBsaWtl
bHkgbGVhZCB0byBub3QgdXNpbmcgU1ZFIGF0IGFsbCAoaWYgaXQgZG9lc24ndA0KPiBhbHJlYWR5
OyBkaWRuJ3QgY2hlY2spLg0KDQpJIHRoaW5rIHRoZSBjaGVjayBzdmVfdmxfYml0cyA+IHpjcl9t
YXhfYml0cyBpcyBuZWVkZWQgYmVjYXVzZSBmcm9tIA0Kc3ZlX3ZsX2JpdHMgPSBzdmVfZGVjb2Rl
X3ZsKGNvbmZpZy0+YXJjaC5zdmVfdmwpOyBJIGNhbiBnZXQgdmFsdWVzIGFib3ZlIHRoZQ0KbWF4
aW11bSBzdXBwb3J0ZWQgYml0cyAoemNyX21heF9iaXRzKSwgbGF0ZXIgb24gSSB3aWxsIHVzZSB0
aGUgc3RydWN0IGFyY2hfZG9tYWluDQpmaWVsZCBzdmVfdmwgdG8gY29tcHV0ZSB0aGUgc2l6ZSBv
ZiB0aGUgcmVnaXN0ZXJzIHRvIGJlIHNhdmVkL3Jlc3RvcmUNCg0KSXMgdGhlcmUgc29tZXRoaW5n
IEnigJl2ZSBtaXNzZWQgZnJvbSB5b3VyIGNvbW1lbnQ/DQoNCj4gDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlVuc3VwcG9ydGVkIFNWRSB2ZWN0
b3IgbGVuZ3RoICgldSlcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgICBzdmVfdmxfYml0cyk7
DQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgICAgICB9DQo+PiArICAg
ICAgICBlbHNlIGlmICggc3ZlX3ZsX2JpdHMgPiB6Y3JfbWF4X2JpdHMgKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sDQo+PiArICAgICAgICAgICAg
ICAgICAgICAiVGhlIHJlcXVlc3RlZCBTVkUgdmVjdG9yIGxlbmd0aCAoJXUpIG11c3QgYmUgbG93
ZXIgb3IgXG4iDQo+PiArICAgICAgICAgICAgICAgICAgICAiZXF1YWwgdG8gdGhlIHBsYXRmb3Jt
IHN1cHBvcnRlZCB2ZWN0b3IgbGVuZ3RoICgldSlcbiIsDQo+PiArICAgICAgICAgICAgICAgICAg
ICBzdmVfdmxfYml0cywgemNyX21heF9iaXRzKTsNCj4gDQo+IEFnYWluLCBpZiBJIHdhcyB0aGUg
bWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIEknZCBhc2sgZm9yIHRoZSBtZXNzYWdlDQo+IHRvIGJl
IHNob3J0ZW5lZCwgc3VjaCB0aGF0IGl0IGVhc2lseSBmaXRzIG9uIG9uZSBsaW5lLiBFLmcuDQo+
ICJyZXF1ZXN0ZWQgU1ZFIHZlY3RvciBsZW5ndGggKCV1KSA+IHN1cHBvcnRlZCBsZW5ndGggKCV1
KVxuIi4gVGhpcw0KPiB3b3VsZCB0aGVuIGFsc28gYXZvaWQgdGhlIGFwcGFyZW50IGdyYW1tYXIg
aXNzdWUgb2YgImxvd2VyIiBub3QgZml0dGluZw0KPiB3aXRoICJ0byIgKGkuZS4gYSAidGhhbiIg
bmVlZGluZyBpbnNlcnRpbmcsIG9yICJiZWxvdyIgYmVpbmcgdXNlZA0KPiBpbnN0ZWFkKS4NCg0K
WWVzIHRoaXMgc3VnZ2VzdGlvbiBtYWtlcyBzZW5zZSB0byBtZS4NCg0KDQpUbyBhZGRyZXNzIHlv
dXIgY29tbWVudHMgSeKAmW0gZG9pbmcgdGhlc2UgbW9kaWZpY2F0aW9ucyB0byB0aGUgcGF0Y2gs
IEkgaG9wZQ0KdGhleSBjYXB0aW9uIGFsbCB5b3VyIGZlZWRiYWNrczoNCg0KZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYyBiL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KaW5k
ZXggM2MzYWRmYjVjNmJkLi43OGY3NDgyNjE5ZGEgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0v
YXJtNjQvc3ZlLmMNCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KQEAgLTUzLDYgKzUz
LDkgQEAgcmVnaXN0ZXJfdCB2bF90b196Y3IodW5zaWduZWQgaW50IHZsKQ0KIC8qIEdldCB0aGUg
c3lzdGVtIHNhbml0aXplZCB2YWx1ZSBmb3IgVkwgaW4gYml0cyAqLw0KIHVuc2lnbmVkIGludCBn
ZXRfc3lzX3ZsX2xlbih2b2lkKQ0KIHsNCisgICAgaWYgKCAhY3B1X2hhc19zdmUgKQ0KKyAgICAg
ICAgcmV0dXJuIDA7DQorDQogICAgIC8qIFpDUl9FTHggbGVuIGZpZWxkIGlzICgobGVuKzEpICog
MTI4KSA9IHZlY3RvciBiaXRzIGxlbmd0aCAqLw0KICAgICByZXR1cm4gKChzeXN0ZW1fY3B1aW5m
by56Y3I2NC5iaXRzWzBdICYgWkNSX0VMeF9MRU5fTUFTSykgKyAxVSkgKg0KICAgICAgICAgICAg
IFNWRV9WTF9NVUxUSVBMRV9WQUw7DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5j
IGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQppbmRleCA3MTgyZDQ1NjdiZjAuLmMxZmIzMGRmYzVl
ZiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KKysrIGIveGVuL2FyY2gvYXJt
L2RvbWFpbi5jDQpAQCAtNjA3LDcgKzYwNyw4IEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9j
b25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQogICAgIH0NCiAN
CiAgICAgLyogQ2hlY2sgZmVhdHVyZSBmbGFncyAqLw0KLSAgICBpZiAoIHN2ZV92bF9iaXRzID4g
MCApIHsNCisgICAgaWYgKCBzdmVfdmxfYml0cyA+IDAgKQ0KKyAgICB7DQogICAgICAgICB1bnNp
Z25lZCBpbnQgemNyX21heF9iaXRzID0gZ2V0X3N5c192bF9sZW4oKTsNCiANCiAgICAgICAgIGlm
ICggIWNwdV9oYXNfc3ZlICkNCkBAIC02MTUsMTcgKzYxNiwxOCBAQCBpbnQgYXJjaF9zYW5pdGlz
ZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0K
ICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJTVkUgaXMgdW5zdXBwb3J0ZWQgb24g
dGhpcyBtYWNoaW5lLlxuIik7DQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQogICAgICAg
ICB9DQotICAgICAgICBlbHNlIGlmICggIWlzX3ZsX3ZhbGlkKHN2ZV92bF9iaXRzKSApDQorDQor
ICAgICAgICBpZiAoICFpc192bF92YWxpZChzdmVfdmxfYml0cykgKQ0KICAgICAgICAgew0KICAg
ICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJVbnN1cHBvcnRlZCBTVkUgdmVjdG9yIGxl
bmd0aCAoJXUpXG4iLA0KICAgICAgICAgICAgICAgICAgICAgc3ZlX3ZsX2JpdHMpOw0KICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KICAgICAgICAgfQ0KLSAgICAgICAgZWxzZSBpZiAoIHN2
ZV92bF9iaXRzID4gemNyX21heF9iaXRzICkNCisNCisgICAgICAgIGlmICggc3ZlX3ZsX2JpdHMg
PiB6Y3JfbWF4X2JpdHMgKQ0KICAgICAgICAgew0KICAgICAgICAgICAgIGRwcmludGsoWEVOTE9H
X0lORk8sDQotICAgICAgICAgICAgICAgICAgICAiVGhlIHJlcXVlc3RlZCBTVkUgdmVjdG9yIGxl
bmd0aCAoJXUpIG11c3QgYmUgbG93ZXIgb3IgXG4iDQotICAgICAgICAgICAgICAgICAgICAiZXF1
YWwgdG8gdGhlIHBsYXRmb3JtIHN1cHBvcnRlZCB2ZWN0b3IgbGVuZ3RoICgldSlcbiIsDQorICAg
ICAgICAgICAgICAgICAgICAiUmVxdWVzdGVkIFNWRSB2ZWN0b3IgbGVuZ3RoICgldSkgPiBzdXBw
b3J0ZWQgbGVuZ3RoICgldSlcbiIsDQogICAgICAgICAgICAgICAgICAgICBzdmVfdmxfYml0cywg
emNyX21heF9iaXRzKTsNCiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiAgICAgICAgIH0N
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmggYi94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmgNCmluZGV4IDgwMzdmMDliNWIwYS4uZThj
MDFhMjRlNmRhIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3N2
ZS5oDQorKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmgNCkBAIC0xNiw3
ICsxNiw5IEBADQogc3RhdGljIGlubGluZSBib29sIGlzX3ZsX3ZhbGlkKHVuc2lnbmVkIGludCB2
bCkNCiB7DQogICAgIC8qIFNWRSB2ZWN0b3IgbGVuZ3RoIGlzIG11bHRpcGxlIG9mIDEyOCBhbmQg
bWF4aW11bSAyMDQ4ICovDQotICAgIHJldHVybiAoKHZsICUgU1ZFX1ZMX01VTFRJUExFX1ZBTCkg
PT0gMCkgJiYgKHZsIDw9IFNWRV9WTF9NQVhfQklUUyk7DQorICAgIEFTU0VSVCgodmwgJSBTVkVf
VkxfTVVMVElQTEVfVkFMKSA9PSAwKTsNCisNCisgICAgcmV0dXJuIHZsIDw9IFNWRV9WTF9NQVhf
QklUUzsNCiB9DQogDQogc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgc3ZlX2RlY29kZV92bCh1
bnNpZ25lZCBpbnQgc3ZlX3ZsKQ0KDQo+IA0KPiBKYW4NCg0K

