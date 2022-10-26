Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3C60D874
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 02:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430286.681799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onUGs-0005oB-Sh; Wed, 26 Oct 2022 00:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430286.681799; Wed, 26 Oct 2022 00:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onUGs-0005lq-PK; Wed, 26 Oct 2022 00:27:50 +0000
Received: by outflank-mailman (input) for mailman id 430286;
 Wed, 26 Oct 2022 00:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsSF=23=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onUGr-0005li-Mt
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 00:27:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a2191f-54c5-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 02:27:48 +0200 (CEST)
Received: from DB8PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:a0::32)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Wed, 26 Oct
 2022 00:27:42 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::b) by DB8PR09CA0019.outlook.office365.com
 (2603:10a6:10:a0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 00:27:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 26 Oct 2022 00:27:41 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 26 Oct 2022 00:27:41 +0000
Received: from 2c70d7bf9aa2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63D9BCD3-BEE8-4351-9BED-4B0CADF1F799.1; 
 Wed, 26 Oct 2022 00:27:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c70d7bf9aa2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 00:27:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8458.eurprd08.prod.outlook.com (2603:10a6:10:3d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Wed, 26 Oct
 2022 00:27:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 00:27:34 +0000
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
X-Inumbo-ID: 04a2191f-54c5-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aeffBM68z0kIz9ad5V0JMPEWRxNrpc1MYhd/4okkcr+Q2G7O0h0fO03AEnR74+ZLX80kFRsMb+QIPbHRAgfSnkmdbmwGFyeWY8IdgkaBcaZH2kOEXYAivCh4lVprPgmTH4JgBokr4vnqb0me1CqdAEr8vv+nVeFAh6CFRzxz78np89HuWL3kT3VhdWig5h12L3V+L+JR9gXXbiOlbnLroFp7Fv/BLw5hk7tw8SGKde2KUvpHHM3qMP965Sl08uCIvITWh3djajyhNEMkKUej9TLnJVE3YFOFOMiaDS9ZGo8V3xkhZawFI1AusY/PloTdl6FMHFVhnm+pJQTXOb35fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TizVcDI5HtjKEM6LeLrJCwzea0cFMJJKYl5s7pVpJSY=;
 b=IpW5Rnnt6O6cxnFjuvM+3jYhg7WZz62f+vm7I5XXcUbn3gkntQXkG4zx+/vOJx8ToROoJjZJgShOnTtii3rYxxkc+JG5iqXmaCvaxiaWQmMEZ4hGCw6K20DQ3va4BVA6yfE8G4OCFbfnJRjrNVwHLrDvyNsKY0idYIHyNKtOP5CO+ItcdAsjjMgt+NPyQAke0CtbknCydFUFRUio8AAQW2eDCjDL0t38yqvSIxLUUyQwE+0mAVrcqFFkZb8znbxkjI+ZSxsKieSCUzEHkA2EsDRzfFCQGSktZ+kBX2cBH6ee0oVI1MSDRL+ahHcmehdfCRudiJwR1cpgIVhTSYODgA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TizVcDI5HtjKEM6LeLrJCwzea0cFMJJKYl5s7pVpJSY=;
 b=X76hAjToKlHawovABtsPWUZ6aVNO7cAdGwefb7J7eGN9Xx3mkqRHOSw31DxaN41yHJhnaWHh6VGQEVtlYjX4zP0lLx+s0JnSjUuEyhQd8x15Gijs4wvz3KXjkDUJgGoCr0HhNBnHsd7uTsGO+6I24vyboK6QIR0K3DMwE0cTo2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3wF+qLQa2jTY5+P7XIMHVAXH0edlQITsePKfPOZR4NTmYwfGagLQuduVYmn423S/femoXZ1yhyTPNAbIWk6rO1sa7ffnYn9J6acNQJoW9Z48kMtlvc4pDKvM9x0mydk75gnAUmWV8tb+0Gm21uiWQCf0FJHnCupesQuGd5Z4cTy0pSm2460sgYyIEwJIlwwFLo5JDyrhxwvmB4sNAiwCIXX/l0uF6Va1T9/CHSp0OF19b54hqevok0300ErdcNsSsmfqEiI++fhh0S38PFSOeVwsV0p3S8FYpNuDWguNeNUxs82OiWS9qfnySK40Gm6ADNvXmzcfQbTSXYbIa57RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TizVcDI5HtjKEM6LeLrJCwzea0cFMJJKYl5s7pVpJSY=;
 b=WtLgsjdYEilhXsyztv0fjAr18UHN0RwEJxTl54rfgELo+cpRXRYA6MnrIdp9AChNhi/NT1crwBuxXYeCBfLRM6BXeXNhuq61vTvDBD4CsqKQHhrk3Vkmmn2k3FqZ4gsEjFL+zs4L4fTuSSRMfPhQlc4J6+MCxUA1XKfp3w+u/27Tlw49W3La58tio4qw5Bjd32oh7Dt0Kkm/ge8Jbr9KBqVxkKuA77O0FhvCpNVNC4/Bu+0esCshVPNVJekcsB5w1o6nMVv6Q/OUYqJr07OwboF93jJya7DacQQ7gY5EQrYLWbpinhhw3r3E0wDNTVJuqigyO6dhZG2TVW2AVR16bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TizVcDI5HtjKEM6LeLrJCwzea0cFMJJKYl5s7pVpJSY=;
 b=X76hAjToKlHawovABtsPWUZ6aVNO7cAdGwefb7J7eGN9Xx3mkqRHOSw31DxaN41yHJhnaWHh6VGQEVtlYjX4zP0lLx+s0JnSjUuEyhQd8x15Gijs4wvz3KXjkDUJgGoCr0HhNBnHsd7uTsGO+6I24vyboK6QIR0K3DMwE0cTo2w=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17 v2 0/5] (v)pci: fixes related to memory decoding
 handling
Thread-Topic: [PATCH for-4.17 v2 0/5] (v)pci: fixes related to memory decoding
 handling
Thread-Index: AQHY6IBWBZfIV8vcxEqNmhmW2Z94164fNKeAgAAQKgCAAI0fAA==
Date: Wed, 26 Oct 2022 00:27:34 +0000
Message-ID:
 <AS8PR08MB79917182F722088D7F872A2192309@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <8a89c0fb-3d12-fcf9-7e53-d32f9904a3f6@suse.com>
 <Y1gIIPdQWKDZkNVD@Air-de-Roger>
In-Reply-To: <Y1gIIPdQWKDZkNVD@Air-de-Roger>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 35451000DC415346A5563C1204C11754.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8458:EE_|DBAEUR03FT018:EE_|DBBPR08MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7a9305-f401-45bd-7f7c-08dab6e8e4f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sMQZuaYDyI5KRnMRbVs75i0cP/C09VvtlUC0O1/rnTilkpxdZb+zpQ8f91LwdhzJewfN0utoNpm3sQ7Np/l/6A1OXnzoZEbovfekX/spQepjhuROCE9VFDcifx3ONh2cBGsyrSCYjLYVbJ9Kj7w+q6bEdS2wK2lso6VEcJxn+lo+mtXOsvlv9XlKkLbzotQ886k5CinYet4OzvRQQtlpLDUbwczc7tu9yblnwldUggNJ19dvavbTdifw9nUCHkRlSGowm3l8JZc5en3XxzCt4T5kuNv1mUBdD19Dw3JcpJdcO5oSbO6OwrJp3nAWOjh9QmQdz9eoehlWs7bv2sBSun80WjtgRzySV7M+DxCcaIwhzoCHES5QshjZS1jZSvzrmfjrROyg6ZyUZQwwSOw0fOykwuY6UfYXpelrDTA7IkkjGasJuSflOqdfeOz5kPc9ENTxrIvzsvt76ZfvFgnIYU7g9bfFDy8xuYV5JzGbcDyvnXV+uxvF57ePYUkI8jktW6S+353pC9Dl3kk1AIr79x8uqe+Yu5S3kb8X0TaXl+LQIs10AmevIiYpMhAYXgg6yoHBiqHDv7fASLxQhSbMVy36DPyaM9HLi/s0naiAFZHBQ98E9l70wRDAOAxHqXLuLj55hfqqLeniAR7ioCf2SWHK+OU6yKqAGOjvDcD2II7DfxIdhqjDgNr+Dx18tX9bnmTwICmE8cKF4HnBBGsY5n1XHYbD2GF1QNOa8xLszZeRCRsvAT8CduYGS1OQ/sx52Evfk5bUb1z0DEFa4yToxg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(186003)(110136005)(33656002)(52536014)(478600001)(26005)(41300700001)(8936002)(9686003)(86362001)(316002)(54906003)(55016003)(83380400001)(5660300002)(38070700005)(66946007)(66446008)(53546011)(38100700002)(64756008)(66556008)(76116006)(8676002)(66476007)(6506007)(122000001)(71200400001)(4326008)(7696005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae6c83f5-e75a-4c74-857a-08dab6e8e0fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LD9TxUBmH7QIqK4tmU9LK7TfJGKReRONeOX2wOLFQ3S+utmCe1z9BQ3Sbger8Gbhhm1WcgveM72aAW9h64H78hQsrNMtY4XUnhx2I9sZ/BwkDss9ibPltXQHQlBpdMF9l59MpAVgVJre2F9U99lSjcb93JkftXdceLnSxODNdhfZ7+RSFWudfMDhjjnoaInHD6cMoCgvXzb2OHHX3C2JtyssfynqLAjEU4CjhhFcYR9rR6npArilIoTOgSRLCIDDH0+hGLhacKAh8C1vZGDwPiuKosTiOaf8lVr2H3iUiwpZg9nGGd611sEr9g7d9L2B16t4/ung/XB1wQMijwDtsK8cbqGySfX34lV/3GSubOsKawPvPTU5JZSiRYrdJ1dPgV2U1f26yoA5DMXzsAN3J3k9br5f+7hUKPgHBT3xNklH4Fv8/9aAIZ9Uo2xM/6+HSPl+BA6pyDaNstehRe5Wz/b2Rq7mBVJfqdt5eTMm7QbXa/HzLi6Rr8S0ISsnz4OsxciRgPP9gapy+NnRGVHHuKH7qDVG0ywmJGN5jKbv0qKdUZd2cuqoUkFCVkEBYk7IWgUG59HV/X5wkSAb/pjaB6TR7QjweYYSd0aWlpss8nRwQUS0dvEw45sfBB4hi05Hl/xEQ24RAYN5vfDsbNDgmXmNmqqxt1nPz9xWzJ/9Q7C7WPPWSXbY8S4E3cx+HgTwiCdLW3S6DoC1CKAZfWlPqkOwsjaW2KarnwXW2A6vpeQcH2cH7PASH6Tr2p5tQCGu6a+GGcYloWH+JwV//mf0wg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(70586007)(7696005)(316002)(52536014)(6506007)(53546011)(40460700003)(54906003)(41300700001)(33656002)(4326008)(2906002)(8676002)(110136005)(26005)(9686003)(5660300002)(86362001)(70206006)(82310400005)(81166007)(478600001)(8936002)(40480700001)(47076005)(356005)(55016003)(36860700001)(83380400001)(82740400003)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 00:27:41.6308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7a9305-f401-45bd-7f7c-08dab6e8e4f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6233

SGkgUm9nZXIgYW5kIEphbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCBmb3ItNC4xNyB2MiAwLzVdICh2KXBjaTogZml4ZXMgcmVsYXRlZCB0byBtZW1vcnkg
ZGVjb2RpbmcNCj4gaGFuZGxpbmcNCj4gDQo+IE9uIFR1ZSwgT2N0IDI1LCAyMDIyIGF0IDA1OjAy
OjQxUE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDI1LjEwLjIwMjIgMTY6NDQs
IFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gPiA+IEhlbGxvLA0KPiA+ID4NCj4gPiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGF0dGVtcHRzIHRvIGZpeCB0aGUgcmVncmVzc2lvbnMgY2F1c2VkIGJ5IDc1
Y2M0NjBhMWINCj4gPiA+ICgneGVuL3BjaTogZGV0ZWN0IHdoZW4gQkFScyBhcmUgbm90IHN1aXRh
Ymx5IHBvc2l0aW9uZWQnKSBhbmQgdGhlIGxhc3QNCj4gPiA+IHBhdGNoIHJlbGF4ZXMgdGhlIGNo
ZWNrIGRvbmUgd2hlbiBhdHRlbXB0aW5nIHRvIHdyaXRlIHRvIEJBUnMgd2l0aA0KPiA+ID4gbWVt
b3J5IGRlY29kaW5nIGVuYWJsZWQuDQo+ID4gPg0KPiA+ID4gSSBjb25zaWRlciBhbGwgb2YgdGhl
bSBidWcgZml4ZXMsIGFsYmVpdCB0aGUgbGFzdCBwYXRjaCBpcyBub3QgZml4aW5nIGENCj4gPiA+
IHJlZ3Jlc3Npb24gKHNpbmNlIHZQQ0kgY29kZSBoYXMgYWx3YXlzIGJlaGF2ZWQgdGhpcyB3YXkp
Lg0KPiA+ID4NCj4gPiA+IFRoYW5rcywgUm9nZXIuDQo+ID4gPg0KPiA+ID4gUm9nZXIgUGF1IE1v
bm5lICg1KToNCj4gPiA+ICAgdnBjaTogZG9uJ3QgYXNzdW1lIHRoYXQgdnBjaSBwZXItZGV2aWNl
IGRhdGEgZXhpc3RzIHVuY29uZGl0aW9uYWxseQ0KPiA+ID4gICB2cGNpL21zaXg6IHJlbW92ZSBm
cm9tIHRhYmxlIGxpc3Qgb24gZGV0YWNoDQo+ID4gPiAgIHZwY2k6IGludHJvZHVjZSBhIGxvY2Fs
IHZwY2lfYmFyIHZhcmlhYmxlIHRvIG1vZGlmeV9kZWNvZGluZygpDQo+ID4gPiAgIHBjaTogZG8g
bm90IGRpc2FibGUgbWVtb3J5IGRlY29kaW5nIGZvciBkZXZpY2VzDQo+ID4gPiAgIHZwY2k6IHJl
ZnVzZSBCQVIgd3JpdGVzIG9ubHkgaWYgdGhlIEJBUiBpcyBtYXBwZWQNCj4gPg0KPiA+IExvb2tz
IGxpa2UgeW91J3ZlIGxvc3QgSGVucnkncyByZWxlYXNlLWFjayB0aGF0IHdhcyBnaXZlbiBmb3Ig
YWxsIG9mIHYxDQo+ID4gKGkuZS4gb25seSBwYXRjaCAyIGlzbid0IGNvdmVyZWQgYnkgaXQpLg0K
PiANCj4gSSB3YXMgd29ycnkgYWJvdXQgYWRkaW5nIGl0IGFnYWluIGZvciB0aGUgd2hvbGUgc2Vy
aWVzIChleGNlcHQgcGF0Y2gNCj4gMiksIGFzIEkgdGhpbmsgcmVsZWFzZS1hY2tzIGFyZSBjb25k
aXRpb25hbCB0byB0aGUgdGltZSB0aGV5IGFyZQ0KPiBnaXZlbi4gIElPVzogYSByZWxlYXNlLWFj
ayBnaXZlbiBmb3IgYSBwcmV2aW91cyBzZXJpZXMgc2VudCBtYXliZQ0KPiB3ZWVrcyBhZ28gc2hv
dWxkbid0IGJlIGNhcnJpZWQgb3ZlciBiZWNhdXNlIGNvbmRpdGlvbnMgdG8gZ2V0IGNoYW5nZXMN
Cj4gYWNjZXB0ZWQgbWlnaHQgYmUgdGlnaHRlciBhcyB3ZSBwcm9ncmVzcyB3aXRoIHRoZSByZWxl
YXNlLg0KDQpUaGFua3MgZm9yIGJlaW5nIGNvbnNpZGVyYXRlISBUaGUgcmVsZWFzZSBhY2sgc3Rp
bGwgaG9sZHMuDQoNCj4gDQo+IEkgdGhpbmsgSGVucnkgd291bGQgYmUgZmluZSB0byByZWFzc2Vz
cyB0aGUgc3VpdGFiaWxpdHkgb2YgdGhlIHNlcmllcw0KPiBvbmNlIGl0IGdldHMgcHJvcGVybHkg
QWNrZWQuDQoNCk5vIHByb2JsZW0sIGZvciB0aGUgd2hvbGUgc2VyaWVzIChnaXZlbiB0aGF0IHRo
aXMgaXMgYSBidWcgZml4IHNlcmllcykNCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpCdXQgYSByZW1pbmRlcjogcGF0Y2ggIzQgYW5kICM1IG5l
ZWQgcmV2aWV3L2FjayBmcm9tIG1haW50YWluZXJzLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K
DQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0K

