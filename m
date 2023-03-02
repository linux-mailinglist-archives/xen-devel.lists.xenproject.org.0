Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA96A850A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505041.777562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkek-0006vq-SL; Thu, 02 Mar 2023 15:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505041.777562; Thu, 02 Mar 2023 15:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkek-0006tN-PQ; Thu, 02 Mar 2023 15:15:42 +0000
Received: by outflank-mailman (input) for mailman id 505041;
 Thu, 02 Mar 2023 15:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JoVR=62=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pXkej-0006t9-49
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:15:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e49fe1-b90d-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:15:39 +0100 (CET)
Received: from DB6PR0601CA0034.eurprd06.prod.outlook.com (2603:10a6:4:17::20)
 by DB3PR08MB9133.eurprd08.prod.outlook.com (2603:10a6:10:43c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 15:15:31 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::31) by DB6PR0601CA0034.outlook.office365.com
 (2603:10a6:4:17::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19 via Frontend
 Transport; Thu, 2 Mar 2023 15:15:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.20 via Frontend Transport; Thu, 2 Mar 2023 15:15:30 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Thu, 02 Mar 2023 15:15:30 +0000
Received: from 00256289af9b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63835D70-0489-40E0-8766-8D3DB2E29E91.1; 
 Thu, 02 Mar 2023 15:15:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00256289af9b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Mar 2023 15:15:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5907.eurprd08.prod.outlook.com (2603:10a6:20b:2da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Thu, 2 Mar
 2023 15:15:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%6]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 15:15:15 +0000
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
X-Inumbo-ID: 16e49fe1-b90d-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idiMTzR8fE+4OlQEbFAVvxCG/Mgx4+pKnDPFgk1G1+M=;
 b=AlFL/r04rkFEtuf4beSe7ulXoujy4lXP9BW0upjKYTpmNZxOL7Cv6KxoN/cs09H6PhjO1eX/Ng2oTIs5PSnj6uc/ka1sy+YV3bWgwVRk7NuSU1qtk81LtwMDkB6W8DCHecA6PPgX2Ajbs7fA1I+9ZdIRQCrTvcgXHwB01MKyUuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5pvbFLRN7EpE6qk+6a39zYazuEm+3cz718ucu/DZOFCc6U1IA6K2WJZrH7ur6W2Bn1UdRKfyTHchprMl5MnVclBtyBWQUDAHtAmTbMthuPjcZ8DLSfID9n3KMGR3+5oO2h4YEuTIoZj4R3EB0gn/kIJ9BWcjByV3IVoWAwK2FcmqAd9tcB9H/vTZsMDwnZmX+zxrae/Z47uahOYhiqfVU7Zj5rEXvVCYrgLyXGfzHDWkmj/B3J3kxUcOe9LTBYvgLdYIlZQkJjlSlPd4UeaE7ixznEMY5SRtOVcXN7QRVYAacyXO4Z1RI/QZVMSfr8XjDH3yGKC1sAUxlBLUeYZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idiMTzR8fE+4OlQEbFAVvxCG/Mgx4+pKnDPFgk1G1+M=;
 b=TR9kZBZ+fLx1Y2iq6qZ8PSScqOcqG4sWl83QAe0dmGqF6k3Gkb7Up9zkgKu91Vlig9Ft7PJBtUKQOXO+MK3tsrNJ16gr5P33Q48WEzWQzn6A8PHE9sK4Ve5eN7Lwr9PP10yw6y2WlNQOQasbbwtEEXWWBxK2vQAM9Zq3qDxWDW/FdSTnjx2nscQC4X61+3jNZwfMJ4EmcPVmLS7jfDETKenQi0RAOQKiJ1oYqutPWLK0qOE5UK6xH9WiQVt9IdAXuiD+qHJBo5Txrs8NlBCE4082cOetHq6Ay6wPiD6C/1+57i6DyX7G+dPV2jU06qJtXJKwqmfUVMtdKXzMUUZrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idiMTzR8fE+4OlQEbFAVvxCG/Mgx4+pKnDPFgk1G1+M=;
 b=AlFL/r04rkFEtuf4beSe7ulXoujy4lXP9BW0upjKYTpmNZxOL7Cv6KxoN/cs09H6PhjO1eX/Ng2oTIs5PSnj6uc/ka1sy+YV3bWgwVRk7NuSU1qtk81LtwMDkB6W8DCHecA6PPgX2Ajbs7fA1I+9ZdIRQCrTvcgXHwB01MKyUuo=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH v6 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v6 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZTRejuKIFgfvPuUGgSC/MIV1QK67nmTVw
Date: Thu, 2 Mar 2023 15:15:15 +0000
Message-ID:
 <AS8PR08MB79916AEE0DA4EF40F513209192B29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230302145916.44035-1-julien@xen.org>
 <20230302145916.44035-4-julien@xen.org>
In-Reply-To: <20230302145916.44035-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 85B5C8BD816D37419B43086E4FAEF2A8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB5907:EE_|DBAEUR03FT028:EE_|DB3PR08MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 489f39a7-13fc-4b58-acb4-08db1b30f671
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BX3PJIC0c977U1/IjMHz9FwOA028EarYsolm7E+Pg89VJK9wExHJFlpBpn4zgiwjgCpP99sMT0iFHFf4a0LRV+dVKP0hccHIQZQ6Mo/3KE+5TZh9YPooejLX7d/Hy6u0MNgfeWVm0a+FKnMHsgcQjTEfeb9t+DpXETWKGbwsUMJBD1/W17KjEfmXa4F20E6xo5RRgTHPCXF3XWg5F4XBLfF5aVfoIrlPnskaqBeFqQ/Jm/7mKgysKqnZNwDXYkIHxVsCUrcrMZJt2gJsGrkT37m7KGFc/P/a5GEBk/P4KwazJ+7MMweeofeF/dlpwE/D5SauD5rx54uNq/imEh2kk/Yg4WPLYb0sAq7mxdfvLzMkQbF1ciVYU2XSEKxg1Zy4oAURLTcA9SuQkXYN/tEjO36fUwx2V7QBQQJxZP6w9FifTQK1QZ+c62U2XtwJGh93TL6cHtlwFpoXrOOkMijcAXjUQsk/zoc3+AxQ7dlTd07mb1ap+jlFSSYO9PcxOpjjHwIhvkFPdpRBYvTsXhfIB5rOHUgOqhbI3w1x6EvdQSKVqlmG9E1uS+SdQWEEthWYrXn6m1+LSWuZdOT9OqD5esmOwILfrGrYDSJMf5WDw2K5kdXfQL7BgVIl2FCuNGnBT9BzX55uxbYCy39l+aLHREkD3Yi3oaFzPWL+YSuPHoXki401AzpHekxg9KusqLD0oDt0ISmecJUvFGFdTzVqTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(186003)(54906003)(316002)(83380400001)(33656002)(86362001)(110136005)(2906002)(7696005)(26005)(9686003)(8936002)(66476007)(71200400001)(41300700001)(5660300002)(76116006)(4326008)(8676002)(66446008)(66946007)(478600001)(55016003)(66556008)(6506007)(64756008)(38100700002)(52536014)(122000001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5907
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6d67968-10fb-4f60-39e6-08db1b30ed06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mnAFyBLCcPvljyH0BfBqtbEnwD3t5Rw8eUWlgAUvJnrixxZF8tkD68lBpeg+sEGDSld5LOKXMALaBmXjTySSLmgimzmqZ9GNaQnAWgwZEQWJkBCm3e7crQRs1ADZyXxM+ZlsKyu+3RlLujOgRXiVKrPFOmpwseZOQCHw71GT6UKCD7DpsygYutRvR2qM3O3LNCrSZER6R3brimKQib5yiBz//UoXZpGqHKMK+DXE1Pt4OxAjhs4e/OQDbAS0QizrctZjtecnloLRXBRDhgX/2oIpiNJqlSaUXjzqbEwfXaLgDTVAwwZjGvq3cSJMVPWMjOESubkcWJX+61xE0fBdf5SjTx/YSuhi/NoNMkrATfGjAVCtWnJc+Gm0lW5V/RA4xx5+3QMqrxrsCXTXj3OhyaoBDcQOrpQrPfRuWOLVqn7BeJwJ/RE+/9Z2/dE2Khj1ioM4RGYWC51V3kBfPEYPVd+NKqjm/+XcdTw62wNYarq9dVHL+4NYqlZ1DC/nTa2c3EbUl6vn2nNJud401fAj2STIwbOO5adoRLTDZCZmwR3FOsGvZ8tih1xOef4MDKjWxapAHEuuKZp2dvosl4BH4twLoAxyNgK+/jJPb2RoSgVGRBJzy4j9TJTbi4XVnqrWxotULXg3JJB49+XWbatXTeNXWKTt4vGwNofXW1jqNAYPDtiUW0bATcu1BiXB+x0zjn8CcM5y0lxwXBs8GOGkLA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(41300700001)(52536014)(86362001)(55016003)(8936002)(2906002)(4326008)(5660300002)(40480700001)(36860700001)(356005)(81166007)(82740400003)(8676002)(107886003)(478600001)(54906003)(316002)(186003)(7696005)(33656002)(70586007)(82310400005)(70206006)(110136005)(40460700003)(47076005)(26005)(83380400001)(9686003)(336012)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:15:30.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489f39a7-13fc-4b58-acb4-08db1b30f671
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9133

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v6 3/5] xen/arm64: mm: Introduce helpers to
> prepare/enable/disable the identity mapping
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new external helpers are introduced:
>     - arch_setup_page_tables() will setup the page-tables so it is
>       easy to create the mapping afterwards.
>     - update_identity_mapping() will create/remove the identity mapping
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

