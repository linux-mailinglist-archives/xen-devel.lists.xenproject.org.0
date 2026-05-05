Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGQvBdDD+WmxDQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:17:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640FC4CADC4
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300470.1575002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCqU-0006AU-Ro; Tue, 05 May 2026 10:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300470.1575002; Tue, 05 May 2026 10:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCqU-00067z-OI; Tue, 05 May 2026 10:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1300470;
 Tue, 05 May 2026 10:17:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wKCqU-00067p-5c
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:17:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCqT-001ef6-Hd
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:17:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f9c3c4-5cb7-0a2a0a5109dd-0a2a4504ae9a-16
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:17:41 +0200
Received: from [40.107.159.27]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f9c3c4-1dec-0a2a45040019-286b9f1b1974-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:17:40 +0200
Received: from DUZPR01CA0156.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::19) by DU0PR08MB8322.eurprd08.prod.outlook.com
 (2603:10a6:10:40d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:17:31 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::48) by DUZPR01CA0156.outlook.office365.com
 (2603:10a6:10:4bd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 10:17:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Tue, 5 May 2026 10:17:30 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS4PR08MB8071.eurprd08.prod.outlook.com (2603:10a6:20b:58a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 10:16:27 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:16:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QSNMVL6mEltWiugyZ4OK8Bx80LAq7MZMbZ7SD/CN+qJ8xU4AFi4xMzAQGQdCgND5SWCLYPc0//9hT+gXjpr43WIVvXJ1GCWaXiVLh50xrudSsoLwxBI5DrDg1ybY14P7/2+7ALKt7j8/iliX5WWc+2ppaobPCLPeGvnjLu6a4Zp4NhQ4I4kZlRkdr6WNcK6VqmAaI/MSnAbwT8rjZWA2C62+FMB5GHTFKknbIDXiSo5HKecZ3n3JEkRJH6hKLuhh3oMFBJBcuD6786jlfYXFriXssu/CbYqkCfsrQfqsN4wa1L1JAk9jFxiajmwrLnP/qL7ZyN7oH8+8fuaEodY8LA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uFyHf5/hq6YqtL7puLplGKtjI5wCkmPtCDmUXyg/2k=;
 b=D4ZJhB/gTTkVI51m9bPWw8R9uVEDGDOn9SE2/T5ta/1+qsPouJ/UudhNmJDFg7hDNKO0EzICVwDKw+a1vn2xhXRZVeSSNgaOHBINKrZifJYPLr3jgFgjwaQCqtfRCMfSHWawg05nAmaVDkL6jseST0w/yidggwSZWEccd+WNUNKrcGl+Lqq+d+j3IREz210YGN2MZSaFDIBLJjLVH11gElAmybRB8D4PGw9BkjejsCxCrLTYmkrEj806k7vNvAF6fxqSP4HbdVuGrCOmnoZUQCTcMT9WHQAlb0s9R/jyHrzhN1LmWLca4CNAU3s9M0AJll0HbAtW+e3BsfoHQrSgQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uFyHf5/hq6YqtL7puLplGKtjI5wCkmPtCDmUXyg/2k=;
 b=DKn4hEdh0QRoUU6vqVKzR7tbrA9Nqmeh1MN2c8KsUQACUzRFhs22TLMWOJzEkcenynwl5bmRMzFx0y8Ru1q0OonRcBUdX7SU0nBhHd9R84UXB4bozfnSNuzWiDSlbcX/kQgdI4rX8Omt6rqevFBONeqkTJcxYA5fTIWKLh00bcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uu8fiDOb6eHPPdejl9tK7R0z95vHl5EGgLMijz27OItoVDxqRD1Fru1lhWr9u5QvhDGuebqplts/nVzHLV8tHmDtGtb6X8BCwIvuvde/VkoJd7A+zJlYkJufTLd9/TudIMdotRht8H5wd/q+s0UCduYsPyuOtDQI4LHq8wXugxtaVUyRQU/ypTveTqN19fHIjQwNT+IYw/LUhQ0+dUw/pIjHNfdz+kowVI9dP352t4UMQmEzNrJlZGlQzTmnsHPz9RTzPc1XTLQPqZ2ZPnXMqXwkYk7C+UhKoDDa+8i8AfU9eA66pCiKtNdaGIdr2DrNqiITcj/BImFU7s+x0pqlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uFyHf5/hq6YqtL7puLplGKtjI5wCkmPtCDmUXyg/2k=;
 b=awpwRE9iMU/9ZKIoqdrdN7hAp1zUdBbsVeuFyxheMNaAqrggRvkrJf9iW+euAFF2/iFwBkK5gNqgsUY05Q31QTPGHnfoZyDcEm37+4Me9RMdbJFstMgLfJLbzUhXFWvJNofKaHo7IxUxf48HSJgoOfFbDc3C9l+3H1GG/SDG6MQTZbw93SzJZSE8Fs1Ot675UNZhC6qhjPnjLeiPPt1+ajh8RZVGhQJ/+2VBdcIaLz0Rlita0W7WEPFPuF5s4vsGxLObk2xydu53f0CDC9At1kbyHzAGh8drrxl9ZVeLUMZ0WCZIT61ydqnFU8dRM/fa/cAdctIZAcSN/z6jajshsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uFyHf5/hq6YqtL7puLplGKtjI5wCkmPtCDmUXyg/2k=;
 b=DKn4hEdh0QRoUU6vqVKzR7tbrA9Nqmeh1MN2c8KsUQACUzRFhs22TLMWOJzEkcenynwl5bmRMzFx0y8Ru1q0OonRcBUdX7SU0nBhHd9R84UXB4bozfnSNuzWiDSlbcX/kQgdI4rX8Omt6rqevFBONeqkTJcxYA5fTIWKLh00bcc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Topic: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Index:
 AQHc1xwXYYBcuLui0UypBKVcqnkF/bX10fCAgAeOAYCAAcPSgIAACp8AgAARTACAAAHQgIAAAJwA
Date: Tue, 5 May 2026 10:16:27 +0000
Message-ID: <433FDA7B-FF8B-44A5-94CD-6244BE0102C4@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
 <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
 <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
 <F9DB9C27-810C-41DB-95DD-D00772CE4385@arm.com>
 <32eddac5-73c7-46c4-8944-99cfe970c803@suse.com>
 <5B084D26-4FE9-4C1A-8C3A-298FB73F34CB@arm.com>
 <3953265a-2bfc-4853-bda5-3450c096ebb2@suse.com>
In-Reply-To: <3953265a-2bfc-4853-bda5-3450c096ebb2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS4PR08MB8071:EE_|DU6PEPF0000A7E3:EE_|DU0PR08MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 7176aaf4-4694-43a8-62ee-08deaa8f8440
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 i0n3S8lRAy/3RadB8eyD1HJRVQjwnsFppkOuD8dXtUaxFGEpbVbqQq6BPE95RsWZQFzWtYHvUhYN+vNguOCoezllmd2NTAwbLtmLr9nZ1H6VwNIjUjMRZgVdq/XdoYoSuf7nmqWIOiABLbjW6vtYO93a4CeuVjL2b6y8lKc5Di1XnUNEOierKkR8BsPv4+evSerP2gA29grr+O82upjYQXh7Ch4SOwBp0faAb++EgskysPBSs5KWBsFg77S+vqOc++zxXBZnM6fhCIzVPvlhnBnH+Sski6zKbeMuQP0wftt6JMhJ80df9hFjBVDs8cgK3eGJc0jUDqx91cg1hOgctmdy97hzCOGoEjD9edY9e3rca5nkLlfPfssGjEnes/2f9ArK4pzQMv+tgT/LldgRKDX/1wqbL3b5G5bTBCgWhj2eVNRXWLgfEeHqUzxcH+G16kjE7ak2scB5/9D0pcGoz3v9Jf2iP2xGR1E6NQ+0fHg5256G7mk2NVTWI2UbK2Bft5rga9s1e5UoSTZ4VdsII7a3bXJJlV6GrOH7r3qbN5klcGwC1NR2JYnQyRNDYCbeQp+z7jWQ0Sb606YaBCZQbOZ3xf78dDCXu41dUCPn6Y2aw5itf71DHFprbG77yeWUeL+9k+2dyJTpRLwMBjN8RFFN5Q+qsjO4jbg2w2WMsH84yAa13y/DGE67AYjrDIqzkIVXRrNX+TCebsBwQH9SFv2aZ0Gu5ola+lfdejeCQOFYFlY2TdwI84+nSZBcCIdw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7304610B24F69845B301EA95579F95D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 awwYyadso9LZK+paW3XDO2rBwcrkbKLTC55rAyq9vkkwnNVh291+LViE1hVgY8fNP4NNowVjw8nBal38b67KxMtJUC6fIHWV2cLfbejIyRQeltNFdwM5OSG/kC4Mw5d8Q+yTnSmfSp1n7/TwejBIhWXY0l+wT+ZX0Fz9POLXY9F7kLGdZCzQSR+TQHYgHKG1Nx7PzupQLmKuXH9yob+J2gsmaQMLfy/EFaa4jP8YPTBiakRMjAEZqkB86n3hwy5CAWo2GqXKQxgMh0/0e/te8X2vt9cIUbA/KRHJ2Km917u6cT5fhLgI5RFbcGBOvDAYyVRb8MFjsC8uMGQEen3Gog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8071
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	12a35bf7-5610-43d4-dc29-08deaa8f5e4f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|82310400026|35042699022|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0fdGneR3hzq10hYsOGCgTNv96mtSMezIFV0j2MoFGPFKrv5VrwnVVsrB+5NogVcDwr1PAAGl5XWpS9idpjEH0sPZuitiGyL8LtYHx9yFxWeyYPA6q58TWxdsGdUNLfV8tPB89lFISzNkEogNCYHtskIut2c0/IbgrRAbsVOndNf+6SwrwILONyGijMI1OFOb2GF91E+Au0A9UlCUUWl0xUzWQ3X1pkElNmQ+Q8ujm2r5b1il2nkDg4dqM1BZrMwr2wQ3IrTE2+fDbQ4aUWRW+obZ9ZBGu240Z5EMewUISmfCdXX2ZSdAlFVl4LJaHV/Huy3crtRMwhibCI18btRSj6fYfOqtWxxbxKoIk6b7jxkZvj/ou3C4zT3c9EHD2fbIRNN4mttAJ9C1MI70wGNNTK67e1uQBoMbxzixdVENpx2fMYnB1K2mFqnm/lqotvQZVIFrqkOmQhfqRleOcS4j7Tgz4ohBzS5oNLy81+NkSE2VdyAXCDHK9czUSPJ+or9hYEcWciehBnVnFCiqeL8wcAYjZTFD6jshvX9RCR5MmC2PzDHmHdrgMA43dvHGm/SgLNR35VLZ8HPeoJ0UQ60vMCH6jbAixGaw3FczJC9qNCzu12ssMjTTpC7P+pm2ekdCSGwneQNHEGYMICsB/nYZIfdHnVBcqT2Bdcqh7ZgH7shMJm/PydSDXYEt7Q8a8ydyEt35SXahYaZUbNWD0RWaxsyv/0pOXTvOGJ+T3V79KEA=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(82310400026)(35042699022)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DEo2TuZa236UUb7+pPIomGQmeFJsCV8vNIX3Y+rDiKMnjwlNqI27b2FlH0lhYKFrtWzd+LMbqvRKWLKNCMAAK+f3GZjUjiuVBxoWKswZGQxhuItoLU8r6ZGS0PVk2e+3sBKOj91kSEOka2iFP6+Nd0kshwVpxbFT2prVCboKE/5h3eWBpBOlwPOiwo3QmkRg+FF4McKp1pI9grMcBi/PihJi7Yut1I3FaG12TidrsE+SHqXI6xL9IA8Q1IKjclGDMctzAERgLruitdmOteEaAlFAcG4VXHa351OylpHdPzEMyGQVYZesSC1QG+5+wUzJNlb0SXygPLT7O0S/8ZmZcvngI20Qg0lz9htWJZQ+JMIjMyoUXJZ1SY2qPQCQG1KGtA8uOTxVO06lY2ns6s0jjVMETqKLlTgA1U+XkNIzqzwwKypYOxQYwQeUmhu6w3aP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:17:30.8063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7176aaf4-4694-43a8-62ee-08deaa8f8440
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8322
X-purgate-ID: tlsNG-ebf023/1777976260-2B1663FF-9010D2A6/0/0
X-purgate-type: clean
X-purgate-size: 2608
X-Rspamd-Queue-Id: 640FC4CADC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

DQoNCj4gT24gNSBNYXkgMjAyNiwgYXQgMTE6MTMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNS4wNS4yMDI2IDEyOjA3LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gDQo+PiANCj4+PiBPbiA1IE1heSAyMDI2LCBhdCAxMDowNSwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwNS4wNS4yMDI2IDEwOjI3
LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4gT24gNCBNYXkgMjAyNiwgYXQgMDY6MzAsIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAyOS4wNC4yMDI2
IDEyOjA4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+PiBAQCAtMTM2LDcgKzEzNiw3IEBA
IHVuc2lnbmVkIGxvbmcgcmF3X2NvcHlfZnJvbV9ndWVzdCh2b2lkICp0bywgY29uc3Qgdm9pZCBf
X3VzZXIgKmZyb20sDQo+Pj4+Pj4+IHVuc2lnbmVkIGxvbmcgY29weV90b19ndWVzdF9waHlzX2Zs
dXNoX2RjYWNoZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBncGEsDQo+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpidWYsDQo+Pj4+Pj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxl
bikNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGxlbikNCj4+Pj4+Pj4gew0KPj4+Pj4+IA0KPj4+Pj4+IE5vdyB0aGF0
IHdlIGRvIHRoaXMsIHBvdGVudGlhbGx5IHdlIGNvdWxkIGhhdmUgdHJ1bmNhdGlvbiBpbiB0aGUg
cGxhY2VzIHdoZXJlIHdlIHN0b3JlIGl0cyByZXR1cm4gdmFsdWUNCj4+Pj4+PiBpbnNpZGUgYW4g
aW50Og0KPj4+Pj4gDQo+Pj4+PiBUaG9zZSB3b3VsZCBzdWZmZXIgZnJvbSB0cnVuY2F0aW9uIGJl
Zm9yZSBhbmQgYWZ0ZXIgdGhpcyBjaGFuZ2UsIHdvdWxkbid0IHRoZXk/DQo+Pj4+PiBKdXN0IHRo
YXQgd2hlcmUgdGhlIHRydW5jYXRpb24gb2NjdXJzIGRvZXMgbW92ZS4gSS5lLiBpZiBuZWNlc3Nh
cnkgdGhleSB3b3VsZA0KPj4+Pj4gd2FudCBkZWFsaW5nIHdpdGggc2VwYXJhdGVseS4NCj4+Pj4g
DQo+Pj4+IHllcyB0aGF04oCZcyB0cnVlLCB0cnVuY2F0aW9uIHdhcyBhbHJlYWR5IHRoZXJlIGlu
IGRpZmZlcmVudCBwbGFjZXMsIGRvIHlvdSB3YW50IHRvIGRlYWwgd2l0aCBpdCBzZXBhcmF0ZWx5
IHNvIHRoYXQNCj4+Pj4gd2UgaGF2ZSBhIEZpeGVzIHRhZyBmb3IgaXQ/DQo+Pj4gDQo+Pj4gSSBh
bHJlYWR5IHNhaWQgSSdkIGxpa2UgdGhhdCB0byBiZSBkZWFsdCB3aXRoIHNlcGFyYXRlbHksIGRp
ZG4ndCBJPw0KPj4gDQo+PiBJIHVuZGVyc3Rvb2QgdGhlIOKAnHNlcGFyYXRlbHnigJ0gcGFydC4N
Cj4+IA0KPj4gV2hhdCBJIHdhcyBhc2tpbmcgaXMgd2hldGhlciB0aGUgcmVhc29uIGlzIHRoYXQg
dGhpcyBzaG91bGQgYmUgaXRzIG93biBmaXgsIHdpdGggaXRzIG93biBGaXhlcyB0YWcsIHNpbmNl
IHRoZSB0cnVuY2F0aW9uIHByZWRhdGVzIHRoaXMgcGF0Y2guDQo+IA0KPiBUaGUgcmVhc29uIGlz
bid0IHNvIG11Y2ggdGhlIEZpeGVzOiB0YWcsIGJ1dCBpbmRlcGVuZGVudCBpc3N1ZXMgZ2VuZXJh
bGx5DQo+IHdhbnRpbmcgaW5kZXBlbmRlbnQgZml4ZXMuIFRoaXMgYWxzbyBoZWxwcyB3aXRoIGJh
Y2twb3J0aW5nIChpbiBnZW5lcmFsOw0KPiBtYXliZSBub3Qgc28gbXVjaCBoZXJlKS4NCg0KVGhh
bmtzLg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

