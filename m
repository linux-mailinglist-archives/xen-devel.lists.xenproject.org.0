Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E88C4D5F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721187.1124394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6n0s-0005gF-2u; Tue, 14 May 2024 07:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721187.1124394; Tue, 14 May 2024 07:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6n0s-0005e6-0I; Tue, 14 May 2024 07:55:54 +0000
Received: by outflank-mailman (input) for mailman id 721187;
 Tue, 14 May 2024 07:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXVB=MR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s6n0r-0005e0-1y
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:55:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62043398-11c7-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:55:52 +0200 (CEST)
Received: from AS9PR05CA0211.eurprd05.prod.outlook.com (2603:10a6:20b:494::13)
 by PA6PR08MB10737.eurprd08.prod.outlook.com (2603:10a6:102:3d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 07:55:48 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:494:cafe::7d) by AS9PR05CA0211.outlook.office365.com
 (2603:10a6:20b:494::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 07:55:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Tue, 14 May 2024 07:55:48 +0000
Received: ("Tessian outbound 082664cc04c1:v315");
 Tue, 14 May 2024 07:55:48 +0000
Received: from db70ad9e55eb.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A3AF8A9-74BC-4200-A369-997E56741677.1; 
 Tue, 14 May 2024 07:55:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db70ad9e55eb.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 May 2024 07:55:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7887.eurprd08.prod.outlook.com (2603:10a6:20b:52b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 07:55:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 07:55:33 +0000
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
X-Inumbo-ID: 62043398-11c7-11ef-909d-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oF2ReOiUB/0d3n9dvrzM+G+KKqq+tlCQHTGqYZlxYY1LlgL7tpDcBYPZ9XcI/D5QkdCMyybf0g5FJOGLA5tCnZYOACqXf66tinzIGBZ8SpYLG8Kvs0H594iYeC4awK+VME0hws6q+NAaaVFojUy88orDPIGXZ/Wrs+MzgRUP2GaaRnWAVR67ODbvf1W4r/KDfr/N0PcTms90JTMRdSfcHlc/clCgOCgDf1J78vI0Bgr+gIqIBlfiYbDlLvt6P/DISjJ2Kaw/tvS7DunLTOAgjsAYmoKi6xp+uSLWRmrEktKf+nvVmf02LWaqwClZFm11aHb4Dnst0yyeFuVWce1+ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ew+847jKNwKKO056iCqVpSt2bYtNQ767IWILIMJ9gA=;
 b=lhD3PL7mdDLtmqb+4xfdqILAWGuO3vX3fTdKXWX4HVFmREhNL3YYkgvqHs4hcQ7i4/QXKG6jlWskojyaeJUy99X9Bx9OIYgAe1l2uiYnvJq1NqjdB1eNBUwhAXESJBfhIFI+ZCYhNPk9uqH2Kke73HsKFQXzWKMwzcZ/vSEe/4crKf0LpTQ/5xj+6F7Vssc9gEBINDkyNnrkHxCVJ/YxxIK85Ra9uHrKhgnO8cHfPwN1u1KUQmR+VEhG/yd9sUAL4+Gx2LT3Kx4VcxgFZ622SxLw05JSvoaiafVnweKQD/ucMMxmZwdbzUvwNqNuVixR589yU6/71VD1FzNy8S75Fw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ew+847jKNwKKO056iCqVpSt2bYtNQ767IWILIMJ9gA=;
 b=kzWIt3s12pWO5CIlhHPLqrcDUq+kaeo7Ezrud9lmNc+nYUMOJC8B3nx2gbvxb2RKyGytn5m801ee+pIythljDQxVL3LSuJ89q1JdkBV04hLU7EdozRaTUtYdkO+LO4X6xci30quX65wCctuQDz9dEHFW35I9L0HIShhnr3xoC2c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: da6083fd78f3b55d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbwsl4j2EZOPcub1YkwM23Mdh+5Xt+v2G0KQoez6ljmAepV7n47E+uXISKx0vAtTL5u+zBBMNh8QDyG6htBikhrLcvDj8zntHR/iZ6SihkC9MUNDwvFlqdWO4w42FA/AtJbnCXlYoIwVne0uIZOpgn9pU6qXXykbpgXJzNaYufUcAFelVsape6AifWyeDIgBqj2fPCqEPuMPlx9CSQOsuyt/aHOAkIdh+TwI0AhvpA+lJWF9Fv+Lx31/b2pJQLJCs0fonC7kmNJRLta2I8c/W3YrDhAhFKDpxCNT4i8riU0zgwt/Nt+cCyDZzNm8CU7n9UZqzW6t+6xhrPo1wCdAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ew+847jKNwKKO056iCqVpSt2bYtNQ767IWILIMJ9gA=;
 b=cFt374c40yLJbllJc3i4lJWaSMQNU+YnsApLoWVprv19IpST95M0ChgfWOi5DoOa5K7++QtvbiFG+qr26EAJ00WLLRH2Te3HVDzUPlrGiCERdy0O1z5B56Tu7+1bJSUi29ZSKaTYJ6HXAnjbsO3mPCpfeW3WJRnuzYjTndJlEJpA0t0pzselH/QsxMWf7joY2FTbsgCzb6sb+ULBbZZByF2VZfSIlivQp7Wods0z+Hc3rlGXcWca0mJvD5EE/qYTZqlJSMYghfST3yGQSAi3RjJvkoomYtHfdH8Pd6NDw0DiRSSwHjHJfyGN4ydB1R5UVMuC/WgnU+OH+/f/VQhmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ew+847jKNwKKO056iCqVpSt2bYtNQ767IWILIMJ9gA=;
 b=kzWIt3s12pWO5CIlhHPLqrcDUq+kaeo7Ezrud9lmNc+nYUMOJC8B3nx2gbvxb2RKyGytn5m801ee+pIythljDQxVL3LSuJ89q1JdkBV04hLU7EdozRaTUtYdkO+LO4X6xci30quX65wCctuQDz9dEHFW35I9L0HIShhnr3xoC2c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Thread-Topic: [PATCH 3/7] xen/p2m: put reference for superpage
Thread-Index:
 AQHalVftK+2d6c8qh0SLUJVfhafWO7GL2AEAgAACwYCAAhGEAIAAEkYAgACocwCAABsXAIAAGy0AgAAMPQCAAAzdAIACI5OAgAVjhYA=
Date: Tue, 14 May 2024 07:55:33 +0000
Message-ID: <03410419-DEBC-4C73-89B0-0E04EA36070C@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
 <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org> <ZjyFxrvHJ04ZlBGg@macbook>
 <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org> <ZjyzTCOSeNvPq2Np@macbook>
 <37b842c7-c46e-4948-8139-a07bfc2a6f37@xen.org> <ZjzIWsoRmgmWkgGh@macbook>
 <e1cf9c7c-581d-4bec-acaf-654d40b7ac07@xen.org>
In-Reply-To: <e1cf9c7c-581d-4bec-acaf-654d40b7ac07@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7887:EE_|AM3PEPF00009BA2:EE_|PA6PR08MB10737:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb5efd6-a573-4eff-7c7a-08dc73eb4482
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Uk5mcWZVZURtQ2lrYUUzZGtPTWlLY1VqeHVmd2RGR1hyMGZMNmlZK3NSenZh?=
 =?utf-8?B?bkRVYVV2akJwdXo2YkFZM1JscHQ0ZW95U2w1SjRIM3U2dk0rdGRJS2lJaVgr?=
 =?utf-8?B?TGlFRU4xVlNIR2V2KzRVODZZK29EL2xkdm9Nek9salVSU2ZBdzJFVVRjdlNo?=
 =?utf-8?B?M2t6STRWSEZiNWZ5YzlzTVBCSFVXajBHN2NJTjdhd0ErbGpVMnd0NmtkaHZl?=
 =?utf-8?B?YlRQS0NEa1hGbUVSOVh4Q2p1U3I3VlUxVTl6R0prcHVlUW8xU1dkZGxsaWtL?=
 =?utf-8?B?cDB5ZExQMjlLa3Z6YlNLZmp4RzFLZWRnWUVRWG1mWUpsV2oyNzAxUU5jYlhv?=
 =?utf-8?B?YjFOYkZ3bDV3czE0STV4Yzk4ZFYyUkxsRFlKQm1zTHFKd3krelBvYm1UY2R0?=
 =?utf-8?B?U3c3WERyY3ZaMkZXbUgwSlBjVDdjTjRYbmxmQVRVQTV6TFZvMnlOemZZbnYw?=
 =?utf-8?B?TnVKYW1Zc0JtMXRFQ3FFemNZNENKMjZmWlRGQ3FQVkE4NjJnTDA2R25YWTUy?=
 =?utf-8?B?bGREdjc5T2xUY0ZkaGFVdUdETkhoTG5Sb1ZHZnJhNUtoQ1A1ZzU3dndzQUtF?=
 =?utf-8?B?UzJSbDZhL21XZGtLWmpTUjhyek9hVE5YK3BDOEhkQWc2NFVkaUVDbmhiWE1P?=
 =?utf-8?B?RXZBQ3VIWWFTaEMyS3NhSjhCcURpVm1YVWRwOUUrRXBScjd5RHNsaVhaVmRj?=
 =?utf-8?B?UWhabzRQT1liS3ppTEdlUk5idTZVaGNJbnBmZG1wWmtGczQ5aWVGNmlmakda?=
 =?utf-8?B?V2d0aGZZMVViVVJ1a1hLUk9ST2M2N3dQTlZSMC91MGdqWjlRSFJmWXZrMVV0?=
 =?utf-8?B?SVd3VVNmL3pyWk1Ob01yYmsvcFhDNDVNSm9zdFlrVzUxejU4WENPRThJa1VJ?=
 =?utf-8?B?L1UrZmljeFZGcDM2eElEQ0NqTWtpZ2NuMnJ3T0NkRUQyQllJZTdBdmZjSDFr?=
 =?utf-8?B?KzVaT3dOZG1wYllMdGxPelBuQkJsRWtNS3F4SXQyaGRWQm9aenVuQm5IdXN6?=
 =?utf-8?B?eTBVVG95aUZld3dUM1JWZ0tOeUJRRHRpMVVMcnJQK1VjZVN6TVRvdWttVW9q?=
 =?utf-8?B?MFdZdWFJdk91VTlOSm9uZmdoVktvakF0NkZVeUkwYjdMdFdOK0YzeisrQkpj?=
 =?utf-8?B?L09Qd2ZBWlpPQTJlVWYzcWZzeUpVUWFpcVN2UUVOMlBVWjh3ZDRTbVpSQU9m?=
 =?utf-8?B?NEpKamt2aENyRHZGR2NTSlZKR2lpSWRraFk2cW9sRWJmd0VIS0VuazV3S1pC?=
 =?utf-8?B?M3R3VVZvN3p4UEsxYU9mMi9mZWhUTGUwdHdoR1YxblV0NjBGMDVkdkRiSGdu?=
 =?utf-8?B?U1FhNnFqQTNJVEZNV3p0NVZEdW9TMDRjUWdyc0Q2dmRjUTRqQklHSFROTTBl?=
 =?utf-8?B?R2xId2FOc0piSEhRZHNvTWRJU0NsRG5QTnZnbEo0cVB3MXpEOW5hbk5vY1lJ?=
 =?utf-8?B?Q2l3czRLNWszRkt0dm0yWDNwWEoxdnN5NHpaQ3FtcmhENk5qR1pYelgyNW1p?=
 =?utf-8?B?ODRrSDhTVng5R0R6S3dmekV6L1ZRYnNnaDIwVjJjQ2lyVXY0d2FBVGFaamxI?=
 =?utf-8?B?N1JmMjJnbHZSR1dEYk5hOGFZK2hwcGkzanNRUXVzWW83akFyREI0Nm92dFJ3?=
 =?utf-8?B?R3dXR2YzdE1vSkVEaVh0NXRHb3hranlHelhjeHpFb1crSUZQRTRwTGVmS0Z4?=
 =?utf-8?B?QUxnVkZNbnEyUVFlN2NtRnNTWWR1a0RxUlBmQUhPRFlaYjJrTWF5a3FUbWZT?=
 =?utf-8?B?U3MxcFh5SVBxKzlvalR0RVdObjJpcHNidldjZi9HSkM5TXA0TUN4YktjcFRx?=
 =?utf-8?B?RmNra1hFVVlncGZhVXRxUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CA6AE040F90F747AD052AD1685E6822@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7887
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4c6c218-d275-419f-2738-08dc73eb3bee
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFlTa2h1UTVQMVl1V3JQdzJDM2pFQllYVW96bjNhZ2pRR3FEODdNSWVRVzgw?=
 =?utf-8?B?eFRNaHRKN21PakJmekJ2WEpGb1E1Q1ZkalBxMmoxWUNIZFI1N0NLSjdZeFV2?=
 =?utf-8?B?TFg1Qk1VblZWaU1BeUNzVXlZV2p5anpnZnRPdVRZNXUxSCs2YWM2VWk4ZXdj?=
 =?utf-8?B?UW1mSHluMGkxK3R2cDVST1FiL05LUjhpM09kbFAwckFpTkN3aElPbCs1ZWU1?=
 =?utf-8?B?NWNuYjFuR2VzQ2p0V1dROVVTWU95TmtPS01IZ2NiUmp0WDN2c1RUWWUyZ29z?=
 =?utf-8?B?RXYrNUhEbVRYMGZWZ1NlcTdic0M4REVHMnhjZy9JMlNmdTViTFl1VXVNUXI1?=
 =?utf-8?B?N3ZNK2lONnZEU3FTazhtNmdCZFNnOUxEUXh4QVE3bVFUcE1SaVhhT2NtVVFK?=
 =?utf-8?B?NlUxWDdvYTFnUnBSZktpeUdGR0dWdXhJdHYvTEpNQXVKTFEzY2pENU1JQnl2?=
 =?utf-8?B?MVFvRmwwVDQ1eC9BYklHVkMxTmJ3cVpHcDRiYUtVU2k2MTkrTzdsempQc3ox?=
 =?utf-8?B?UE9yWUlkcFgxUDlDcHpDVWxiVmtLdmw2M1VJN1dLK2I2UWczL0h1OHJJVnZK?=
 =?utf-8?B?S2tsV2poNUhBb0s0NzFkTFRRUmxyZGZDQmYxYnhqcWE3eUVLaDREekIxejJp?=
 =?utf-8?B?N2pQbVlldlFNT1RqY2NkamF4dmU0Zm1FM0Fta2FXVzFtUXRqTWRyZlZsZ29y?=
 =?utf-8?B?NUZrdXErSDRUODFZajk2eVZDV3hFVVV5Ym1ndThESzhYazJEQy9IZ0VieHh4?=
 =?utf-8?B?MjNDZEV0MjlubjdhMDMvMzFpLzlVS2NkK3U0RXFXY3QrV09NU3YzeDRSL1lm?=
 =?utf-8?B?WG90SU1aWUhsZE1ZZDFYZ3pvSTBkVVE1eEluYWZpUDZtQUQyaEtnQXMrVERJ?=
 =?utf-8?B?RTRBNTlGZ1U3b3FNaTkvWTdML0pPaWV5dGUwb3VPVUlFOWVSdTBCZ3RMK2Rn?=
 =?utf-8?B?MVpMZC9kdzBNeThPMkVEOE94YmlWVDhabXllUDM4Y3pCdVYrajRsVU04VEhB?=
 =?utf-8?B?KzZ3NDM4QWwrWE9WTWtPd2wvVElRRjFUWXY2aGZaWTZaS1NLdnJ2ampDb2la?=
 =?utf-8?B?ZXhVQ2JJR282bGREWXdIbDBXQzg4cUdGQ0JlcVRTYVg4ZUk5YzNkTVUxaU8r?=
 =?utf-8?B?L2tZMXZPbFVDTTN6a3lMK3daZDhJSjA2ck9NOFRuS0ZGcnZwTklWUEIxUnRh?=
 =?utf-8?B?Ry9KaUNxY05rY2ZqbVhtd01LWWhhc3pyL0pJN0Njc05ZS3U0ZkIxbjl3N3RZ?=
 =?utf-8?B?NHk1bnVFTzNuZ2t4R3JMajJIWWw3MTVhY2NhOXR3L1EvYWY2YWxacmVBTkpQ?=
 =?utf-8?B?VUhaQ0VLSm8zZUZlRHZsODlLd2xRVmwzQUZRNlh3alBVZmxjNmpGcjVVUFA0?=
 =?utf-8?B?QVFWYmZ4UWVEcTl1SjAxK0Qza1J5bkFhUEJLOXZ4MDdKM3NsK3RoUG1wcjVI?=
 =?utf-8?B?UzdIbTdvd1JoZ2gvMXczUUR0aFJPRXhNTE1XVDJqakRYSWJWT3oyRitZUlJp?=
 =?utf-8?B?a2pxWDNuV1JkRFhPVFB0S3QzOEZRanNDdEJIRjUxSWlNYU4zM052UVlIUHE4?=
 =?utf-8?B?cVMxc21pTWk1ZFlpa05WMUEzSG5jVnlDNkNFTG94eTA5dWpvdnlOWUU4N2Jo?=
 =?utf-8?B?aVJpZllDVmNTZUZEamxaNUw3QnQwbEZxenFQZ09qUjlHK0JQY3doWjVHc2pP?=
 =?utf-8?B?VHJlN1ZHVlFYcTZ0MnI4VzlwZkRIY3RIa1Q3Tmc2Z2pJcXptMCs4NGI1RXNL?=
 =?utf-8?B?OXJhK2F2VVV4bVRUaU8yVm1qVFZXaHk5WWtsWlNMT1FGZzhucFpicGEvQjVN?=
 =?utf-8?B?dXdrY0FIRjdBM3BOa3M0bFdRT2JzY3paN3ZYVXYrMS9MSC9ER3BOMlZ3STVx?=
 =?utf-8?Q?biX/qDLD+cCBc?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 07:55:48.3210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb5efd6-a573-4eff-7c7a-08dc73eb4482
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10737

SGkgSnVsaWVuLA0KDQo+IA0KPj4gTm90ZSBhbHNvIHRoYXQgYSBmb3JlaWduIHVubWFwIHJlc3Vs
dGluZyBpbiBhIHBhZ2UgZnJlZSBpcyBhbHNvIG5vdA0KPj4gdGhlIGNvbW1vbiBjYXNlLCBhcyB0
aGF0IHNob3VsZCBvbmx5IGhhcHBlbiB3aGVuIHRoZSBmb3JlaWduIGRvbWFpbg0KPj4gaGFzIGJl
ZW4gZGVzdHJveWVkLCBvciB0aGUgcGFnZSBiYWxsb29uZWQgb3V0LCBzbyB0byBiZW5jaG1hcmsg
dGhlDQo+PiB3b3JzdCBjYXNlIHNvbWUgZWZmb3J0IHdpbGwgYmUgbmVlZGVkIGluIG9yZGVyIHRv
IG1vZGVsIHRoaXMNCj4+IHNjZW5hcmlvLg0KPiANCj4gR29vZCBjYWxsb3V0LiBJdCBtYXkgYmUg
ZWFzaWVyIHRvIHJlcHJvZHVjZSBpdCB3aXRoIHNvbWUgWFRGIHRlc3RzLiBVbmZvcnR1bmF0ZWx5
LCBJIGRvbid0IGhhdmUgdGhlIGJhbmR3aXRoIHRvIGxvb2sgYXQgaXQuIE1heWJlIEx1Y2EgY2Fu
Pw0KDQpVbmZvcnR1bmF0ZWx5IEkgZG9u4oCZdCBoYXZlIGJhbmR3aWR0aCBmb3IgdGhhdCwNCg0K
PiANCj4gT3RoZXJ3aXNlLCB3ZSBtYXkgaGF2ZSB0byBhY2NlcHQgbm90IHN1cHBvcnRpbmcgMUdC
IHN1cGVycGFnZSBmb3IgdGhlIHRpbWUgYmVpbmcgZm9yIHNoYXJlZCBtZW1vcnkuDQoNCkkgd2ls
bCB0cnkgdG8gZG8gaXQuIA0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

