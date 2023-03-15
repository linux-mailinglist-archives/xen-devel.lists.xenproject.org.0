Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2C6BADD0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 11:40:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510018.786932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcOYB-0003q6-Lf; Wed, 15 Mar 2023 10:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510018.786932; Wed, 15 Mar 2023 10:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcOYB-0003o6-Id; Wed, 15 Mar 2023 10:40:07 +0000
Received: by outflank-mailman (input) for mailman id 510018;
 Wed, 15 Mar 2023 10:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pcOY9-0003UB-32
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 10:40:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd654344-c31d-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 11:40:02 +0100 (CET)
Received: from DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) by PAVPR08MB9697.eurprd08.prod.outlook.com
 (2603:10a6:102:31c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 10:39:59 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::74) by DUZPR01CA0073.outlook.office365.com
 (2603:10a6:10:3c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Wed, 15 Mar 2023 10:39:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.16 via Frontend Transport; Wed, 15 Mar 2023 10:39:58 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Wed, 15 Mar 2023 10:39:58 +0000
Received: from 47482491de13.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F4A9BC7-F21B-48AC-B959-A97710ACB618.1; 
 Wed, 15 Mar 2023 10:39:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47482491de13.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Mar 2023 10:39:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9474.eurprd08.prod.outlook.com (2603:10a6:20b:5e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 10:39:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 10:39:50 +0000
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
X-Inumbo-ID: bd654344-c31d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lkQ7hzZ/m7eh9ldF7z3nmWlsm1gjaO5gj8a8zhvMkk=;
 b=tWlJvz4gjUEzNWi7sIwpDAUfxGiB81KZCRD0i5rzAkNSr+y91crCyDoY24or8slJR58lQBN/zOxxBU9HCbVhTvR7lZkai/rQExFRzEfZE2ppVdbHLK5p2nDaz2b5BT/DrDzrksG1TmGSYH2wtJyRjWcQ2LECb72uMjs9tbVNT/Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25de4ae6de61e2d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n74yPV9th+JcYktXLwz79TG0ZzrL4O305jgOe2EVygczJWVpXNApVjGPn8C+rlbLj6R/QVZFcGDNMdOb2rSdeXD6t+SjCBVUHoCUJ/2gUDwOzRU241Tl+qR8A7CD4GiPmnaVIns6fwL7GXLoZemsGk1Awx3dk0bR3/rInIMfKpeE1hoHhXaSdukWdqp0NjKpOsrmMvKoNIX+rG/GCi6k3BTjhK/N4shi7nH9VkKR9OJC9mcWBZ37aoQ1JLkfFz/AQWtYdbMeFNdxUBWFufxWjEBAeaWj+NRkQ41qsxtPESkthZNGHXe9PCaNnvJZC4HAi9U6515SIK3yipKq+bRKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lkQ7hzZ/m7eh9ldF7z3nmWlsm1gjaO5gj8a8zhvMkk=;
 b=D337B6/KljH8oxDaMOlIXoRMi6HUEakInzFv/0VgQhPTmQ4sEzH4tjXXCV9CszyznvtqngZJI8UKY5QkQe03lxQBdZeO8mQyot5oKMME959thWdHRg1d+0E2cydFgBA9YYAqBgmVpbF4toT5D1G9zitLcSY60IyUVLjS4dYwtB1koo7AAlmlmRUBk4qAmh9M+q/Smx6s6sLQ+d4Nq/6KVFPq5SBeHR0Y/NTtfRAPZTnjLlbpPXxGsc4+mF/96L/ITPH2q5sBc5Pgvmszxp6sewGzFeSujFKH1pP3KN4M05em4MPND9gOoQpJWP1PjbDojhem/4lbJjaRxhedCLVbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lkQ7hzZ/m7eh9ldF7z3nmWlsm1gjaO5gj8a8zhvMkk=;
 b=tWlJvz4gjUEzNWi7sIwpDAUfxGiB81KZCRD0i5rzAkNSr+y91crCyDoY24or8slJR58lQBN/zOxxBU9HCbVhTvR7lZkai/rQExFRzEfZE2ppVdbHLK5p2nDaz2b5BT/DrDzrksG1TmGSYH2wtJyRjWcQ2LECb72uMjs9tbVNT/Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 07/10] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Thread-Topic: [PATCH v2 07/10] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Thread-Index: AQHZVx2Hf4sdBuYhokaIxQfgAUOzUa77lnqAgAAQLoA=
Date: Wed, 15 Mar 2023 10:39:50 +0000
Message-ID: <0796E8D4-A5A2-4319-942B-C25B54D054C6@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-8-luca.fancellu@arm.com>
 <29cf7623-688a-4b88-c684-cf195d0626dd@suse.com>
In-Reply-To: <29cf7623-688a-4b88-c684-cf195d0626dd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9474:EE_|DBAEUR03FT037:EE_|PAVPR08MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1596f424-75c8-49d8-3041-08db25419ff9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oVLR2OHKDP/qyUHk5t1XJAYv0FmFGoVSTB5MLqTyIWG5gecNCNUJIHSsdN9y0MgWyh/1PglscYfglqcot/8LGuqn1fqlEcubmWbM1OtS05xhnKxB4FvTfokuNSrcWRq+Gt9FLfn6I9uaV/LYab3eg+dq2JvFAXpfU9m/Z3XBvYyWH2Ax7NvDlwEKxOgb89/9eDoK2chHl7O/xYquBT6VXkwUt9tVH8hClSpj0NTfDFlVBSFFYMtUSuZkGt2Fm+2XOntTI2s//Kqnc4El3nrHhrhnoM4LNqy3/KlV9CNUCe/BPtAzeLpaH9XUq7moL+3OIPqXZOShR5MY/Sjiw3wyGu55S0xdJ6s7pkaOxv3b3SRpo7YPw3zPn8+p8NrvP8LfwVEPFjnJSkzoZVw9zFvJDdqWyzc9z9qWSfN6yK+sPo2Hs7KQObrbiqbrXeUyGdn+V17OIiH0/QoCFD2jt6noOu8O6c7HRzzVsYe293hsiBaFtfBZoSYZ89tL4Z0bPf5XAm2nqpAqFPEuHrO3wI0c1VFBv/0+5rSelR/Yz4a3SzpPqKNdVYZp1GWXusnPvJDR9yGyIzqrAxo/BslGspzB01y7Mcpn1EtqrqunXZNKlILj6zG7Hm5no9EPA0lqqY6ISGw0KmYU4qBN3tTACP6Qq5GMsNJ6+Y2np6DnCxKrp+fQEH+iEVNR5XqTdl6yHIMRWpVcgGs3PhzntoUi2hQH+EF1dWrTTUfRVWYYul5FRnY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(86362001)(36756003)(33656002)(38070700005)(4326008)(41300700001)(8936002)(6916009)(5660300002)(54906003)(66556008)(64756008)(478600001)(66946007)(91956017)(66476007)(76116006)(316002)(66446008)(8676002)(2906002)(83380400001)(38100700002)(122000001)(53546011)(6486002)(6506007)(6512007)(71200400001)(26005)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6D9EDC9C840924BBA5B341FC5E4799A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9474
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	736d8b1d-b8f3-4a26-e2e7-08db25419ad7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Vl2sli3d5zIuofiAP0V39FQR5Q3KgdWtj5f1+hk9yqPMSIne25CyNH2+hp0jnzC+JhyjjNJUbXkSQWB76LGuMArSi1wvLVm4WZRDmZb9uuv1j8r0KnufCgBP+XykRAfBtFvHQKpezecoGoPwLpevvBLLOonNqSYKFZEmpNNXegN6viRorBuRUfw6UwhbPsgRhF3gKceevkfoAa82vVQ+df7Bi18TQUfFgogcB5LfQMh6pj0fUIJ0QcYVh/7fUQ9S+M8ao5sAs7XeX2hfv0pQsLZteHR5MNU1b3K2/ZiIXNoTQOjE29fvDa+0G6qljI+8Xdx8FCgCW2y3Go2N7mPpYEq2LwIx2/X/CukECVioJ+Pr/JTKJe1dYQ68W2pxNrvVYiOho8eBCmYLohuB4SoV7ooytrIbGzcTeryKbCcCIiWn8ZBNhQWeKvNwuGXcXl592FETaWs2T9PuJjfTTl8yK7Rlr5xY5k6xf/shZArok9w9tiVAAMCxOLPbTlQfbhJ1d5gluhu2Fu20joWo6hqXazsCHWSgUu2Nr1nDSk3AtZIKLhtYVsi6kdk9maGzTIxJg0N+WTZvfoVySN4UrY8Y3eMMrDT/OPwKXCw7z6eUEnxLCGt2etidCbYH1y++JG2Q333rs1b5xDSUQKbgJOAWYSunV5rLYTL5ielHSUI0dGNbocnK87ol8BcgBysLzeJ2cgHYv6lg58MMIX5NdviMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(40470700004)(46966006)(36840700001)(336012)(47076005)(54906003)(316002)(40460700003)(36756003)(33656002)(40480700001)(356005)(86362001)(82740400003)(81166007)(36860700001)(53546011)(83380400001)(82310400005)(186003)(6512007)(6506007)(26005)(2616005)(5660300002)(6486002)(478600001)(41300700001)(70206006)(2906002)(6862004)(8936002)(4326008)(8676002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:39:58.9911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1596f424-75c8-49d8-3041-08db25419ff9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9697

DQoNCj4gT24gMTUgTWFyIDIwMjMsIGF0IDA5OjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTUuMDMuMjAyMyAxMDowNSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUvcHVibGljL3N5c2N0bC5oDQo+PiBAQCAtOTQsNiArOTQsOSBAQCBzdHJ1Y3QgeGVu
X3N5c2N0bF90YnVmX29wIHsNCj4+IC8qIE1heCBYRU5fU1lTQ1RMX1BIWVNDQVBfKiBjb25zdGFu
dC4gIFVzZWQgZm9yIEFCSSBjaGVja2luZy4gKi8NCj4+ICNkZWZpbmUgWEVOX1NZU0NUTF9QSFlT
Q0FQX01BWCBYRU5fU1lTQ1RMX1BIWVNDQVBfZ250dGFiX3YyDQo+PiANCj4+ICsjZGVmaW5lIFhF
Tl9TWVNDVExfUEhZU0NBUF9BUk1fU1ZFX01BU0sgICgweDFGVSkNCj4+ICsjZGVmaW5lIFhFTl9T
WVNDVExfUEhZU0NBUF9BUk1fU1ZFX1NIRlQgICgwKQ0KPiANCj4gVGhlIHNlY29uZCBvZiB0aGVz
ZSBjYW4gYmUgaW5mZXJyZWQgZnJvbSB0aGUgZmlyc3QsIHNvIEknZCBsaWtlIHRvIGFzaw0KPiB0
aGF0IHJlZHVuZGFudCBkZWZpbml0aW9ucyBiZSBvbWl0dGVkIGZyb20gdGhlIHB1YmxpYyBoZWFk
ZXJzLiBGb3IgdGhlDQo+IGNvZGUgdXNpbmcgdGhlIGNvbnN0YW50IHdlIHNwZWNpZmljYWxseSBo
YXZlIE1BU0tfSU5TUigpLg0KPiANCj4gSnVzdCBsaWtlIHRoZXJlIGFscmVhZHkgYXJlIHg4Ni1z
cGVjaWZpYyBzZWN0aW9ucyBpbiB0aGlzIGZpbGUsIEkgdGhpbmsNCj4gdGhlIHJlbWFpbmluZyBz
aW5nbGUgI2RlZmluZSBhbHNvIHdhbnRzIGVuY2xvc2luZyBpbiAiI2lmZGVmIF9fYWFyY2g2NF9f
Ig0KPiBoZXJlLg0KPiANCg0KVGhhbmsgeW91LCBJIHdhc27igJl0IGF3YXJlIG9mIHRoYXQgdXNl
ZnVsIG1hY3JvLCBJIHdpbGwgdXNlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24gYW5kIEnigJlsbA0K
ZW5jbG9zZSB0aGUgbWFzayB1c2luZyBpZmRlZi4NCkFyZSB5b3Ugb2sgZm9yIHRoZSBwb3NpdGlv
biBvZiB0aGUgbWFzayBkZWZpbmUgb3Igc2hvdWxkIEkgZGVjbGFyZSBpdCBzb21ld2hlcmUgZWxz
ZT8NCg0KPiBKYW4NCg0K

