Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8204A64784
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916445.1321542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6rN-00079R-Qh; Mon, 17 Mar 2025 09:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916445.1321542; Mon, 17 Mar 2025 09:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6rN-00076a-N8; Mon, 17 Mar 2025 09:34:13 +0000
Received: by outflank-mailman (input) for mailman id 916445;
 Mon, 17 Mar 2025 09:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9Sv=WE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tu6rM-00075p-84
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:34:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f403:260e::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4fb785-0312-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:34:09 +0100 (CET)
Received: from DB9PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:1d9::26)
 by GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:34:05 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::82) by DB9PR02CA0021.outlook.office365.com
 (2603:10a6:10:1d9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 09:34:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 09:34:04 +0000
Received: ("Tessian outbound 17f7e587bbed:v594");
 Mon, 17 Mar 2025 09:34:04 +0000
Received: from Lf3f8aebf8ef7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4F927A5-8E35-42A7-B993-7953E37F7BE0.1; 
 Mon, 17 Mar 2025 09:33:53 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf3f8aebf8ef7.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Mar 2025 09:33:53 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB11168.eurprd08.prod.outlook.com (2603:10a6:150:1f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:33:50 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:33:50 +0000
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
X-Inumbo-ID: fa4fb785-0312-11f0-9aba-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tuhPbmi+X3aWZtgu9QPpnIB9+skhmFh5uJWtAWsLnf9ApN7fGnJFWjf6nRhHibB/1vSSM1QFD0x4bBniAE6SVLyfqKO/HBeHydrE8wBvWPF4E4ZglxLcab96reaOjxO4pJ2tc93uSc99gazxWYz1ctLq6yqRYyO5NYw4oJVo9lswvHtI/e8uRKD3kDDWdKKXfePh9HRfgOSh5voC8qAlq7iwZQqE5Qu1YJNidCmES4VS8CNW/8Dx7GvHtNBPMJR0AaM50t+dERMAl9cHjQwWvnEmMI7HeMC99xvqNAz5NH2K7D+W0sx4+b4nguwUaPoiZ0BOcB6+evdx+4uj4BBS7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tav3N0ktQnSBMpaNGTn9cRj3dRSw2YBmPVjT9UQHIrg=;
 b=w5gOgIluIahB1V6WEMUwobGpYA+ol6PorOfs5K8Dl7ngYcLMUTJOmJLTTJfscjAyddkzdrli559bKFq9gMs4i3MSjxmL6G+VOG/9FEHrHcJF3wiGgODL8me2SAYR9qtZyI7svEzaEe0SxDRmqVdhpqwHym0Z7TYAB9qE7SrHEnGsvnRgnp2WNW7oCO5EkZaIK1KG2NTsv1euhBpeYZbNRE/A/qOPWt4HpkrPrR2hzt8fG61P0wcyLZt2IFMpOmF2Il0IdViln0H3KWckYiiO1SvrgWux/PLShkzSq8NtrklDZFPjOSdYgg+soamSf8CiQPweIRavB9NohUiIzzalyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tav3N0ktQnSBMpaNGTn9cRj3dRSw2YBmPVjT9UQHIrg=;
 b=rrVsiefKDTJhL4z1qw+k7OWgIkX1hI+NtPnx9TEeiEda5fGFZR3WUsD0urts/GdnRKeXYBpF0ArQcu57kBogA+CEI2iowOH4fM6wS19QHuRXYBEY4PofzQxyB4UtMjRB06+Tyq7lbd5MOXoFCVrR92wDYzn1aX1/EdeCPEhyJ50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e243e9ae605667f
X-TessianGatewayMetadata: frZ1D2UDPpdmoLhDhny+BtZn4N7tex8ygDn3EB6F99iTbWkDewpeGbzjIVjInhCjYOtNFKZF9uP1KVeHMZDwF2NOcwN6flqC5mlM3PheAzTALJWu5SiyqeBLf/cxkUPCJgJyMDGP7yRsbElQAvbjlSjWxRUJzFFe4iw25DQpFGI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JelzoZDBtEbWKrIpzj2GnOpKAy1pb694rfq1qp1DM3xtY4S5OYo3q7k07m1x0VwjDgJa+mhgbPZrM7A8nd1yJb99k7HmY3gUmGMeGYNmYPffuDFc/vjVjUEasbmTdJ2QOG+ocWpT6HEG1IbDOq6ObVXfZSfOKxLC2IdrXMw95/xDnTf/ZCADI8QXKdq7GFcc7afUmB0wUnNI2ikB8a2m3mItDZUw0UyYfS0VXF0yipKwKjtPd5kBBeo9yFqR0opG3yYRmFS7SCKUhTIT3QdcdQl/pS+kwRuFVaM6A/Kau7YVP3xFxLulYQArOXX1iAkslj3t3a9LDmNDuv6zJEopyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tav3N0ktQnSBMpaNGTn9cRj3dRSw2YBmPVjT9UQHIrg=;
 b=eiB1f6cCIgntbqmE4r8b5tdGh8ctQOUoF9DhQ34XOpvFE4wCar3sGgWLT/u/tXHHeuXaMdmTyLACnfotOrzJUbQL0SFYt2Xw7nFjHhkcOJ+7MXsg+8Jmp9SNEIfVHkmdR3qgq9QiTOxjp1omY42HSw45C2iJ+2hc5FrmgqcoV2qYq58/DId5Cl0Wd25ebkKmeJzsrZCaHOB7bwFMX2Qvq4uRi79+hUxFsofiMRvm/4GvwDci8WZMswMXqgHEhXxicT1BNnuwM4lCdcRMsK2DgmLgiit3aRkxadMX232Y54NbreBTczkn/NUcvKVBdJnAgc4vQgzbBn0ZvNb+fAI5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tav3N0ktQnSBMpaNGTn9cRj3dRSw2YBmPVjT9UQHIrg=;
 b=rrVsiefKDTJhL4z1qw+k7OWgIkX1hI+NtPnx9TEeiEda5fGFZR3WUsD0urts/GdnRKeXYBpF0ArQcu57kBogA+CEI2iowOH4fM6wS19QHuRXYBEY4PofzQxyB4UtMjRB06+Tyq7lbd5MOXoFCVrR92wDYzn1aX1/EdeCPEhyJ50=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/7] xen/arm: Introduce frame_table and virt_to_page
Thread-Topic: [PATCH v2 3/7] xen/arm: Introduce frame_table and virt_to_page
Thread-Index: AQHblqk5MPCSPLAoTkeN9izbg86F2bN3ENyAgAABDgA=
Date: Mon, 17 Mar 2025 09:33:50 +0000
Message-ID: <5CDD6327-BCC1-4383-ACDE-19B75C085631@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-4-luca.fancellu@arm.com>
 <799e2b1a-aea8-43d4-99bb-eab4fd4f6b93@amd.com>
In-Reply-To: <799e2b1a-aea8-43d4-99bb-eab4fd4f6b93@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB11168:EE_|DU2PEPF00028D05:EE_|GV2PR08MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 408f7663-90a0-4e52-d59b-08dd6536dbfd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VFJ4dFgrN1QzQVNjM2FaKy9VZko0T1NEcWpOK2ptc2ZVcFYwZFMyejNnQUNa?=
 =?utf-8?B?QWhWRTBzcGxaTDlNT2lhK01mK2oyR0kyR0FTemhMV291R0QzV0tiU1A0WHB3?=
 =?utf-8?B?bGgrT0dzRVJEYXphdEVPN0FNR2I3d1kyb0c3c3ZIYXdBYXczZytlRUNSSkN0?=
 =?utf-8?B?bFpUTUtoeU1SZmh1d0F5SlRHbVZaSm5nT09rTWtwSlArOU90cENmeVIxakJ5?=
 =?utf-8?B?UlZaUVlYM1ZyTGhHcE11K1Foc25YOVR3M0tOZExDSlNaK2hwcGxJYnVTRCtq?=
 =?utf-8?B?SDVQMElHOWNUM0xydkY5MXV0bjcydXZOenQ2MU5KcW9LZUVDYVJRVWlVQUxk?=
 =?utf-8?B?aUx1Nlp6aytvalVGVlpjdUVJTnpZVDVXLzZjVTlMQnY1a2JFMnJnbHZPcktr?=
 =?utf-8?B?emIybzdvLzBHSWJMK0xFZ3JPcU1JR3BkYlYxeGZYNUdhK1oyZzhLdVdxOEFC?=
 =?utf-8?B?R3AwYkxTN3ZsN28xdGpsZThjRFIvZmNXaGJUOGtRcXRzUUVrN0FHUTFDb1dl?=
 =?utf-8?B?Nlk4a3Vkdm5FVUZYa0pFeWdXeXJYTUs4Q2N2WHN4enlmNnh4ZTJSazNpRndE?=
 =?utf-8?B?UHBOY0x6ajZsNHlQWjhxOVNmTzczbDdqdm51NlJuNVVzNkRaMjlXRHpKSTNn?=
 =?utf-8?B?UEp0OGVvQjVrQWM3WWFQdDk0VVg2SFV4VitlL0NlN3k3T2ZQbHpGZjM3bnp5?=
 =?utf-8?B?QlNRN3dUWmxaUysxNU81ME5XUmVtTkZ3elNVallmNndIekQ5czNLNGRSS1d3?=
 =?utf-8?B?djlQMGRHbkgzQlRzanJ1R0JUaWR5bHp4SC9CZkZwcFpqWTFXZkxRNHM5T08y?=
 =?utf-8?B?cDhjRXNJbjBSMXpnS0YxWm5DNTdDeXpUMWoxVzgrQXdsMjF1WTZhWmx6d3VD?=
 =?utf-8?B?bFB2MENLUUdqMldhWmt0bFBUOUcvajMydGhicFo3dGNWaWxpeXJPbmhzZnJU?=
 =?utf-8?B?OHd1blVPWnJmd0ExcyttdGFoQWlWSHZKWlBCSEgyZlBtZGpaVjRKSi9TYjhY?=
 =?utf-8?B?TGhENTBxcjFiTm1oQW5GYVJ4QXVvME9Cb1lxZVcxU1lYWDlqNVVydE85MVVW?=
 =?utf-8?B?WTQwY1IyQ0FHSlF5eDZFaG5SWXNZczZGRXZZVVY1eVhxYnJXaGFMTlp0c091?=
 =?utf-8?B?RFhBOEhmRkwwaTlUOGoxZTJaQWM0RU9DNGQ5S095b291UVVxV282S0xWMnhK?=
 =?utf-8?B?SHV3UmJzemt0ZnhxdjNBR1d2OVBTWm5pRU9sQndiRkM4aVBXLzJMVi9tL28r?=
 =?utf-8?B?SmZqd2VqVHlNVktiQzFTY3JmTW0vWUwvVitCTDh2OUtKYmJwRTlzc21Uenl5?=
 =?utf-8?B?Mjg0a25Mc3pHVGtqbTE1OWgyVndBb1hMaFNXRHYyc1VzdVd3cHZxRUYrV09t?=
 =?utf-8?B?dGRCYXduL2tlUkZjUHg1TXo5N0pUVzJLYldXK1NMS3VSVzNnN1A0WUR4YWpO?=
 =?utf-8?B?T0RncWxJS3RoMG01MElMUDVtcFN0Nk9MeUVkS25aZXF2QjhCZXBTT2JHZitI?=
 =?utf-8?B?bU95L215SGllYVBhcW5HdklYUno5N1crS055TlVZU3dUZFQ2MWlJaFV1ZWZ5?=
 =?utf-8?B?MTVGdnJKNUVVTHpnNFRuQTZjRXg1MStJSWdEaTJiaFhHVmtHejdMS0p5dXpV?=
 =?utf-8?B?RkE5aElONEFWK0RhVmNNTmVZZ2d3Y01BQnZFNGMyejduOTI1WS84YmtDOFo2?=
 =?utf-8?B?dlppZnpucmFCTStRbER4Y0xBaENiZmR2SzVobnJOMjJkaU8vb3VyQXIrMTFS?=
 =?utf-8?B?V3Jma1gySVV1RmRteVdFOFUvaUhuWmFJL1hkSEM3OWY1b2hkQk5rZlk2S1dD?=
 =?utf-8?B?M3hEVklPYkt4MnpreTNIRG0wS2NvZWNJYm9OL1VvbllGRnRIV3hnMjRsd3c0?=
 =?utf-8?B?RVg5a0d3blR4R1lxZGpqdURoUzZBSU96aTBsVWRxbTNSOVMzb3dyTndmUXJ4?=
 =?utf-8?Q?YpDY/vRpikn4DxnTPaOwEiJXG/zLk5qX?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E0036110D6B5243988231FA84E01909@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11168
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b422048-d0a2-4eb2-0b67-08dd6536d35d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHp1UWMweHkrYkVyZFNpWVZnSGQ2akhGY1BQUG9BMDhEU0ZEUWdoc0RkRDJQ?=
 =?utf-8?B?Ym9oSEVkUHNuM0t3SHdCdVRhTVFQZm5sWU9jbWtmZFlwYXdaQm4yRkU1WVRh?=
 =?utf-8?B?OXMzcjZxMGxQWEYrUGR2RzY0TVdmQmRGWUcxSUN4N0YyT1hnK3ZGbGtGTkxH?=
 =?utf-8?B?VXZYVEtyZit0cHkxQ0VURnJpa1hpVHZVa2NMTFp0RjUwNVlUOHE1b0haclBv?=
 =?utf-8?B?TmcxM2lISmdRUnBvSGtiSFM2QWtIS1JtTVpCSVo4Q1J4dVVqOEJDV2FnYzIz?=
 =?utf-8?B?U0R2NHJuQWZXUkk2NUNPOEpadUlHNDFsb2hpVDFZWncyNGpXMklidVQrZ1Vs?=
 =?utf-8?B?WHcrYitXZ04zOGYrV3pBOExxZ3d5dkhCNWFnQWI5a1pUZVRyRjRaWmJncHMy?=
 =?utf-8?B?UkxDRUo4Mm42WXVTZ1BlU2g1TVhLa0FsdjdRVHJrYm84UTBDRGlkaWZDcm1l?=
 =?utf-8?B?VFJCSDhnRzBpaGxBRHZEYW9LWmt3Z1gvdTlxVDUvNXNrMTJmNmlUZEFKZGRG?=
 =?utf-8?B?d0hZMEJBMDdsZ3AzSGZaZE1hN0FZYkVEVmlkdTd1ZEdRMG5hL0pFajJkSVdt?=
 =?utf-8?B?RElFcWNaUGpWKzRLRk1TUE9EclovS0UweXpVKzBPZnVZQ3R5S2xrcVFrSkha?=
 =?utf-8?B?WmRwY2YxUzBrV0ZMQklnMzdkRHFyVG50eXZGTkxlbXBzbm1yWW5LZkswaXA5?=
 =?utf-8?B?SEQ1eTlxWUVnamJtMklOd1F5cWhGUVJaRVhkdXFBeTlzOHdWdnoyb1BheS9F?=
 =?utf-8?B?SHUrNXE4aFNUTE9RMkpFUzJrSjJySHBtNEJiakRpajU4b1puZDBJbXpJMUdW?=
 =?utf-8?B?TTFOSHozQjZOOVFVMEVib2FZV0NIYm05aEtoSTd3WmVXd2UxMkMvUVBWSHA5?=
 =?utf-8?B?WjBpWXp5TkxncVpOdENPQlRpelFvaFVlbmZxblliRElMSmh0UnRZU1YzendW?=
 =?utf-8?B?VjZ0R1N1SUtHYUh2WVd6b2V5bTMzN3ptZzhJdTBCc3RmcEYrR01BeGc1cjVO?=
 =?utf-8?B?aEgzdlo0b0M5d3hISTAwUE93YTJJQkc2ZndVSDlFK2FmL3R3ckROci9ZYWxo?=
 =?utf-8?B?Yk9YR0JNdjQxRE1PWU41QTAzMm54Z1ViMTZlR2hVK3lXSERKT1hXT2Y2UUlK?=
 =?utf-8?B?ajJ2OXhaSk1aYzUwdE1DQ0syWXpOWVVjU0hqQldzTDc2VzRVTkhQeHJ3cE44?=
 =?utf-8?B?bGF2RDNJS2J1UFN4azJoQmdxWWJCZFV6dHBjdmhuaVlxd3RIendsSWpHQlFj?=
 =?utf-8?B?TDUyUEpMaWFyU2luWkRnSFhJUndIME1PR0ZCcmRZejRGRmFZeWh5S3ZvcENL?=
 =?utf-8?B?dFQ3U3BNbXRMSjZDMngzSzNxWUNtcXQ4V0ZSOE8xV1MxZ1lVWVA3TVRSYXFK?=
 =?utf-8?B?VEVuMGEzWDRZRmdjSlJkd1Jhdm5YNGZ5VFhaYWV1RkQyVGlKRmsvTnFFSUFm?=
 =?utf-8?B?ZXgxYlh0NGJQOEJ1V0h2SzdIQUZnVDZldGUwNjN4cFZHZlVVM01LdEdJVXhy?=
 =?utf-8?B?cmtwZE55Q0ZzOUU4b2U2b2luYzdSblJtN25NTW14aE1xaVdRcmRyOGpQT2lN?=
 =?utf-8?B?UmRtVlpLNHRROEFPLzFYcTdZakZqcENxeU51ZEMxWkdjelRuUjhRM0Zxc3Ey?=
 =?utf-8?B?WmhrVWJ3RUVKU3JIVlpXK1BEckR0L1ZMWFZ3SVplK2RhUUVDWi9hd054Rmtj?=
 =?utf-8?B?YkxRY2ZJTU1jcnhzMmgxeDk3TG1uUGo4OTFIdUZPT01WYWtWQTlPQ3JkK0F6?=
 =?utf-8?B?RGQvRnlaaWxSUFdMVDJjRGNnMEU1L3Y2Tjl2Mndpek5sQXRycTNhSDZIZ3hn?=
 =?utf-8?B?a2FRTWhpdjMybDI1NTYyczd2dVpSMGlKRENtWDRlb3R4dkllRlNib3hBK1NM?=
 =?utf-8?B?K3RnQW84bDRoK2lWc1VuenpBTFA5MTJicjl3T0NvL0ZURlJLMUt5VHRZODBj?=
 =?utf-8?B?Zm9GWVFIWjhsbVZ6emtYY3loS09CVndFalhGMUUyOTF2SnNxUmxiaUlCSC9Y?=
 =?utf-8?Q?gImDDI9iPpLfzHe1AOqsJYNAW6HNUk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:34:04.9807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 408f7663-90a0-4e52-d59b-08dd6536dbfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9158

SGkgTWljaGFsLA0KDQo+IE9uIDE3IE1hciAyMDI1LCBhdCAwOToyOSwgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxNi8wMy8yMDI1
IDIwOjI0LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEludHJvZHVjZSBmcmFt
ZV90YWJsZSBpbiBvcmRlciB0byBwcm92aWRlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZg0KPj4gdmly
dF90b19wYWdlIGZvciBNUFUgc3lzdGVtLCBtb3ZlIHRoZSBNTVUgdmFyaWFudCBpbiBtbXUvbW0u
aC4NCj4+IA0KPj4gSW50cm9kdWNlIEZSQU1FVEFCTEVfTlIgdGhhdCBpcyByZXF1aXJlZCBmb3Ig
J3BkeF9ncm91cF92YWxpZCcgaW4NCj4+IHBkeC5jLCBidXQgbGVhdmUgdGhlIGluaXRpYWxpc2F0
aW9uIG9mIHRoZSBmcmFtZSB0YWJsZSB0byBhIGxhdGVyDQo+PiBzdGFnZS4NCj4+IERlZmluZSBG
UkFNRVRBQkxFX1NJWkUgZm9yIE1QVSB0byBzdXBwb3J0IHVwIHRvIDFUQiBvZiByYW0sIGFzIHRo
ZQ0KPj4gb25seSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGFybXY4LXIgYWFyY2g2NCwgd2hp
Y2ggaXMgY29ydGV4IFI4MiwNCj4+IGNhbiBhZGRyZXNzIHVwIHRvIHRoYXQgbWVtb3J5Lg0KPiBX
aGVuIG1lbnRpb25pbmcgc3VwcG9ydCBzdGF0ZW1lbnRzIGxpa2UgdGhpcyBvbmUsIGl0J2QgYmUg
YmVuZWZpY2lhbCB0byBwcm92aWRlDQo+IGEgcmVmZXJlbmNlIHRvIGEgZG9jIG9mIHNvbWUgc29y
dC4NCg0KU28gdGhlIG9ubHkgcmVmZXJlbmNlIEkgaGF2ZSBpcyB0aGlzOiBodHRwczovL2RldmVs
b3Blci5hcm0uY29tL1Byb2Nlc3NvcnMvQ29ydGV4LVI4Mg0KDQpidXQgSSB3b3VsZCBub3QgYmUg
Y29uZmlkZW50IHRvIHVzZSB0aGUgbGluayBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgaXQgY291
bGQgZ28gc3RhbGUNCnZlcnkgcXVpY2tseS4gU28gSeKAmW0gbm90IHN1cmUgYWJvdXQgd2hhdCBJ
IGNhbiBkbyBtb3JlLg0KDQo+IA0KPiBBbHNvLCBzaG91bGRuJ3QgdGhpcyBiZSBvY2Nhc2lvbiB0
byBjbGFyaWZ5IFNVUFBPUlQgc3RhdGVtZW50IGFzIGZvciBtYXggUkFNDQo+IHN1cHBvcnRlZCBm
b3IgQVJNdjhSLUFBcmNoNjQ/IEFSTXY4UiBzdXBwb3J0IGlzIGV4cGVyaW1lbnRhbCwgc28gSSdt
IG5vdCAxMDAlDQo+IHN1cmUgaWYgd2UgbmVlZCB0byBwcm92aWRlIHN1cHBvcnQgc3RhdGVtZW50
IGZvciBpdCBhdCB0aGlzIHN0YWdlIHRob3VnaC4gQmV0dGVyDQo+IGNoZWNrIHdpdGggb3RoZXJz
Lg0KPiANCg0KT2ssIEnigJlsbCBzdGF5IHR1bmVkIGZvciB0aGUgb3BpbmlvbiBvZiB0aGUgb3Ro
ZXJzDQoNCg0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21w
dS9tbS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9tbS5oDQo+PiBpbmRleCA2Y2Zk
MGY1Y2QyYzIuLjNhMGE2MGRiZmExOCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9tcHUvbW0uaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9t
bS5oDQo+PiBAQCAtMyw5ICszLDEzIEBADQo+PiAjaWZuZGVmIF9fQVJNX01QVV9NTV9IX18NCj4+
ICNkZWZpbmUgX19BUk1fTVBVX01NX0hfXw0KPj4gDQo+PiArI2luY2x1ZGUgPHhlbi9idWcuaD4N
Cj4+ICNpbmNsdWRlIDx4ZW4vbWFjcm9zLmg+DQo+PiAjaW5jbHVkZSA8eGVuL3BhZ2Utc2l6ZS5o
Pg0KPj4gI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4gKyNpbmNsdWRlIDxhc20vbW0uaD4NCj4+
ICsNCj4+ICtleHRlcm4gc3RydWN0IHBhZ2VfaW5mbyAqZnJhbWVfdGFibGU7DQo+PiANCj4+ICNk
ZWZpbmUgdmlydF90b19tYWRkcih2YSkgKChwYWRkcl90KSgodmFkZHJfdCkodmEpICYgUEFERFJf
TUFTSykpDQo+PiANCj4+IEBAIC0xNSw2ICsxOSwxNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKm1h
ZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkNCj4+ICAgICByZXR1cm4gX3AobWEpOw0KPj4gfQ0KPj4g
DQo+PiArLyogQ29udmVydCBiZXR3ZWVuIHZpcnR1YWwgYWRkcmVzcyB0byBwYWdlLWluZm8gc3Ry
dWN0dXJlLiAqLw0KPj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2VfaW5mbyAqdmlydF90b19w
YWdlKGNvbnN0IHZvaWQgKnYpDQo+PiArew0KPj4gKyAgICBwYWRkcl90IHBhZGRyID0gdmlydF90
b19tYWRkcih2KTsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBwZHggPSBwYWRkcl90b19wZHgocGFk
ZHIpOw0KPj4gKw0KPj4gKyAgICBBU1NFUlQobWZuX3ZhbGlkKG1hZGRyX3RvX21mbihwYWRkcikp
KTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIGZyYW1lX3RhYmxlICsgcGR4IC0gZnJhbWV0YWJsZV9i
YXNlX3BkeDsNCj4+ICt9DQo+IFRoaXMgY291bGQgYmUgc2ltcGxpZmllZCAoYW5kIG51bWJlciBv
ZiBjb252ZXJzaW9ucyByZWR1Y2VkKSBieSBkb2luZyBzdGggbGlrZToNCj4gbWZuX3QgbWZuID0g
dmlydF90b19tZm4odik7DQo+IA0KPiBBU1NFUlQobWZuX3ZhbGlkKG1mbikpOw0KPiANCj4gcmV0
dXJuIG1mbl90b19wYWdlKG1mbik7DQoNClJpZ2h0LCBJ4oCZbGwgdGVzdCB0aGVzZSBhbmQgSeKA
mWxsIHVzZSB0aGVtLg0KDQoNCj4gDQo+IE90aGVyIHRoYW4gdGhhdDoNCj4gUmV2aWV3ZWQtYnk6
IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQoNClRoYW5rcyENCg0KPiANCj4g
fk1pY2hhbA0KPiANCg0K

