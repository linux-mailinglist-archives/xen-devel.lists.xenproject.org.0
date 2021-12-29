Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72701480F2A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 04:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252288.433293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2PK2-0004tn-Ty; Wed, 29 Dec 2021 03:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252288.433293; Wed, 29 Dec 2021 03:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2PK2-0004ra-QT; Wed, 29 Dec 2021 03:08:14 +0000
Received: by outflank-mailman (input) for mailman id 252288;
 Wed, 29 Dec 2021 03:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h/ph=RO=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1n2PK1-0004rU-Le
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 03:08:13 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe07::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d489ec3-6854-11ec-9e60-abaf8a552007;
 Wed, 29 Dec 2021 04:08:10 +0100 (CET)
Received: from AM6P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::19)
 by DB7PR08MB3242.eurprd08.prod.outlook.com (2603:10a6:5:1a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 03:08:07 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::81) by AM6P192CA0006.outlook.office365.com
 (2603:10a6:209:83::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Wed, 29 Dec 2021 03:08:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18 via Frontend Transport; Wed, 29 Dec 2021 03:08:07 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Wed, 29 Dec 2021 03:08:06 +0000
Received: from 496210918385.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11F278BF-59DE-4C52-8538-02F1B1423D21.1; 
 Wed, 29 Dec 2021 03:08:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 496210918385.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 03:08:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7466.eurprd08.prod.outlook.com (2603:10a6:102:2b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 03:07:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::14a4:bbac:9e52:a89]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::14a4:bbac:9e52:a89%6]) with mapi id 15.20.4844.014; Wed, 29 Dec 2021
 03:07:58 +0000
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
X-Inumbo-ID: 8d489ec3-6854-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efIaF1qLuE1qm2AhriBGjfCqUlFRQKWyaN0KzsHtSuw=;
 b=8ueouPmwN2vltwXbBT01+ZauHz2joLyh+gkT1nzrgYXaD0Z1/XMwY3egSjYe2sEAIovmL/MlR1+iPq2mDVPlmNBsyTSJfR1TkhO/HbF7JSrsAUjAPO/raNv0f93wg9OsKg9Y0tz4AUFAPVYcMz1kXr7hJrT8CxFYW6+FjGSfvT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8s4XqGfT/gWx0X8anefadGPbUXfDsNF7uUssACy9Hthb5JCQMiJ1wX+0UtZc/ni2F2RzXN7QryL9s/HEY9Y5/tSSz1agt+oLA5GVtm/nBgZbOdc0DiCY+q9bVje3GFtaOFQgJC/OsjYi+p9+uTOnnK2K9s7FK44ADcPOXkMCpqtaYfq3DB76Gbrxhd6QlNFA/hQWXUS5h6Sv/YLC5LVs+sTnFzF2wlcp1a5orPH4GJAshSV7LcQkAvE0mvtNkfuKRJ4LfiTwFJ97rHJzEsB3XYqgdsJpcSlJg/Bwjoxk8GW2cEB9IEhFA+L6Rt0uwvVh6djoVX26g1DpNK/gT8Z2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efIaF1qLuE1qm2AhriBGjfCqUlFRQKWyaN0KzsHtSuw=;
 b=Mx+vpWKT1+uGIqMzkLoiyTsPd4Ih1+TJ1SCWUNEnHWhZtLLVongdq5E5XDK9Swgl73TKp7vigu/9lH8WhibCBpoykn6z4OsLRi8yF7xoFmqLLuAUROnDs10ghpGsjVd7d2FwshjTNXJBjLL+MOqSScEYp7H1F6aDLLBy7+pYo8AwTnyoI6kp2kLwd9tm78+xIJkhksrJ6aevLSBsydz1EBBwMnJl2wd40dAjmArqv4SNi7s6MPELpSDE/ufCPdRNGQOVMRXE2x+GiQqwSsCCeg3htgbMUtR2vdAo5n/MdzqZ0111SWgI3l7FQe5BUFdZBOXMHBLgjiYA+stQnA4NNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efIaF1qLuE1qm2AhriBGjfCqUlFRQKWyaN0KzsHtSuw=;
 b=8ueouPmwN2vltwXbBT01+ZauHz2joLyh+gkT1nzrgYXaD0Z1/XMwY3egSjYe2sEAIovmL/MlR1+iPq2mDVPlmNBsyTSJfR1TkhO/HbF7JSrsAUjAPO/raNv0f93wg9OsKg9Y0tz4AUFAPVYcMz1kXr7hJrT8CxFYW6+FjGSfvT8=
