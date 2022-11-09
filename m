Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD2622344
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 05:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440646.694738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osd7b-0000o0-U3; Wed, 09 Nov 2022 04:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440646.694738; Wed, 09 Nov 2022 04:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osd7b-0000lN-Qd; Wed, 09 Nov 2022 04:55:31 +0000
Received: by outflank-mailman (input) for mailman id 440646;
 Wed, 09 Nov 2022 04:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIzN=3J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osd7Z-0000lH-Tc
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 04:55:30 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2040.outbound.protection.outlook.com [40.107.103.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9dcab9a-5fea-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 05:55:26 +0100 (CET)
Received: from AM6P192CA0084.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::25)
 by VI1PR08MB5504.eurprd08.prod.outlook.com (2603:10a6:803:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 04:55:23 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::56) by AM6P192CA0084.outlook.office365.com
 (2603:10a6:209:8d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 04:55:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 04:55:23 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 09 Nov 2022 04:55:22 +0000
Received: from 9ea446a89243.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12E8AE89-C58A-4D45-89F3-52DB9DFF5F9C.1; 
 Wed, 09 Nov 2022 04:55:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ea446a89243.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 04:55:17 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU2PR08MB7311.eurprd08.prod.outlook.com (2603:10a6:10:2e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 04:55:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%6]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 04:55:14 +0000
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
X-Inumbo-ID: b9dcab9a-5fea-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d1uuSTdO2PpRSqAuOzH/vVmj7YvR14yl5w8FhF3sH3zPVinpAmKtgbTkKL8d6iYLinotSpz0D5R1KVvLpnCXC221V8blhFG6qcNZkB65DN4xkOH5m4fxDAlQPYr3zhELa3GFFCfMUgo1UIbvRkbn3D+Yg6h9LLWIWz5peRocFkmdAuZSI6Wd2mvejraKU0VEwTmKcbzKTDLMB7EA8TX9pXdVTUIH+/kbUVXTpul5rBypKT8wtVTqimx1gsFrioBBeYGpnlPfSlQ37fI+IJd19CnM+Tj+rwb8CG/53FFKtfScu/3sumwRFhZtJuf0foTFijyVvpNl07h0FbspnAWytA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz5yqyLrmnaXqBdmTtVVuLYmAYGZd+VxBCMqJrW6A0Y=;
 b=bQlZMdIWSd37pQ6cNM794seM1LP2GZEBH3oFfkqGoHuppZw3/CmSfF+ttVTFKjUloIjyV8N/eC2akmpTMGUVwmelCSFnSpe09kva2IB4NdlOPGrk67XujJMw8m29kQ5ObreRQY2B8q5YPWou1Cs5qyhWXzO1rH7V/PU1KaPIPPgSizL/n+jd4IYhkE1+vUa2hsNZRq6fnafJ9EyJC6tL/FUQGN3D9NernubcOV6faItfD/APzM5TxL+SEVojatM0Th2wtL/ypReIU3DVGBYnoSNTsCyrus5uvq/LsselZy4fTUoX7BWl9R5BfNoZZucsCBCAGKw6ZZ370W3SkbJHBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz5yqyLrmnaXqBdmTtVVuLYmAYGZd+VxBCMqJrW6A0Y=;
 b=KzJmBTC5Pw+T8B9ms/gfHuqxI7SuybOXDXTCJK2im+gmguIb2Hnt0IN/TnzAmZUeRRHwswl0iO/ERbgzpSclXCe05pbhadRv/RpZ9Ra7KjKofcJ1VU6bZYS2SdSatIk/Htu1edQA7B382r20JN5lHcVe4vyIM/ycELWZRYku7Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfwSD5+TajM7oRqfg7p5ijfzUG+JV/jYO4OSEnh8842UGMMQTyXX/YYuW00yJxnQxUX6O/RBqRFnypg8YhxWAsN3M49HLjy6v3U1Ysz+UIpBAV3xLO07v2KbJLSDDA0LjV2BHPAT2GiNbjzaqFM60CwwnB2EW+oXCPJG9NqX/6qdeTF6MSNREi0p8XldUyaZUlf3cW17vUmtledspFlDMLf7o4qUD1lc0iEWJ3dlFKNoAu6Q6SgTJAuuQciSyGb8HCTYwUrSngVKYaeB0OGTFBs03hntj46VrTT56YDb3dMYUMZ5q55BJFENAkxEBPvJLUkX1x+1HldpD2FLzEhwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz5yqyLrmnaXqBdmTtVVuLYmAYGZd+VxBCMqJrW6A0Y=;
 b=LWzye2YEC7DxVL1JerKo2tx32Sz1YoGpbv692/GHmenhxaiYQFVE80aT06pHeQR7Xa/vRlXXLENJKSQYtOIUx18L1pjGPXsPqY2rU7axurZR77F4TOhTf9Yv+RCWlVpQvuxyjLwfUUxdnzWyCJzF50xCN/wWCzLsKF0mO4G5Ih0zwlMZZu3YYGr/GbL5cOP9dNe40MNN05iuKcS6/NdQrRAjCQNDRUiiuVFp/ywoCoyE+bXklAxCY+yds/Jq6QN8HmzCWuU829FUSCoYELwV8ql7+w0zYf9ch8339xtonuQTJUPjOEHjq6E80WhA+CvaWG5Hj70ls5NsyP8pkPasQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz5yqyLrmnaXqBdmTtVVuLYmAYGZd+VxBCMqJrW6A0Y=;
 b=KzJmBTC5Pw+T8B9ms/gfHuqxI7SuybOXDXTCJK2im+gmguIb2Hnt0IN/TnzAmZUeRRHwswl0iO/ERbgzpSclXCe05pbhadRv/RpZ9Ra7KjKofcJ1VU6bZYS2SdSatIk/Htu1edQA7B382r20JN5lHcVe4vyIM/ycELWZRYku7Dc=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Thread-Topic: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Thread-Index: AQHY8DVkWYjGQuvcKkq0uEcag43TF64ySPmAgAO1+zA=
Date: Wed, 9 Nov 2022 04:55:14 +0000
Message-ID:
 <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
 <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
In-Reply-To: <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E550ED8990B21341A17760949E3E147C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DU2PR08MB7311:EE_|AM7EUR03FT036:EE_|VI1PR08MB5504:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b42c0f0-9ca6-4262-1a72-08dac20e9c29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 plHdRiXfps8BqUcGCPyeCJG5O6Is9NGj0Wg79aWQHpcqsso7akOw7Yx1dpLsnh6zjdFle55Pg8i1a+R94rotOCr3c973QVvWr9IznUy9xEFQz7WxX50DWRsnAF27nMkyO45TbVmwU/WJO0UhktoTKp8rasqkVPJW4uxcji4819tXyINdloQO0/CJuoMUkPAAX4Zloz3bEBPSSK9VKxUNtSqCKwlI3CkPjSkVJ4T4Hk+cbxZLZAhX3rQqZQ7Pbi7y23smu6wayH6Hn1vZbWabMev9EEQDO5R9fA7YfTYBzipX4OV4bT5jgKd7GQF3K6T28etuNRJ+91Lusb2eGguvcxo5AncD2vncsOcqjq6BzbGOdtaFG1fr+Q6AcGBdVJqsImDqAoaJsl49sb2m2CXYSfVpN/EmQp6lYWj66287eJyEozBmfUgXqWWoZMGN42JIqKqSS6QbeAjm9Dk6PPLRGxv0FKxtkLCg3MiEyVTx7eRkhhb6j6qavtlh5LJptyQ6/uLBuOy8Z9GNd9vAcOp73x/q6D3KskVxrxhQ4ppWOoechiUhxHJneVh3MYix2a8Q+tMg28HKePsacKOHhremt7VUS79SIe19os8cIEttJo8L5NbO16qI8lpXOVAnxfW18fXwJ045UhMK3SBMmvL+qznL+7tnWHgSmM9N/3ZsGlSwqh6/H03AOPhkXe8IM7eRxbbP/6m0evDDbcJOqhIxi1F3xV6JPjExW/YXlbo7S0PoXjjUHv2dOtVrJZCxoW4PnoT5AUV+O1kPC9gjUth+Wvwrb9J3ZCPnABfMhTz9KPACm9sklU3uUUrsK4oQR0r55ozjOctNSLI1zQS6mmpy9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(33656002)(122000001)(86362001)(54906003)(38100700002)(316002)(966005)(478600001)(55016003)(71200400001)(66476007)(6506007)(7696005)(110136005)(9686003)(53546011)(38070700005)(66446008)(2906002)(52536014)(186003)(66946007)(8936002)(5660300002)(26005)(76116006)(8676002)(83380400001)(4326008)(41300700001)(64756008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7311
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d05c692f-ce6a-4de6-6c5e-08dac20e9714
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ElCPYmn2ZD8stgL6ghIScRbbG1ixd/3+wQ6p3UjPwZZXS0E8kaWr20UN2eHixzcb3TkO8P7P8KvnSrSbHtKZwSsPIzWeK9vVPeuJPw+LSBNJWTyh5RUBaRIzD7nYgOaxZBjoZyhj5R50IQMb9uuIThK9UiIzK4/29o3cudo24+wWZ0ExJCwlVrMNo8/BWNztgTlClwq8RP5xY2IJe9LClYB1hTr22fmwbfXw8mGs5Rx2zggTUWguGK3kaC2gQsicElZePXhkuIdHEzpgvxHvVXWWYclWezLIZojIq+CiZsa8jRNIlM9va6kB0z7JjNDUQQCyDWF3iXym7AGWPrTITZXMrgmr8vaRVXcT9bbtdbAMKMz+lAVIK/LuRn12e+wJPm+d49H3GnwJxE79CFEKOO9UA5rcHTRsAAvllW+SGCv8YGz7va4rC0KXL1KLGixqJdyLVMKqbSipx2YCeAUDeRY28ZNKKXhwixW+4Ro9IqzAC0wSA/RelGUfAhgqKY+bzskKw8Tpie1vqiX/B3YIHItKxZEeSS9+d4wgHOfif9iDzK5jXyLuEid32UR9ge8a03Opa3xSye+mj22RIGabzibOs0qyzfCdLTR79XqF0E9m1eakNqt6ENIJpfBzWBITGV+/Oi3kpkuAiQxIRCQEJyMXPfWfCMrtWLUW7yDaCJUUT9UN9Z+JChSHKPqZJmjKHRBJg9CBnIrSZ0noaOPbX969ue+g3/hm4LWrxqbdznTznffCYETO8uZhuUmyIce8CT1FEinjLl6trdjvN6LbkbviS6BCBhUXwxJ0joLSAtAsjAHzzbmEadcpl+Ek9tWN+Ewqg/a3H3CQELB5iNYFxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(55016003)(86362001)(41300700001)(52536014)(2906002)(8936002)(82310400005)(4326008)(33656002)(70586007)(5660300002)(26005)(70206006)(9686003)(8676002)(54906003)(53546011)(6506007)(966005)(110136005)(316002)(478600001)(7696005)(336012)(186003)(36860700001)(81166007)(83380400001)(47076005)(356005)(40480700001)(40460700003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 04:55:23.0679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b42c0f0-9ca6-4262-1a72-08dac20e9c29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5504

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgMzoyMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDA1LzExXSB4ZW4vYXJtOiBkZWZpbmUgWGVuIHN0YXJ0IGFkZHJlc3MgZm9yIEZWUA0K
PiBCYXNlUiBwbGF0Zm9ybQ0KPiANCj4gDQo+IA0KPiBPbiAwNC8xMS8yMDIyIDEwOjA3LCBXZWkg
Q2hlbiB3cm90ZToNCj4gPiBPbiBBcm12OC1BLCBYZW4gaGFzIGEgZml4ZWQgdmlydHVhbCBzdGFy
dCBhZGRyZXNzIChsaW5rIGFkZHJlc3MNCj4gPiB0b28pIGZvciBhbGwgQXJtdjgtQSBwbGF0Zm9y
bXMuIEluIGFuIE1NVSBiYXNlZCBzeXN0ZW0sIFhlbiBjYW4NCj4gPiBtYXAgaXRzIGxvYWRlZCBh
ZGRyZXNzIHRvIHRoaXMgdmlydHVhbCBzdGFydCBhZGRyZXNzLiBTbywgb24NCj4gPiBBcm12OC1B
IHBsYXRmb3JtcywgdGhlIFhlbiBzdGFydCBhZGRyZXNzIGRvZXMgbm90IG5lZWQgdG8gYmUNCj4g
PiBjb25maWd1cmFibGUuIEJ1dCBvbiBBcm12OC1SIHBsYXRmb3JtcywgdGhlcmUgaXMgbm8gTU1V
IHRvIG1hcA0KPiA+IGxvYWRlZCBhZGRyZXNzIHRvIGEgZml4ZWQgdmlydHVhbCBhZGRyZXNzIGFu
ZCBkaWZmZXJlbnQgcGxhdGZvcm1zDQo+ID4gd2lsbCBoYXZlIHZlcnkgZGlmZmVyZW50IGFkZHJl
c3Mgc3BhY2UgbGF5b3V0LiBTbyBYZW4gY2Fubm90IHVzZQ0KPiA+IGEgZml4ZWQgcGh5c2ljYWwg
YWRkcmVzcyBvbiBNUFUgYmFzZWQgc3lzdGVtIGFuZCBuZWVkIHRvIGhhdmUgaXQNCj4gPiBjb25m
aWd1cmFibGUuDQo+ID4NCj4gPiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSByZXVzZSB0aGUgZXhpc3Rp
bmcgYXJtL3BsYXRmb3JtcyB0byBzdG9yZQ0KPiA+IEFybXY4LVIgcGxhdGZvcm1zJyBwYXJhbWV0
ZXJzLiBBbmQgYFhFTl9TVEFSVF9BRERSRVNTYCBpcyBvbmUNCj4gPiBraW5kIG9mIEZWUCBCYXNl
UiBwbGF0Zm9ybSdzIHBhcmFtZXRlcnMuIFNvIHdlIGRlZmluZSBkZWZhdWx0DQo+ID4gYFhFTl9T
VEFSVF9BRERSRVNTYCBmb3IgRlZQIEJhc2VSIGluIGl0cyBwbGF0Zm9ybSBmaWxlLg0KPiA+DQo+
ID4gV2UgYWxzbyBpbnRyb2R1Y2Ugb25lIEtjb25maWcgb3B0aW9uIGZvciB1c2VycyB0byBvdmVy
cmlkZSB0aGUNCj4gPiBkZWZhdWx0IFhlbiBzdGFydCBhZGRyZXNzIG9mIHNlbGVjdGVkIHBsYXRm
b3JtLCBpZiB0aGV5IHRoaW5rDQo+ID4gdGhlIGRlZmF1bHQgYWRkcmVzcyBkb2Vzbid0IHN1aXQg
dGhlaXIgc2NlbmFyaW9zLiBGb3IgdGhpcw0KPiA+IEtjb25maWcgb3B0aW9uLCB3ZSB1c2UgYW4g
dW5hbGlnbmVkIGFkZHJlc3MgIjB4ZmZmZmZmZmYiIGFzIHRoZQ0KPiA+IGRlZmF1bHQgdmFsdWUg
dG8gaW5kaWNhdGUgdGhhdCB1c2VycyBoYXZlbid0IHVzZWQgYSBjdXN0b21pemVkDQo+ID4gWGVu
IHN0YXJ0IGFkZHJlc3MuDQo+ID4NCj4gPiBBbmQgYXMgd2UgaW50cm9kdWNlZCBBcm12OC1SIHBs
YXRmb3JtcyB0byBYZW4sIHRoYXQgbWVhbnMgdGhlDQo+ID4gZXhpc3RlZCBBcm02NCBwbGF0Zm9y
bXMgc2hvdWxkIG5vdCBiZSBsaXN0ZWQgaW4gQXJtdjgtUiBwbGF0Zm9ybQ0KPiA+IGxpc3QsIHNv
IHdlIGFkZCAhQVJNX1Y4UiBkZXBlbmRlbmN5IGZvciB0aGVzZSBwbGF0Zm9ybXMuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKaWFtZWkuWGllIDxqaWFtZWkueGllQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4
ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKysrKysr
KysrKysNCj4gPiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wbGF0Zm9ybXMvZnZwX2Jhc2Vy
LmggfCAxNCArKysrKysrKysrKysrKw0KPiANCj4gSSBsb29rZWQgYXQgdGhlIGNvbnRlbnQgb2Yg
ZnZwX2Jhc2VyLmggYWZ0ZXIgdGhpcyBzZXJpZXMgaXMgYXBwbGllZC4NCj4gVGhlcmUgYXJlIGEg
Yml0IG9mIGJvaWxlciBwbGF0ZSB0aGF0IEkgZXhwZWN0IHRvIGJlIHBhcnQgZm9yIG90aGVyDQo+
IHBsYXRmb3Jtcy4gSW4gcGFydGljdWxhci4uLg0KPiANCj4gPiAgIHhlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrLS0tDQo+ID4g
ICAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BsYXRmb3Jtcy9m
dnBfYmFzZXIuaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIv
eGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPiBpbmRleCBhZDU5MjM2N2JkLi5hYzI3NjMwN2Q2IDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gKysrIGIveGVuL2FyY2gv
YXJtL0tjb25maWcNCj4gPiBAQCAtMTM4LDYgKzEzOCwxNyBAQCBjb25maWcgVEVFDQo+ID4gICAJ
ICBUaGlzIG9wdGlvbiBlbmFibGVzIGdlbmVyaWMgVEVFIG1lZGlhdG9ycyBzdXBwb3J0LiBJdCBh
bGxvd3MNCj4gZ3Vlc3RzDQo+ID4gICAJICB0byBhY2Nlc3MgcmVhbCBURUUgdmlhIG9uZSBvZiBU
RUUgbWVkaWF0b3JzIGltcGxlbWVudGVkIGluIFhFTi4NCj4gPg0KPiA+ICtjb25maWcgWEVOX1NU
QVJUX0FERFJFU1MNCj4gPiArCWhleCAiWGVuIHN0YXJ0IGFkZHJlc3M6IGtlZXAgZGVmYXVsdCB0
byB1c2UgcGxhdGZvcm0gZGVmaW5lZA0KPiBhZGRyZXNzIg0KPiA+ICsJZGVmYXVsdCAweEZGRkZG
RkZGDQo+IA0KPiAuLi4gdGhpcyBkZWZhdWx0IHZhbHVlIHdpbGwgbmVlZCB0byBiZSB0ZXN0ZWQg
ZXZlcnl3aGVyZS4gQXQgbGVhc3QgZm9yDQo+IG5vdywgSSB0aGluayB5b3UgY2FuIGF2b2lkIHRo
ZSBwZXIgcGxhdGZvcm0gaGVhZGVyIGJ5IHVzaW5nIHRoZSBLY29uZmlnDQo+IHRvIHNlbGVjdCB0
aGUgcHJvcGVyIGFkZHJlc3MgKHNlZSB0aGUgY29uZmlnIGZvciBzZWxlY3RpbmcgZWFybHkgcHJp
bnRrDQo+IGFkZHJlc3MpLg0KPiANCj4gVGhpcyB3aWxsIGFsc28gYXZvaWRzIHRvIHVzZSBhbiBp
bnZhbGlkIHZhbHVlIGhlcmUuDQo+IA0KDQpXZSBoYWQgY29uc2lkZXJlZCB0byB1c2UgS2NvbmZp
ZyB0byBkZWZpbmUgdGhlIHN0YXJ0IGFkZHJlc3NlcyBvZiB2OFI2NA0KcGxhdGZvcm1zIChwcm9t
cHQgdXNlcnMgdG8gaW5wdXQgdGhlIGFkZHJlc3MpLiBCdXQgd2UgYWxzbyB3YW50IHRvIHByb3Zp
ZGUNCmEgZGVmYXVsdCBzdGFydCBhZGRyZXNzIGZvciBlYWNoIHBsYXRmb3JtIChEaXNjdXNzZWQg
aW4gWzFdLCBoZWFkZXIgZm9yDQpkZWZhdWx0IHZhbHVlLCBLY29uZmlnIG9wdGlvbiBmb3IgY3Vz
dG9taXplZCBhZGRyZXNzKS4NCg0KV2UgYWxzbyBoYWQgdGhvdWdodCB0byB1c2UgS2NvbmZpZyB0
byBkZWZpbmUgYSBkZWZhdWx0IHN0YXJ0IGFkZHJlc3MNCmZvciBlYWNoIHBsYXRmb3JtIGxpa2Ug
d2hhdCB3ZSBoYWQgZG9uZSBmb3IgZWFybHkgcHJpbnRrIGluIFJGQ1syXS4NCkJ1dCB0aGlzIG1l
dGhvZCBoYXMgYmVlbiBkZXByZWNhdGVkLg0KDQpTbyBpZiB3ZSBkb27igJl0IHVzZSBoZWFkZXIg
ZmlsZXMsIGp1c3QgdXNlIHRoZSBLY29uZmlnLCB3ZSBjYW4ndA0KcHJvdmlkZSBhIGRlZmF1bHQg
c3RhcnQgYWRkcmVzcyBmb3IgcGxhdGZvcm1zLCBhbmQgaGF2ZSB0byBmb3JjZSB1c2Vycw0KdG8g
ZW50ZXIgdGhlIHN0YXJ0IGFkZHJlc3MuDQoNClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjItMDUvbXNnMDA2NDMuaHRtbA0KWzJdIGh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9mdXNhL3hlbi1pbnRlZ3JhdGlvbi8tL2Jsb2Iv
aW50ZWdyYXRpb24vbXB1L3hlbi9hcmNoL2FybS9LY29uZmlnLmRlYnVnDQoNCj4gPiArCWRlcGVu
ZHMgb24gSEFTX01QVQ0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8g
c2V0IHRoZSBjdXN0b21pemVkIGFkZHJlc3MgYXQgd2hpY2ggWGVuIHdpbGwNCj4gYmUNCj4gPiAr
CSAgbGlua2VkIG9uIE1QVSBzeXN0ZW1zLiBUaGlzIGFkZHJlc3MgbXVzdCBiZSBhbGlnbmVkIHRv
IGEgcGFnZSBzaXplLg0KPiA+ICsJICBVc2UgMHhGRkZGRkZGRiBhcyB0aGUgZGVmYXVsdCB2YWx1
ZSB0byBpbmRpY2F0ZSB0aGF0IHVzZXIgaGFzbid0DQo+ID4gKwkgIGN1c3RvbWl6ZWQgdGhpcyBh
ZGRyZXNzLCBhbmQgWGVuIHVzZSB1c2UgdGhlIGRlZmF1bHQgdmFsdWUgdGhhdA0KPiBoYXMNCj4g
PiArCSAgYmVlbiBkZWZpbmVkIGluIHBsYXRmb3JtIGZpbGVzLg0KPiA+ICsNCj4gPiAgIHNvdXJj
ZSAiYXJjaC9hcm0vdGVlL0tjb25maWciDQo+ID4NCj4gPiAgIGNvbmZpZyBTVEFUSUNfU0hNDQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wbGF0Zm9ybXMvZnZwX2Jh
c2VyLmgNCj4gYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcGxhdGZvcm1zL2Z2cF9iYXNlci5o
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi45NDUwYTQx
MWE5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9wbGF0Zm9ybXMvZnZwX2Jhc2VyLmgNCj4gPiBAQCAtMCwwICsxLDE0IEBADQo+ID4gKyNpZm5k
ZWYgX19BU01fQVJNX1BMQVRGT1JNU19GVlBfQkFTRVJfSF9fDQo+ID4gKyNkZWZpbmUgX19BU01f
QVJNX1BMQVRGT1JNU19GVlBfQkFTRVJfSF9fDQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiAweEZG
RkZGRkZGIGluZGljYXRlcyB1c2VycyBoYXZlbid0IGN1c3RvbWl6ZWQgWEVOX1NUQVJUX0FERFJF
U1MsDQo+ID4gKyAqIHdlIHdpbGwgdXNlIHBsYXRmb3JtIGRlZmluZWQgZGVmYXVsdCBhZGRyZXNz
Lg0KPiA+ICsgKi8NCj4gPiArI2lmIENPTkZJR19YRU5fU1RBUlRfQUREUkVTUyA9PSAweEZGRkZG
RkZGDQo+ID4gKyNkZWZpbmUgWEVOX1NUQVJUX0FERFJFU1MgMHgyMDAwMDANCj4gPiArI2Vsc2UN
Cj4gPiArI2RlZmluZSBYRU5fU1RBUlRfQUREUkVTUyBDT05GSUdfWEVOX1NUQVJUX0FERFJFU1MN
Cj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICsjZW5kaWYgLyogX19BU01fQVJNX1BMQVRGT1JNU19G
VlBfQkFTRVJfSF9fICovDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMv
S2NvbmZpZw0KPiBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZw0KPiA+IGluZGV4IGM5
M2E2YjI3NTYuLjA5MDQ3OTNhMGIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy9LY29uZmlnDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnDQo+
ID4gQEAgLTEsNiArMSw3IEBADQo+ID4gICBjaG9pY2UNCj4gPiAgIAlwcm9tcHQgIlBsYXRmb3Jt
IFN1cHBvcnQiDQo+ID4gICAJZGVmYXVsdCBBTExfUExBVA0KPiA+ICsJZGVmYXVsdCBGVlBfQkFT
RVIgaWYgQVJNX1Y4Ug0KPiANCj4gSXMgdGhlcmUgYW55IHJlYXNvbiB0byBjcmVhdGUgYSBuZXcg
S2NvbmZpZyByYXRoZXIgdGhhbiB1c2luZyBNUFU/DQo+IA0KDQpEaWQgeW91IG1lYW4gRlZQX0JB
U0VSPyBJZiB5ZXMsIHdlIHdhbnQgdG8gZ2l2ZSBlYWNoIGJvYXJkIGEgTUFDUk8NCnRvIGluZGlj
YXRlIGl0cyBzcGVjaWZpYyBjb25maWd1cmF0aW9ucy4gSW4gY3VycmVudCBzZXJpZXMsIHRoaXMg
TUFDUk8NCm9ubHkgYmUgdXNlZCBmb3IgYm9hcmQgc3BlY2lmaWMgc3RhcnQgYWRkcmVzcy4NCg0K
SWYgeW91IG1lYW50IEFybXY4UiwgdGhhdCdzIGJlY2F1c2UgQXJtdjhSIGRvZXMgbm90IGVxdWFs
IHRvIE1QVS4NCldlIG9ubHkgYWxsb3cgQXJtdjhSIGNvZGUgdG8gZGV0ZWN0IE1QVSBmZWF0dXJl
cy4gTVBVIGlzIGNvbmZpZ3VyYWJsZQ0KSW4gRUwyLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+
ID4gICAJLS0taGVscC0tLQ0KPiA+ICAgCUNob29zZSB3aGljaCBoYXJkd2FyZSBwbGF0Zm9ybSB0
byBlbmFibGUgaW4gWGVuLg0KPiA+DQo+ID4gQEAgLTgsMTMgKzksMTQgQEAgY2hvaWNlDQo+ID4N
Cj4gPiAgIGNvbmZpZyBBTExfUExBVA0KPiA+ICAgCWJvb2wgIkFsbCBQbGF0Zm9ybXMiDQo+ID4g
KwlkZXBlbmRzIG9uICFBUk1fVjhSDQo+ID4gICAJLS0taGVscC0tLQ0KPiA+ICAgCUVuYWJsZSBz
dXBwb3J0IGZvciBhbGwgYXZhaWxhYmxlIGhhcmR3YXJlIHBsYXRmb3Jtcy4gSXQgZG9lc24ndA0K
PiA+ICAgCWF1dG9tYXRpY2FsbHkgc2VsZWN0IGFueSBvZiB0aGUgcmVsYXRlZCBkcml2ZXJzLg0K
PiA+DQo+ID4gICBjb25maWcgUUVNVQ0KPiA+ICAgCWJvb2wgIlFFTVUgYWFyY2ggdmlydCBtYWNo
aW5lIHN1cHBvcnQiDQo+ID4gLQlkZXBlbmRzIG9uIEFSTV82NA0KPiA+ICsJZGVwZW5kcyBvbiBB
Uk1fNjQgJiYgIUFSTV9WOFINCj4gPiAgIAlzZWxlY3QgR0lDVjMNCj4gPiAgIAlzZWxlY3QgSEFT
X1BMMDExDQo+ID4gICAJLS0taGVscC0tLQ0KPiA+IEBAIC0yMyw3ICsyNSw3IEBAIGNvbmZpZyBR
RU1VDQo+ID4NCj4gPiAgIGNvbmZpZyBSQ0FSMw0KPiA+ICAgCWJvb2wgIlJlbmVzYXMgUkNhcjMg
c3VwcG9ydCINCj4gPiAtCWRlcGVuZHMgb24gQVJNXzY0DQo+ID4gKwlkZXBlbmRzIG9uIEFSTV82
NCAmJiAhQVJNX1Y4Ug0KPiA+ICAgCXNlbGVjdCBIQVNfU0NJRg0KPiA+ICAgCXNlbGVjdCBJUE1N
VV9WTVNBDQo+ID4gICAJLS0taGVscC0tLQ0KPiA+IEBAIC0zMSwxNCArMzMsMjIgQEAgY29uZmln
IFJDQVIzDQo+ID4NCj4gPiAgIGNvbmZpZyBNUFNPQw0KPiA+ICAgCWJvb2wgIlhpbGlueCBVbHRy
YXNjYWxlKyBNUFNvQyBzdXBwb3J0Ig0KPiA+IC0JZGVwZW5kcyBvbiBBUk1fNjQNCj4gPiArCWRl
cGVuZHMgb24gQVJNXzY0ICYmICFBUk1fVjhSDQo+ID4gICAJc2VsZWN0IEhBU19DQURFTkNFX1VB
UlQNCj4gPiAgIAlzZWxlY3QgQVJNX1NNTVUNCj4gPiAgIAktLS1oZWxwLS0tDQo+ID4gICAJRW5h
YmxlIGFsbCB0aGUgcmVxdWlyZWQgZHJpdmVycyBmb3IgWGlsaW54IFVsdHJhc2NhbGUrIE1QU29D
DQo+ID4NCj4gPiArY29uZmlnIEZWUF9CQVNFUg0KPiA+ICsJYm9vbCAiRml4ZWQgVmlydHVhbCBQ
bGF0Zm9ybSBCYXNlUiBzdXBwb3J0Ig0KPiA+ICsJZGVwZW5kcyBvbiBBUk1fVjhSDQo+ID4gKwlo
ZWxwDQo+ID4gKwkgIEVuYWJsZSBwbGF0Zm9ybSBzcGVjaWZpYyBjb25maWd1cmF0aW9ucyBmb3Ig
Rml4ZWQgVmlydHVhbA0KPiA+ICsJICBQbGF0Zm9ybSBCYXNlUg0KPiA+ICsNCj4gPiAgIGNvbmZp
ZyBOT19QTEFUDQo+ID4gICAJYm9vbCAiTm8gUGxhdGZvcm1zIg0KPiA+ICsJZGVwZW5kcyBvbiAh
QVJNX1Y4Ug0KPiA+ICAgCS0tLWhlbHAtLS0NCj4gPiAgIAlEbyBub3QgZW5hYmxlIHNwZWNpZmlj
IHN1cHBvcnQgZm9yIGFueSBwbGF0Zm9ybS4NCj4gPg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQo=

