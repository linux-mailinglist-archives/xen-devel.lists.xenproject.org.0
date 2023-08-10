Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9227E777626
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 12:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582034.911550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU39I-00013a-Ss; Thu, 10 Aug 2023 10:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582034.911550; Thu, 10 Aug 2023 10:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU39I-00010q-Pu; Thu, 10 Aug 2023 10:44:12 +0000
Received: by outflank-mailman (input) for mailman id 582034;
 Thu, 10 Aug 2023 10:44:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5UL=D3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qU39G-00010k-V7
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 10:44:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe16::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5c78f48-376a-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 12:44:09 +0200 (CEST)
Received: from AS4P192CA0050.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::12)
 by DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 10:43:55 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:658:cafe::a9) by AS4P192CA0050.outlook.office365.com
 (2603:10a6:20b:658::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 10:43:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 10:43:54 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Thu, 10 Aug 2023 10:43:54 +0000
Received: from 067061d4fe19.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0748E8B-85B9-4EFD-813D-A63B24F0D234.1; 
 Thu, 10 Aug 2023 10:43:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 067061d4fe19.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 10:43:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8748.eurprd08.prod.outlook.com (2603:10a6:20b:544::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 10:43:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 10:43:15 +0000
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
X-Inumbo-ID: d5c78f48-376a-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvKQEDV988SPsQdqQ0+s2cfZqy8DBe4aB2q5bJS+yMs=;
 b=hGkh8mrNMLrAUtOoQIIMuC/QS59W8GNo/K1i/cRh4wut/Bzze49GH2M2/TfSeu1+mWfYhPdAFV/07s4l15vvRzuta2h9qwEJn1DnepnxQwA14izfedb4HAj4nNp7Zniy0q4b0qeRr2FytFPMC1bTNC3YReAKlDcm2A+PVuAFdC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a07e27998903aa80
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/k11OXR8aWXsm1aAn94tZoxwoYib6j5oTgr2ktXuHiRmuN1pVgzLuKNn6yvVhkH9vh6ZpHH2E/krLz+XzbwQDF/cwQsCKqBNCcfyP3LZi3qmD7/AEJIjgVnjKwYFAy6xI6/uTMiDC7TQR9CWBWLTJ1EW1bKtwoaQiuUCO8sSTp1Ge4zUlZjk/mfqSpsD99BMCD6eZofAyyNANwQBJYSb5jVmKtYHPmv33W7GT282L70UptePbl13JSF5TytqXc0sxXZorEWlRs6npOwdUx06bpoCitAYojw2/JRaPmWhsV86S96P5cV3sdM227P5yNXJdSZ1LcVbLKF97qetRLVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvKQEDV988SPsQdqQ0+s2cfZqy8DBe4aB2q5bJS+yMs=;
 b=DGP7XF/DA+vAiW5uUaJ6wPt9B931qcaOOGzwGCMT6bq5Z8mwrO+k5Viw+dxsgJU0kJSAkdHYK1KBXVEBLInd1aNJp3IFzaHDTq47+ZuqNIA2xwbE6PiLEokLgPaN8DBkS95XEOnO7dLPqEoe+d9Dw+tQW7JSmBCvLGCmXWxJas+7p5kSv8jh+nwQCeVoXG9AKSg92yZO4luoWQrYNapPJ4XmEJJP9U+VtnWDyCebxOtuDb8Hd3miZwpN4cW2yGFt3Xu42McYToMxjUBdGFXtL0YecGJF50D8niWQBBQbqDRVhoQSXti7DFaAtGB/LRCylDnbv3WBEI8CqZ689IPftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvKQEDV988SPsQdqQ0+s2cfZqy8DBe4aB2q5bJS+yMs=;
 b=hGkh8mrNMLrAUtOoQIIMuC/QS59W8GNo/K1i/cRh4wut/Bzze49GH2M2/TfSeu1+mWfYhPdAFV/07s4l15vvRzuta2h9qwEJn1DnepnxQwA14izfedb4HAj4nNp7Zniy0q4b0qeRr2FytFPMC1bTNC3YReAKlDcm2A+PVuAFdC0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: Moving Dom0less to common, Was: [PATCH 0/5] Fine granular
 configuration
Thread-Topic: Moving Dom0less to common, Was: [PATCH 0/5] Fine granular
 configuration
Thread-Index: AQHZyc5XC9fV6H5060OwNQm6NeqPxa/iYhuAgADedgCAABq0AA==
Date: Thu, 10 Aug 2023 10:43:14 +0000
Message-ID: <18F9E2A1-1CBC-44D5-A321-D6DC72DD55F0@arm.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
 <d06d3304-1df0-e932-bc32-7a9939870487@suse.com>
In-Reply-To: <d06d3304-1df0-e932-bc32-7a9939870487@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8748:EE_|AM7EUR03FT039:EE_|DB9PR08MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbda5b7-d5d5-476f-3610-08db998eb1b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mzjltq2gNjfxz/vFdfn7FN1msp5XnrHB8ujU4ZD32tPxkzWi1jgLwl6B3OU+f512OduGLK7+Ta1ZIqFOpKwVWB5QT3v6Hmgr/1KLGsoXjDAfhw+BQm9zkfapWu1MJuA/6iorFnrJZig8prNEExKloeeSpk4x3uSInVdjNeNkAYw8B+d+gOwCkSq3XJX9vVmUSUCT/GihCsE+oBGX1OBJOODYzTvADl4M6tcDXm3XPHri/IMBpgmtDIFwKzJBmnPnBl9rgMvzJrV8gmyW0+Q49ZcN1irAV9XOUY7v8f0SoBZ3wM4hzkgyKxauUoWWO+iawx1pnLf3w9Rc2G40ntk1OoamT7HO8nTFOMiDv/jnpyjcMmektB1S0ywa6r4D+N+BBzcXVsops0P7CSY9CUS4WchP/iVU1YemB2W4hJCDsfB6FgbYvr94IuUx5cG3ImsYmXemeQjSod9GktoXfXZ0xmaBYe0QmIt2IDE2ej+iaq5ELzc7JW69fl7eN67kfjvvbkMj0uQMfwXSbki97YkNMxWMjIts1XQRRQbfBEnK5CWnQ/AdqqA6mI1qoVVcTHktL2UOG5oosCAGYflW5FNOSqAtmGOVde2SRMEC+/sSixnLY4io99lSkSGDTOJ7dnhX33SRJufEXdCmsXmqMpw4DtpNJ1mNNMSKgXgv6LG4LY8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(186006)(1800799006)(53546011)(6506007)(71200400001)(478600001)(122000001)(86362001)(83380400001)(26005)(33656002)(6486002)(36756003)(6512007)(2616005)(4326008)(66446008)(76116006)(91956017)(4744005)(66556008)(6916009)(66946007)(66476007)(64756008)(316002)(2906002)(8936002)(8676002)(41300700001)(38070700005)(7416002)(5660300002)(38100700002)(54906003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CE8C9E4C8CEA049BED0AD9BDFC1AB39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8748
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3c5a3d6-7635-48d8-2456-08db998e99f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h4rrQeC75ERPJDFjgFslMAJsE+sSmfpvQOgYqueyqSmH04HACxU0ZYjMYwl/iLgp0maFrzIfJce5qK4ti17AgDsFOzqkjZyvkVeSJTvpH3GO4GSOBvujgqXq4gkrTYHHJRoSpkFlM1Np8CB1m0+ZUQ2ZmlbJhnVWDxoHpecwR4vrroZB2Q7W9IBRDqdG5Pyv+/jZyRrEQ55bA2QL+S2pjgzIsgIX7bb9Xsun5+ztjrHJX6sUtNrE7MiydyGxOaggGS50VPwOzozosdxXfeV7UviG4btCpfSvkaJnOaziUY4aBBArAeQlp3YlszwtgPgMcS4jTs+/CZMcLQGP8UZkQjtP0Nv7EKVKMQEUKAYNQiQ/ZRKuOzwbz83VXKdxDDHwtOsjm9B+EcDwOmSZzaqwGYIPId0zduh3DuiwvH3m0+dMsnQBZIN1SR+i8xUFLfWjausPpUHOUr6UYIsjuRVAjOT8IZUFf7+GE6oRRbEaHZcTap11b7I0m+74mN2XImrjQOt1OIDdMYItQ0YKui27kh+FcC+bp2cs/Ha5LSp1O3euVsNz3QgvLBPhcEdClPecappsure4om37cB8lFAYtDuP/9tx01Z8Wbpg2cDvfRDkSs0TXcxTmvT6JBDwnJSuqa3O15LZdMq2aYF4Lc+nNhS0IkXv+Eh/944S3Aqtd3jfOjpcl1X6cd2cBv3kap3JiTMxFykpAfqSyl+vcUitXcWYcSY8RjViYSOhAumDOflLSA5kqTmKMO6XsyCVzqL11NnqeX4q/UJHoRMawXj2q8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(186006)(82310400008)(1800799006)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(478600001)(356005)(82740400003)(36860700001)(81166007)(2616005)(47076005)(336012)(40460700003)(6512007)(6506007)(107886003)(53546011)(26005)(40480700001)(70206006)(70586007)(8676002)(4326008)(4744005)(316002)(2906002)(6486002)(6862004)(36756003)(54906003)(8936002)(33656002)(41300700001)(86362001)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 10:43:54.7459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbda5b7-d5d5-476f-3610-08db998eb1b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620



> On 10 Aug 2023, at 10:07, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.08.2023 21:51, Stefano Stabellini wrote:
>> Would the x86 maintainers be OK with it too? Of course further changes
>> will be needed to make it useable on x86, but looking at the series from
>> Christopher, the two sets of internal interfaces (dom0less/ARM and
>> hyperlaunch/x86) are very much aligned and similar already.
>=20
> Moving common code to common/ is surely okay with me. How much wants
> moving is (apparently) a different question.

Would x86 maintainers (and who is taking care of common/) be ok for the dom=
0less
code to be part of common/ but in this first stage be protected by a depend=
ency on the
Kconfig ARM?

In a second stage the hyperlaunch people would do the proper modification t=
o use the
common boot modules to delete that dependency.

Provided that we have an answer for the question Michal raised.

Cheers,
Luca


