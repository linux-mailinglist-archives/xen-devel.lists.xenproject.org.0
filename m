Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A54567FFD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361872.591646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zc0-0000Bu-Ss; Wed, 06 Jul 2022 07:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361872.591646; Wed, 06 Jul 2022 07:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zc0-00007M-JO; Wed, 06 Jul 2022 07:38:16 +0000
Received: by outflank-mailman (input) for mailman id 361872;
 Wed, 06 Jul 2022 07:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zVI-0004kS-52
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:31:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2074.outbound.protection.outlook.com [40.107.104.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a068faae-fcfd-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:31:19 +0200 (CEST)
Received: from DB3PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:8:1::20) by
 VE1PR08MB4735.eurprd08.prod.outlook.com (2603:10a6:802:a2::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15; Wed, 6 Jul 2022 07:31:01 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::55) by DB3PR06CA0007.outlook.office365.com
 (2603:10a6:8:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 6 Jul 2022 07:31:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:59 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Wed, 06 Jul 2022 07:30:59 +0000
Received: from dbf3161c1f77.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7683D487-A868-4F6A-A518-536AA0D072E6.1; 
 Wed, 06 Jul 2022 07:30:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbf3161c1f77.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5815.eurprd08.prod.outlook.com (2603:10a6:10:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:30:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:51 +0000
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
X-Inumbo-ID: a068faae-fcfd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Lb5Yqs+P764uUXb2NrEughZdi0uMcL8FfU5JP4UutzFDhTXeJ9GTjrIlSG1yXAlVZudrg2vc182jsogNFss5DJkFV8Lh6Keky6U69rcwHiai3+zwfYwAw60XpHzOEklxdd1Gq6mwbs5Z4tObwBzuYwCQH9L9rxpvloOXDIKq62chx86imbiXdP02DfZ+rQGTcG/+/cRZ6IF0jmzqGbliztHRSmeyha+pPzMWPEWmMod3GNFZ/B1SbQYNZK/mf2fzBChrifKP/sL3n+ove63mFmoKVmH5fGWNo0tNPxfI6cjSRwVDR2bdLC1TWvdmE9cBURKUb+o52+SsZKtWdkJEeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEeGXJccAL/byznBojSUr6mFpv4OGH8k+PzD7qmDYh0=;
 b=XR2jlAnbf10FZnnorO4rHxL0yBA6AWZAzekGu6PWiA98LaB6y0IggY9e5DE/Kt4S2xxNNJRrZHZZ8jEK1B1PZZz8PyyOSxkVWgAXZjlCup2EVNgWQfBjne9XA2dTMTbafXZTTYvcnaEW8hZIsepdThARav9fX5WMe2vq0sey+ZHzp9Mdp0ocMc2WX8xFcKQuGMAcOgEO2r+HuqBitJ6RuuS9wB2SvF1yhywe3Vz/27w69ELFFoOKVPUXm6gZVkqRWU7N9R36DfHsCU6+JgRhUX5PpQVyglCAR9pYobNmFqgjuPwhV1ZlGrZaLIuP9Gz0yqfnpt1ssTmPrjQH9NHXKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEeGXJccAL/byznBojSUr6mFpv4OGH8k+PzD7qmDYh0=;
 b=8dKWbKU0oJNcRSJmPgV4To93wsP1YxCgaNBOUsjfGy/suAFtLV4zs5GwLK7eOlRAjYvq5M7fo3GpJnTBWh6stOhh7aJWgQ0qfSjRjJ1hO4KPtamrUQie9FY8HX+jtOsE9CZB+tVd6XNZHDsujHgCwmGmVcWAv1nzrQZRNmvSz9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTXH4QgNrik7/NXIGklP0oLFlp12IC5GIcytKShGQQJvynpoJfjC7hAhQMuS6TFsOD72qfoNUlc7IdrVa0WZWJI2Y/zBfDuY6/LmT9J/PN6pb27eTeiQbcUkcQ5uNUhRwCslR2lue2UVovecsFm5FcKs2ZjCOzrC4ZYGpP6WJCeOzKl1+4AftDg/JatvXKRCpGcc10Du6bWCuVCIUvdRIwc+SOx6PTHOxzphBbUgGpji9E9Tlia3PZEdaI04R87DMQuYb9gkOBI/anQX/5hlgV+gaDa5GrzSy1jSV+vsFzLjf1bQ4xls6FnLj6mqBhhA3xwyK1cvHDNCu63ApUbPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEeGXJccAL/byznBojSUr6mFpv4OGH8k+PzD7qmDYh0=;
 b=N3czYBACFAwwGK7LdWwX6lqhzKzr3VNKC0wFaBoXxqECvzBDrb8uxCAFH4LsWrNSiVGH7iAuwXXikbg9xUctj0Y/EM4GPivMZtTVLcCV2YUrdG276XaNX7EA59VnJrCImmwz0Jfe3Ugw6WYSTlgHoUz2atdOlJcbBpio7Gr3TwUjE8/es+Z+NtB7KBZANE0zfZxWhD37yn+Rw9DdlS0dOAUAh6IGE1vzqMqeOYxHJ80sOXPQ5uydcsCprSEo3e9O03RaI55avhHmoBwJMy42k7GwYcZC634nGTMdSBIauAQ/Hyfhf39Ow0Mp9H+HfE2/jpDcirF4HC5iwCfKVsxPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEeGXJccAL/byznBojSUr6mFpv4OGH8k+PzD7qmDYh0=;
 b=8dKWbKU0oJNcRSJmPgV4To93wsP1YxCgaNBOUsjfGy/suAFtLV4zs5GwLK7eOlRAjYvq5M7fo3GpJnTBWh6stOhh7aJWgQ0qfSjRjJ1hO4KPtamrUQie9FY8HX+jtOsE9CZB+tVd6XNZHDsujHgCwmGmVcWAv1nzrQZRNmvSz9Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v2 0/2] x86/mwait-idle: (remaining) SPR support
Thread-Topic: [PATCH v2 0/2] x86/mwait-idle: (remaining) SPR support
Thread-Index: AQHYdmtKDptcnBqdZkW5lEZmH5/NwK1xIxhw
Date: Wed, 6 Jul 2022 07:30:51 +0000
Message-ID:
 <AS8PR08MB7991E86AEF37983BE5DED24D92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
In-Reply-To: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1C88DD95D85EAA4F8B89881FE9607025.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 102f38db-f5e8-420d-2250-08da5f217925
x-ms-traffictypediagnostic:
	DBAPR08MB5815:EE_|DBAEUR03FT027:EE_|VE1PR08MB4735:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T0YYz0KU2z+1Uf7BteLdfZQvNqpW+YeIFRrTRfiULXXpERT0oKHrUnjtjjeGrNr7d/erJr6X7yEOsUGHv3CiUUY3NFwXivVu9AsD1GctXf3dLCVVStEBPSMlayjObajQpm9Qsxr5PzbA9JTvOyms0u1BIwMGXNi0skV5tUY/lcDSVgbmXGheaUifTyjKpY853bI4YdT5kRu7xPh7S5PciGhPwMgYceTkuoS2puZyR5a0tkdHQcoTR2oVOFpXzN/gBDc81A/Gp6SIi3xyLF6uhf85xuz6jxxttQzl1Y1WmLFBvtRvkJk7qIiUoCtYlNWJsV/RkUxfzXy22LO1FNGyMSHQsBaePpjVRuFvZQWKetDEICnegC1uzF8d8EQQ/ymvHYyFtlLXsyGa96mnb42e5u5UA2tggcW9Vd1ZK/w4AO2h5DqkiYbJLmGI4F5FMxdifXtex15+ON4ypcusrwr9CXYv+u5a1ATDhiUmRcf7rWCtQ4bJdqymMGsO6TGcUgqW7ylbDHV7OgYSnPJsqlcv7Mkijm86w1789g38UmDJFse9lrtsW1UAxV9uF0L4ehQaOQI2EFDcBphTDC5Ut54aEJICiHfk61QPRSVLKQBWzrY6A3PEOj6UkI5Zs8l9+6LBQ9x+/WnUXv6P34HVx1QPGSn0prut1iNCI9liGk+bAbjVIopKUX0dWwXufA/ilgPTcmkQnMwjx4zTyxMhhvoE6ixlqZpbgy0gkcXpGmYtZ0BClyu8lcq11doUiSfvSA4BVfqfr+18OGvEvSISpXdPFEiKtObpI/pI9QDeNHUp6M0lGXbr+wW/UQx4Xiw97gd8JD0BO7TisJqY+qi12Kft84G/vHuqaKV5ziuS8ftEVJU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(110136005)(966005)(478600001)(54906003)(41300700001)(71200400001)(9686003)(55016003)(26005)(4744005)(316002)(52536014)(122000001)(8936002)(5660300002)(38070700005)(86362001)(186003)(8676002)(66556008)(4326008)(66476007)(66446008)(64756008)(66946007)(76116006)(38100700002)(7696005)(2906002)(6506007)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5815
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c33ea91-684d-4b7b-3a79-08da5f21747b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fGKfqRHmFV+X84KEmHMKK34VUuYjAfwIOHqFlK92Pyc37tKHm15wLMHehZuVJXGLeclfaUxrGANoFtfdhRRJPo7cc///a/NZbaAMvK6gbjZHiA58mlTYGpNRXtt03BcdQw73JQBLtDs+RaFBT97zXbNF2VrQZsM1e0zoNYE3ErQ6N436dBRP0igChxLKEkPCI3C2wxqJmRgElRa/Xaq05sgmVwgUvgLQ5wU+CEdaE7BgCVc3OsFRoDG1GChNGc5KBXPia1o0QVFHQPoUlFw9MyQZ+sOXjiOrFW2f5Hp89IhvignwZIDVsjgRXTr6beXz0k/SHFKOKXqtppkKoG+0Ip1i0cAdtiN448dnUvDPUFqUaFm4JFXFvp9d1vrWN0d01VPB9BUa7l8kJTZva9CSYBsNtVrW9weKEt4nuetGF44QMobit0PZMPTb/uoqrzbAvnTCe+H0koGRwI8v3IcZSCguoqiKsIzdRWOSo7Q2SctOJrwVweklR4BePfdtReR8v1zaeDt+wCnugxgjK53Thq2D9s7oS0oYaDUQGdAQgs/vJeC+/wFlJ6i8UsYIzDG+gmJsBcwLR4x/9GU+Bh4BpolWkqJbc8sEc2FGkXZA7V5Qhy2mPnidFR0RUeF0IBdHHQlZV6hEht55ED/DGIIEbVP8zeJZ+sScxuExOUS0yrUnJ2q9wXkw3cPZ9G+zsDDGiCaV4bGmJZvHQDmv5Y1xZCbVVulB9xfW0kACknGOjlvT3cbaNj2f0/BZQ1OwoQa9pcog0rFjgKP8zzlbt2KgP45RYKptv38QXXOhuIvTZYym/lKCuLCJUpUTKWL3UYE58X+RyFoJECEKNPP//tzbIdP482GJVJIIMNBphI4lnTU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(40470700004)(9686003)(47076005)(336012)(70206006)(8936002)(52536014)(4326008)(8676002)(70586007)(5660300002)(41300700001)(7696005)(33656002)(86362001)(55016003)(40480700001)(82310400005)(6506007)(2906002)(966005)(186003)(26005)(478600001)(82740400003)(83380400001)(81166007)(356005)(316002)(40460700003)(54906003)(110136005)(4744005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:59.7382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102f38db-f5e8-420d-2250-08da5f217925
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4735

SGkNCg0KSXQgc2VlbXMgdGhhdCB0aGlzIHNlcmllcyBoYXMgYmVlbiBzdGFsZSBmb3IgbW9yZSB0
aGFuIGEgbW9udGgsIGFuZA0KYWN0aW9ucyBhcmUgbmVlZGVkIGZyb20gbWFpbnRhaW5lcnMgZm9y
IFBhdGNoICMxIFsxXS4gU2VuZGluZyB0aGlzIGVtYWlsIGFzDQphIGdlbnRsZSByZW1pbmRlciBh
Ym91dCB0aGF0LiBUaGFua3MhDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QveGVuLWRldmVsL3BhdGNoLzQ2YzZiZjYxLTU2NjktMGRlMi0xNjNkLTY0YjlhM2NlMDdh
N0BzdXNlLmNvbS8NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC8yXSB4ODYvbXdhaXQtaWRsZTogKHJl
bWFpbmluZykgU1BSIHN1cHBvcnQNCj4gDQo+IFN0aWxsIHByZXR0eSBmcmVzaCBmcm9tIExpbnV4
IDUuMTggKGFuZCB3aXRoIGFkanVzdG1lbnRzIHRvIGFkZHJlc3MgaXNzdWVzDQo+IG5vdGljZWQg
d2hpbGUgcG9ydGluZy4NCj4gDQo+IDE6IGFkZCAncHJlZmVycmVkX2NzdGF0ZXMnIG1vZHVsZSBh
cmd1bWVudA0KPiAyOiBhZGQgY29yZSBDNiBvcHRpbWl6YXRpb24gZm9yIFNQUg0KPiANCj4gSmFu
DQo+IA0KDQo=