From: Wei Chen <Wei.Chen@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: RE: [PATCH] tools/libxc: Drop copy-in in xc_physinfo()
Thread-Topic: [PATCH] tools/libxc: Drop copy-in in xc_physinfo()
Thread-Index: AQHX+Bl8am17YIUWIE21NwFF13uUc6xI0f0Q
Date: Wed, 29 Dec 2021 03:07:56 +0000
Message-ID:
 <PAXPR08MB74206290792C8F74D166C5A29E449@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20211223162244.16198-1-andrew.cooper3@citrix.com>
In-Reply-To: <20211223162244.16198-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F6520E4D1A13D74C8DDABDE8D6D9FD7C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a316a500-be26-4de6-3165-08d9ca786fe7
x-ms-traffictypediagnostic:
	PAXPR08MB7466:EE_|AM5EUR03FT019:EE_|DB7PR08MB3242:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3242C47C1B92105E321141359E449@DB7PR08MB3242.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mx3bBBH/Ivt0kMIokGIpuJaN7+gQm3xUeazxqw53zPZzpBqvVqY9KED9RDSX5WG0qMmEQ4SyKUB3JWc8WKSNzt2xqwrE5cTKJ4T7RpFGOk1QZEL+tK+CKxoXada6S3AobLY3ZaLasHHBFk0+K3Z/GZY6Yqd0AX4CUFmhcy93HDw052b9qM9+yfTtuavWLPerpZ8jfsyAhzuJV9obcazXFdNevcRPmKGcDprQ6qaGdeBG1EygDefRib/oJObUhgGZMaOX1a2PLlz0jcU+2+v2q2IGz/OnJeUftyj1fmjnb54exS+rek8HtEjzBUb0JteBQumKZAMRwqB2b3z0WlR/igy41dyPvEqmzNldaBkkV5+UlaLLccen0GkqIxcQq7f4Mcy9S2bmDwpLsgrsFbWldNeFWi9kOKHyB46yE2xk2YiQfembdp54ETaL1ND2GMyRh8Gh+5aIAApdP0Ol+xQ7PIXSFdcbf4HtKVVVI1rFCvaX9rPZSFnzfEJkm6KmwbsMaS61LpQuaFjOikI02fajTEaotBB2KzuPCEznft+8MY8Os2403GfVLk8sNpjFAcR86Ve1m9iKQKyvCsjqn45UzGNyAFCRxCGrypZWC1ZtihpNCL7tqLIlHNdmrEeeARqbfWHNwYT0dFWD58FSOA/Kf91UWASSgViM4U94nNHu26JqqM+MmzW0tjiNzIdxU7M4zXD/enIhzdUyJwxzXdJ81A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(9686003)(38070700005)(86362001)(55016003)(26005)(71200400001)(66556008)(2906002)(66476007)(53546011)(6506007)(508600001)(76116006)(33656002)(38100700002)(8676002)(66946007)(64756008)(110136005)(54906003)(83380400001)(66446008)(4326008)(122000001)(8936002)(7696005)(316002)(5660300002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7466
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d6f5c8e-919d-450b-43e5-08d9ca786a92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YXkiTytFFhdnGqA5agAaxiUFWpiIaM2xCfVVJvKOwaAiOtjXVrXYmdA2cNokDYHypQtsTOYKH+JJXnAtIWA/5FLgg+1/4SmBwfaiwBJeHfknHFZa9i61YlhKCvWro0G8ip869j1Xb4FSoJnA8g2RYx3P52WQofbAbgyMq2fVHtLVk4DADsYXHYZza9klJToG+AbMbkA5uz7ayYvXWUVvjeLdbJm0emJ01Q2Q/vsetFQ0CdzOjq/SQz5nXh8GC+4uwVWSxzKeH+2xKxyFfHKPTkA+H1zTeAq9W7vPP66xUOTTZ5plxHqNGqusEjifHuYiP+vKIdR51WTqL+VwLxm5y5cDQJpE4BMWJANnl9d3zrQ4RytjS0HufM/ApkKflkpm3p1y24i01nZ1EjuaeYucj7bmE8sdFol9huV6nH8/muPabE9I+6dLz/CUWqB5R15jmK3YypRrd9JeSUETuS1UIi/yaV5+qemZx+YmKzA5fEHWLNo6ghGRMJA5Bt+1+tna/uklnTCqDUj65Bs7UHNgWXu4l8k5nkrI2H10nwFeYTZTryLc153Ru+5V/5RgRZGwoRa1dz9Z+qcA5RSrwrEiHr9QGN5IcHR1EUMhrCy9p1LtUKzp9TvWuUMviBJScqTi2Pzesuz1NcQUgjFbAFLjLuUqzPPO4OXXWcDD8CPCtX+Sja4y15na9iEwj/c/4J0Ck1kwXwIqK4m8m1tpwLyjgw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(9686003)(55016003)(356005)(70206006)(186003)(5660300002)(36860700001)(86362001)(82310400004)(316002)(4326008)(8936002)(2906002)(26005)(54906003)(47076005)(33656002)(336012)(107886003)(110136005)(7696005)(8676002)(83380400001)(6506007)(52536014)(70586007)(53546011)(508600001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 03:08:07.1163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a316a500-be26-4de6-3165-08d9ca786fe7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3242

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBBbmRyZXcgQ29vcGVyDQo+IFNlbnQ6IDIwMjHE6jEy1MIyNMjVIDA6MjMNCj4gVG86IFhl
bi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIHRvb2xzL2xpYnhjOiBEcm9wIGNvcHktaW4gaW4geGNfcGh5c2lu
Zm8oKQ0KPiANCj4gVGhlIGZpcnN0IHRoaW5nIFhFTl9TWVNDVExfcGh5c2luZm8gZG9lcyBpcyB6
ZXJvIG9wLT51LnBoeXNpbmZvLg0KPiANCj4gRG8gbm90IGNvcHktaW4uICBJdCdzIHBvaW50bGVz
cywgYW5kIG1vc3QgY2FsbGVycyBkb24ndCBpbml0aWFsaXNlIHRoZWlyDQo+IHhjX3BoeXNpbmZv
X3QgYnVmZmVyIHRvIGJlZ2luIHdpdGguICBSZW1vdmUgdGhlIHBvaW50bGVzcyB6ZXJvaW5nIGZy
b20gdGhlDQo+IHJlbWFpbmluZyBjYWxsZXJzLg0KPiANCj4gU3BvdHRlZCBieSBDb3Zlcml0eS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQo+IC0tLQ0KPiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+DQo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0tLQ0KPiAg
dG9vbHMvbGlicy9jdHJsL3hjX21pc2MuYyB8IDIgLS0NCj4gIHRvb2xzL2xpYnMvbGlnaHQvbGli
eGwuYyAgfCAyICstDQo+ICB0b29scy9saWJzL3N0YXQveGVuc3RhdC5jIHwgMiArLQ0KPiAgdG9v
bHMvbWlzYy94ZW5wbS5jICAgICAgICB8IDIgKy0NCj4gIHRvb2xzL3hlbm1vbi94ZW5iYWtlZC5j
ICAgfCAyICstDQo+ICB0b29scy94ZW50cmFjZS94ZW50cmFjZS5jIHwgMiArLQ0KPiAgNiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlicy9jdHJsL3hjX21pc2MuYyBiL3Rvb2xzL2xpYnMvY3RybC94Y19taXNj
LmMNCj4gaW5kZXggMzgyMDM5NDQxM2E5Li4yNjVmMTVlYzJkYTMgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL2xpYnMvY3RybC94Y19taXNjLmMNCj4gKysrIGIvdG9vbHMvbGlicy9jdHJsL3hjX21pc2Mu
Yw0KPiBAQCAtMTk1LDggKzE5NSw2IEBAIGludCB4Y19waHlzaW5mbyh4Y19pbnRlcmZhY2UgKnhj
aCwNCj4gDQo+ICAgICAgc3lzY3RsLmNtZCA9IFhFTl9TWVNDVExfcGh5c2luZm87DQo+IA0KPiAt
ICAgIG1lbWNweSgmc3lzY3RsLnUucGh5c2luZm8sIHB1dF9pbmZvLCBzaXplb2YoKnB1dF9pbmZv
KSk7DQo+IC0NCj4gICAgICBpZiAoIChyZXQgPSBkb19zeXNjdGwoeGNoLCAmc3lzY3RsKSkgIT0g
MCApDQo+ICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
cy9saWdodC9saWJ4bC5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bC5jDQo+IGluZGV4IGE3N2Fh
ODU2ZmRkNi4uNjY3YWU2NDA5YmU3IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xp
YnhsLmMNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bC5jDQo+IEBAIC0zNTEsNyArMzUx
LDcgQEAgY29uc3QgY2hhciAqbGlieGxfZGVmYm9vbF90b19zdHJpbmcobGlieGxfZGVmYm9vbCBi
KQ0KPiANCj4gLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gKioqKiovDQo+ICBpbnQgbGlieGxfZ2V0X3Bo
eXNpbmZvKGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9waHlzaW5mbyAqcGh5c2luZm8pDQo+ICB7DQo+
IC0gICAgeGNfcGh5c2luZm9fdCB4Y3BoeXNpbmZvID0geyAwIH07DQo+ICsgICAgeGNfcGh5c2lu
Zm9fdCB4Y3BoeXNpbmZvOw0KPiAgICAgIGludCByYzsNCj4gICAgICBsb25nIGw7DQo+ICAgICAg
R0NfSU5JVChjdHgpOw0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9zdGF0L3hlbnN0YXQuYyBi
L3Rvb2xzL2xpYnMvc3RhdC94ZW5zdGF0LmMNCj4gaW5kZXggZTQ5Njg5YWEyZGE5Li44YmFiMmU2
NmE3ZmUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvc3RhdC94ZW5zdGF0LmMNCj4gKysrIGIv
dG9vbHMvbGlicy9zdGF0L3hlbnN0YXQuYw0KPiBAQCAtMTM1LDcgKzEzNSw3IEBAIHhlbnN0YXRf
bm9kZSAqeGVuc3RhdF9nZXRfbm9kZSh4ZW5zdGF0X2hhbmRsZSAqIGhhbmRsZSwNCj4gdW5zaWdu
ZWQgaW50IGZsYWdzKQ0KPiAgew0KPiAgI2RlZmluZSBET01BSU5fQ0hVTktfU0laRSAyNTYNCj4g
IAl4ZW5zdGF0X25vZGUgKm5vZGU7DQo+IC0JeGNfcGh5c2luZm9fdCBwaHlzaW5mbyA9IHsgMCB9
Ow0KPiArCXhjX3BoeXNpbmZvX3QgcGh5c2luZm87DQo+ICAJeGNfZG9tYWluaW5mb190IGRvbWFp
bmluZm9bRE9NQUlOX0NIVU5LX1NJWkVdOw0KPiAgCWludCBuZXdfZG9tYWluczsNCj4gIAl1bnNp
Z25lZCBpbnQgaTsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL21pc2MveGVucG0uYyBiL3Rvb2xzL21p
c2MveGVucG0uYw0KPiBpbmRleCBkMDE5MWQ0OTg0ODQuLjRmOGNkZTY5MGE3YyAxMDA2NDQNCj4g
LS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jDQo+ICsrKyBiL3Rvb2xzL21pc2MveGVucG0uYw0KPiBA
QCAtMTI0NCw3ICsxMjQ0LDcgQEAgc3RydWN0IHsNCj4gIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pDQo+ICB7DQo+ICAgICAgaW50IGksIHJldCA9IDA7DQo+IC0gICAgeGNfcGh5c2lu
Zm9fdCBwaHlzaW5mbyA9IHsgMCB9Ow0KPiArICAgIHhjX3BoeXNpbmZvX3QgcGh5c2luZm87DQo+
ICAgICAgaW50IG5yX21hdGNoZXMgPSAwOw0KPiAgICAgIGludCBtYXRjaGVzX21haW5fb3B0aW9u
c1tBUlJBWV9TSVpFKG1haW5fb3B0aW9ucyldOw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bm1vbi94ZW5iYWtlZC5jIGIvdG9vbHMveGVubW9uL3hlbmJha2VkLmMNCj4gaW5kZXggMWVkMzQz
MzRjODI0Li43NTkxZGU3YzYwOWYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbm1vbi94ZW5iYWtl
ZC5jDQo+ICsrKyBiL3Rvb2xzL3hlbm1vbi94ZW5iYWtlZC5jDQo+IEBAIC00MzYsNyArNDM2LDcg
QEAgc3RhdGljIHN0cnVjdCB0X3N0cnVjdCAqbWFwX3RidWZzKHVuc2lnbmVkIGxvbmcNCj4gdGJ1
ZnNfbWZuLCB1bnNpZ25lZCBpbnQgbnVtLA0KPiAgICovDQo+ICBzdGF0aWMgdW5zaWduZWQgaW50
IGdldF9udW1fY3B1cyh2b2lkKQ0KPiAgew0KPiAtICAgIHhjX3BoeXNpbmZvX3QgcGh5c2luZm8g
PSB7IDAgfTsNCj4gKyAgICB4Y19waHlzaW5mb190IHBoeXNpbmZvOw0KPiAgICAgIHhjX2ludGVy
ZmFjZSAqeGNfaGFuZGxlID0geGNfaW50ZXJmYWNlX29wZW4oMCwwLDApOw0KPiAgICAgIGludCBy
ZXQ7DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVudHJhY2UveGVudHJhY2UuYyBiL3Rvb2xz
L3hlbnRyYWNlL3hlbnRyYWNlLmMNCj4gaW5kZXggYTg5MDNlYmY0NjI1Li44NjRlMzBkNTBjYzMg
MTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnRyYWNlL3hlbnRyYWNlLmMNCj4gKysrIGIvdG9vbHMv
eGVudHJhY2UveGVudHJhY2UuYw0KPiBAQCAtNTg5LDcgKzU4OSw3IEBAIHN0YXRpYyB2b2lkIHNl
dF9ldnRfbWFzayh1aW50MzJfdCBtYXNrKQ0KPiAgICovDQo+ICBzdGF0aWMgdW5zaWduZWQgaW50
IGdldF9udW1fY3B1cyh2b2lkKQ0KPiAgew0KPiAtICAgIHhjX3BoeXNpbmZvX3QgcGh5c2luZm8g
PSB7IDAgfTsNCj4gKyAgICB4Y19waHlzaW5mb190IHBoeXNpbmZvOw0KPiAgICAgIGludCByZXQ7
DQo+IA0KPiAgICAgIHJldCA9IHhjX3BoeXNpbmZvKHhjX2hhbmRsZSwgJnBoeXNpbmZvKTsNCj4g
LS0NCj4gMi4xMS4wDQo+IA0KDQpSZXZpZXdlZC1ieTogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5j
b20+DQoNCg0K

