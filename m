Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14355F9D9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357612.586265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6SdL-0007Xp-Ux; Wed, 29 Jun 2022 08:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357612.586265; Wed, 29 Jun 2022 08:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6SdL-0007Wu-Rg; Wed, 29 Jun 2022 08:01:11 +0000
Received: by outflank-mailman (input) for mailman id 357612;
 Wed, 29 Jun 2022 08:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlzK=XE=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o6SdK-0007W3-LR
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:01:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a275be6c-f781-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 10:01:09 +0200 (CEST)
Received: from DB6PR07CA0191.eurprd07.prod.outlook.com (2603:10a6:6:42::21) by
 HE1PR0802MB2411.eurprd08.prod.outlook.com (2603:10a6:3:db::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Wed, 29 Jun 2022 08:01:06 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::6f) by DB6PR07CA0191.outlook.office365.com
 (2603:10a6:6:42::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.7 via Frontend
 Transport; Wed, 29 Jun 2022 08:01:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 08:01:05 +0000
Received: ("Tessian outbound 8dc5ba215ad1:v121");
 Wed, 29 Jun 2022 08:01:05 +0000
Received: from 49b17dcaed49.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D9FA508-8DAF-44B0-A6B5-025FD946DEA6.1; 
 Wed, 29 Jun 2022 08:00:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49b17dcaed49.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 08:00:59 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM5PR0801MB1732.eurprd08.prod.outlook.com (2603:10a6:203:35::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 08:00:58 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 08:00:58 +0000
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
X-Inumbo-ID: a275be6c-f781-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=czEI22XMJRqNO1sriJ24tXIt48VekGN5LqOiXWxiqxWlUnV5Sim4t0YCVP12CASSWcUJWp4jAXi4YUtCOhCE1/y1sGUuVj4BvYOGTXr1h9QUH3j4UeUpA0be2qO1O6GY8tLqbNWPpMl4Z2FWqXUqNKgs0fRwT4Q7DTt5CpV4HwoA8RMdjVBHxvyNs0uhHPoNKeesclM+UvSpxeIo/73PSM+Q0z9pUTJQVqTWFMB/77Qfdwk/s+7IfVeEvh4VpKpoFoXUUxxnBIlUogW57W+/vGz2mdq/C0l60+Cj2WtdsZcDxAkFKOYl9GL/U1hqxk42hdFz805TqjTiiH484d25bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/1TKzmdiSLsy6p3WNNRvQVY1fgUO+Mpr2uf4Sm5CK4=;
 b=YMn5HtwDhtYfmTPmrkDwc2WTmbvi9CRBdiDx5BpenqUQ6bR2doFTQW96qjlFI+MqGs21oK5HZ0+vIkPv4I7fYYUaVUAb+gSl2fB/62+8ln+1/hobd7WUnmg3Ia1LJzNpEyM93iLRy6g1T/lJrXnc9WX2/e+R/u7HvIrSr5c8wy33k33tmjECKEVGOdIBZMikBxXlgRKfG/Vw6MCy0vBhNu4vA/njAI1uCt0OP7Kgew0RF2leQfJPerHerWaltndTnF2YD25Dnwy18URRzPEtFSpPIt21Kya4x8SCA6TYvFF+/Y8cJSKPxpl1CZd78zCyDA1/8snmqErLZyeEV8Xr7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/1TKzmdiSLsy6p3WNNRvQVY1fgUO+Mpr2uf4Sm5CK4=;
 b=DSrnFGPZfA1LkI1d5QOy2nG3MnPUX8sUXd6rA8ZOLefjcF+AT72fkDdIcP8akmCY+TAu/kwo7V0CIuct9/BMK13MXv11TYPZmbXQT437OWxSojj01odRTMJ9DZkxHD4uNgGocfORIYnnzqiyueWp5cSUOtW1H6YneszIxEHSZzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQH/iPbk0XStfDdv4D/V1eZfZyU2XveeqOcg6mZT9zU83FsZNyIwP/jptG/0NVC4bGGsR4JedoK1xFXE+z0AzVU6GpWsrLw20cHkjqqtwLt5PNS116CfGeUYUIMcICHDIUe5Ylh34L5a+JknQPPicPUzVIjQxCmu9KJXZ4QCOTEzVOK6DKXuQ+uKsPwFw7apB3zoW3jUngPNluSv9L775WNVb0x1+/2SHGdwgyUkifyD1gL5eqm84TUZRPDi4sWzrxhS6PivpkU0VFJz0kvi9+GgaDRrZ9G0sNozOnUWDTAojpBz2BNZ4ouHZKp20MVxOw6ziZ24BQcA9T5OH/PwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/1TKzmdiSLsy6p3WNNRvQVY1fgUO+Mpr2uf4Sm5CK4=;
 b=GH3jDjeLTNpoPB+oyJC7Ni7d2sFZISAK2UderePj2Cfp27++WdygQgJa9xxtPMjA1Kzf3iTE6idzKU1wXA9LZHvYKaaiFs3UFa0ijfAMX8CzH46XHp2XWgHwkxIQvoBoS8lKdhcvk5h/2junhxewRAwcOmjfRIATD79Wc2ePlIABbtN+oWKYcEGOAgq0+izH0OS3m4P/M3Oox+aEBYfrFlgdC0F+CfuS/kn8Rsa/o4bbcG5kKmHh9ZUqVX+jXMQxfNh0G4GcWqbsS6MqmZdj6KJx3IFsqO7V0KKtGRWvavYaPVE4CYcthiYnRvpqsLVS+hMA8YO9VGDzPhCEArws0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/1TKzmdiSLsy6p3WNNRvQVY1fgUO+Mpr2uf4Sm5CK4=;
 b=DSrnFGPZfA1LkI1d5QOy2nG3MnPUX8sUXd6rA8ZOLefjcF+AT72fkDdIcP8akmCY+TAu/kwo7V0CIuct9/BMK13MXv11TYPZmbXQT437OWxSojj01odRTMJ9DZkxHD4uNgGocfORIYnnzqiyueWp5cSUOtW1H6YneszIxEHSZzg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 5/8] xen/arm: Add additional reference to owner domain
 when the owner is allocated
Thread-Topic: [PATCH v5 5/8] xen/arm: Add additional reference to owner domain
 when the owner is allocated
Thread-Index: AQHYhGRF6qbL+APV6ECW1Ou9EE75yq1e9ZGAgAcdi0A=
Date: Wed, 29 Jun 2022 08:00:58 +0000
Message-ID:
 <DU2PR08MB732566EA1E988ECDD6A6C172F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-6-Penny.Zheng@arm.com>
 <3e397ff3-0b67-523c-179a-0a2035b081da@xen.org>
In-Reply-To: <3e397ff3-0b67-523c-179a-0a2035b081da@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1E0E0A75A317E34097305742E9FEFB52.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 39e010da-dead-4871-f190-08da59a584d8
x-ms-traffictypediagnostic:
	AM5PR0801MB1732:EE_|DBAEUR03FT057:EE_|HE1PR0802MB2411:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nxtZeTmunqt6sC4dSJHXfOwobOdeJ4gq4SQaZXA+4CW4A9hMno3qyLJQ/mKmwxUIUQAY1XPfIaxJSxW8NZHGSCBIIfJc4LAqjnyBzwD9r1IstkGJCi91KXPodTN08Pizog3FUzxFgdm2+3suspCMpQfh3QL6PG2FK+Loxl4brGCXLcEsIvBtT1DvaeNA2UjvgsUdbSAw7NtOeU9qa8WiWImdtXUXz8F5FvMxdBk4GQq0xs4/g2Q55bSNyEJ1eZ5nCe17mBeNLuQuuYWa5xPrhjh0Px0WnjYzg3PPg1tW2/qpvCHd8z7leVogPNFhedY7EHltW7MYRq1cAgliI9glxRwcOrdlgf6TbKemRgFwegA1yW/oz/7tjJ1luE1bOGMBYyBlkth9PsekX0i2xf5mmSOYfn9QmVod+nmBfOpvtKdItYDyNMPAxhftgTo613OVSLsAWSMkN1n7nwY7UoJaFKYgNEwzfXGJ6Pzxw3lxOv+PJvhiZ6WM8KR0s4QJR+N0eVWaYmzK4UaF60fUhLFPzasakI90VeJlGuyvhBYoMNd/YoE/xLjcTjFKIkhYI1aOvNXuH8zr9H3FEeNLwdne3x5j1FSF56HXjEiFMf9eguVuLR7N8sq7ltxcbMAfyd2L+5dXnfKwvFot3X0zTIdUhGqzygJwAVzz3OBs3+3WBL3qa3uvKHRF0mbLnk88noSQYwa7w4bazlbLOWkTVnaZ60g/i7NtdWPzHyrTDiIh3Zmf7o2jgHRlxTS93u7dEe9oOQ0eOWIceUXvPFjsh8Rn8k6HfsiAWJLY5xLIpXzgq+E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(186003)(38100700002)(41300700001)(478600001)(2906002)(8936002)(52536014)(122000001)(86362001)(38070700005)(7696005)(110136005)(55016003)(6506007)(66946007)(64756008)(33656002)(54906003)(66446008)(76116006)(71200400001)(53546011)(8676002)(4326008)(66556008)(26005)(83380400001)(66476007)(316002)(5660300002)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecfe3ecb-1551-48b1-d0f6-08da59a5803b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/cwNNmS7KvlYuBtyg30N9ZfdSqLFee5ZjNYeH2IoLzg663APbguqYNBVbMA36rfV04wEIrfgbEfoeuYAAjpLyebWZDNbWiCKO9iMXmO33kctfxT238bcVSsESDdkdK/dCK31w9Rd0p5vEyh0MtBjWcoFKiGDAmWn1riuJJKLOJ2XzWRwiKxNJ7L52/GhxiQjw600Kj7jIFyEuHzvLRZSYGthRxcfvjH0Ay5fsR4idSesGS0CjtGkzV5LdVI/wln7vs7opQ3MncFiwjTc+0zU6EIMxWlFQ6ZdIG0LJiIEB+fi60XjOceoF7BMkw928ui7Xhz/F0vip52Cx1rlopIroBFTfIzDa+4eNU12ktggGNQChU9+pvNV2EhVb2N4R892foTrd1S11EF1tB8XEg/oiiMA1vtiwhOiy7igkcU9aVwfyvqa2VUM0KarMobjC9aZEgIgTrwezIrjHlzWR/iZu+YS6Tn8JD+7GnlryE/5MNtqXFw1oaASlSREJnRYd8hT85xKI+Zj2kFi++w91WWqzSlaVOe6qhQuio50ve69dhwPqJl2lRIhBYlcK8RwpObV6NQo7Nc/wdViI/fr5BeDRRS4CVEyEFinc/LfdBrkmjUjuloCtP/QTBrK2/q4h+9zMwcUwUNjBOauplDC66wifq568yqhk64ykV4ejxcaOyPasXaTydtyMUsJ1PjuwrFP8Zdwoaxewi39mcjPpB79d/KzuPCjrTCastOLQiEueekHYgghFdKQ2Fr0kOKx01AqmLjJd1siqc9q5cridWk0fDaUbMkSQ6B01r6AHAtHAdmo77Cj83cSxP/8Zwzf259p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(40460700003)(316002)(4326008)(41300700001)(8676002)(356005)(70586007)(70206006)(186003)(55016003)(6506007)(110136005)(36860700001)(5660300002)(7696005)(26005)(107886003)(47076005)(33656002)(86362001)(54906003)(9686003)(8936002)(52536014)(53546011)(2906002)(40480700001)(82310400005)(83380400001)(82740400003)(81166007)(336012)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 08:01:05.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e010da-dead-4871-f190-08da59a584d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2411

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMjUsIDIwMjIg
MzoxOCBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1
IDUvOF0geGVuL2FybTogQWRkIGFkZGl0aW9uYWwgcmVmZXJlbmNlIHRvIG93bmVyDQo+IGRvbWFp
biB3aGVuIHRoZSBvd25lciBpcyBhbGxvY2F0ZWQNCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24g
MjAvMDYvMjAyMiAwNjoxMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gQm9ycm93ZXIgZG9tYWlu
IHdpbGwgZmFpbCB0byBnZXQgYSBwYWdlIHJlZiB1c2luZyB0aGUgb3duZXIgZG9tYWluDQo+ID4g
ZHVyaW5nIGFsbG9jYXRpb24sIHdoZW4gdGhlIG93bmVyIGlzIGNyZWF0ZWQgYWZ0ZXIgYm9ycm93
ZXIuDQo+ID4NCj4gPiBTbyBoZXJlLCB3ZSBkZWNpZGUgdG8gZ2V0IGFuZCBhZGQgdGhlIHJpZ2h0
IGFtb3VudCBvZiByZWZlcmVuY2UsIHdoaWNoDQo+ID4gaXMgdGhlIG51bWJlciBvZiBib3Jyb3dl
cnMsIHdoZW4gdGhlIG93bmVyIGlzIGFsbG9jYXRlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IFJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gdjUg
Y2hhbmdlOg0KPiA+IC0gbm8gY2hhbmdlDQo+ID4gLS0tDQo+ID4gdjQgY2hhbmdlczoNCj4gPiAt
IG5vIGNoYW5nZQ0KPiA+IC0tLQ0KPiA+IHYzIGNoYW5nZToNCj4gPiAtIHByaW50ayByYXRoZXIg
dGhhbiBkcHJpbnRrIHNpbmNlIGl0IGlzIGEgc2VyaW91cyBlcnJvcg0KPiA+IC0tLQ0KPiA+IHYy
IGNoYW5nZToNCj4gPiAtIG5ldyBjb21taXQNCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYyB8IDYyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jDQo+ID4gaW5kZXggZDRmZDY0ZTJiZC4uNjUwZDE4ZjVlZiAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMNCj4gPiBAQCAtNzk5LDYgKzc5OSwzNCBAQCBzdGF0aWMgbWZuX3QgX19p
bml0DQo+ID4gYWNxdWlyZV9zaGFyZWRfbWVtb3J5X2Jhbmsoc3RydWN0IGRvbWFpbiAqZCwNCj4g
Pg0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGFjcXVpcmVfbnJfYm9ycm93
ZXJfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgcGJhc2UsIHBhZGRyX3QgcHNpemUsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcNCj4gPiArKm5yX2JvcnJvd2Vycykgew0KPiA+ICsgICAgdW5zaWduZWQgbG9uZyBiYW5rOw0K
PiA+ICsNCj4gPiArICAgIC8qIEl0ZXJhdGUgcmVzZXJ2ZWQgbWVtb3J5IHRvIGZpbmQgcmVxdWVz
dGVkIHNobSBiYW5rLiAqLw0KPiA+ICsgICAgZm9yICggYmFuayA9IDAgOyBiYW5rIDwgYm9vdGlu
Zm8ucmVzZXJ2ZWRfbWVtLm5yX2JhbmtzOyBiYW5rKysgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAg
ICAgIHBhZGRyX3QgYmFua19zdGFydCA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2Jhbmtd
LnN0YXJ0Ow0KPiA+ICsgICAgICAgIHBhZGRyX3QgYmFua19zaXplID0gYm9vdGluZm8ucmVzZXJ2
ZWRfbWVtLmJhbmtbYmFua10uc2l6ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBwYmFzZSA9
PSBiYW5rX3N0YXJ0ICYmIHBzaXplID09IGJhbmtfc2l6ZSApDQo+ID4gKyAgICAgICAgICAgIGJy
ZWFrOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggYmFuayA9PSBib290aW5mby5y
ZXNlcnZlZF9tZW0ubnJfYmFua3MgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRU5PRU5UOw0KPiA+
ICsNCj4gPiArICAgIGlmICggZCA9PSBkb21faW8gKQ0KPiA+ICsgICAgICAgICpucl9ib3Jyb3dl
cnMgPQ0KPiBib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tiYW5rXS5ucl9zaG1fZG9tYWluOw0K
PiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgICAgIC8qIEV4Y2x1ZGUgdGhlIG93bmVyIGRvbWFpbiBp
dHNlbGYuICovDQo+IE5JVDogSSB0aGluayB0aGlzIGNvbW1lbnQgd2FudHMgdG8gYmUganVzdCBh
Ym92ZSB0aGUgJ2lmJyBhbmQgZXhwYW5kZWQgdG8NCj4gZXhwbGFpbiB3aHkgdGhlICJkb21faW8i
IGlzIG5vdCBpbmNsdWRlZC4gQUZBSVUsIHRoaXMgaXMgYmVjYXVzZSAiZG9tX2lvIiBpcw0KPiBu
b3QgZGVzY3JpYmVkIGluIHRoZSBEZXZpY2UtVHJlZSwgc28gaXQgd291bGQgbm90IGJlIHRha2Vu
IGludG8gYWNjb3VudCBmb3INCj4gbnJfc2htX2RvbWFpbi4NCj4gDQo+ID4gKyAgICAgICAgKm5y
X2JvcnJvd2VycyA9DQo+ID4gKyBib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tiYW5rXS5ucl9z
aG1fZG9tYWluIC0gMTsNCj4gDQo+IFRCSCwgZ2l2ZW4gdGhlIHVzZSBoZXJlLiBJIHdvdWxkIGhh
dmUgY29uc2lkZXIgdG8gbm90IGluY3JlbWVudA0KPiBucl9zaG1fZG9tYWluIGlmIHRoZSByb2xl
IHdhcyBvd25lciBpbiBwYXJzaW5nIGNvZGUuIFRoaXMgaXMgdjUgbm93LCBzbyBJDQo+IHdvdWxk
IGJlIE9LIHdpdGggdGhlIGNvbW1lbnQgYWJvdmUuDQo+IA0KPiBCdXQgSSB3b3VsZCBzdWdnZXN0
IHRvIGNvbnNpZGVyIGl0IGFzIGEgZm9sbG93LXVwLg0KPiANCg0KTFRNLCBpdCBpcyBub3QgYSBi
aWcgY2hhbmdlLCBJJ2xsIHRyeSB0byBpbmNsdWRlIGl0IGluIHRoZSBuZXh0IHNlcmllfg0KDQo+
ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gICAvKg0KPiA+ICAg
ICogRnVuYyBhbGxvY2F0ZV9zaGFyZWRfbWVtb3J5IGlzIHN1cHBvc2VkIHRvIGJlIG9ubHkgY2Fs
bGVkDQo+ID4gICAgKiBmcm9tIHRoZSBvd25lci4NCj4gPiBAQCAtODEwLDYgKzgzOCw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IGFsbG9jYXRlX3NoYXJlZF9tZW1vcnkoc3RydWN0DQo+IGRvbWFpbiAq
ZCwNCj4gPiAgIHsNCj4gPiAgICAgICBtZm5fdCBzbWZuOw0KPiA+ICAgICAgIGludCByZXQgPSAw
Ow0KPiA+ICsgICAgdW5zaWduZWQgbG9uZyBucl9wYWdlcywgbnJfYm9ycm93ZXJzLCBpOw0KPiA+
ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsNCj4gPg0KPiA+ICAgICAgIGRwcmludGsoWEVO
TE9HX0lORk8sDQo+ID4gICAgICAgICAgICAgICAiQWxsb2NhdGUgc3RhdGljIHNoYXJlZCBtZW1v
cnkgQkFOSw0KPiA+ICUjIlBSSXBhZGRyIi0lIyJQUklwYWRkciIuXG4iLCBAQCAtODI0LDYgKzg1
NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0DQo+IGFsbG9jYXRlX3NoYXJlZF9tZW1vcnkoc3RydWN0
IGRvbWFpbiAqZCwNCj4gPiAgICAgICAgKiBET01JRF9JTyBpcyB0aGUgZG9tYWluLCBsaWtlIERP
TUlEX1hFTiwgdGhhdCBpcyBub3QgYXV0by0NCj4gdHJhbnNsYXRlZC4NCj4gPiAgICAgICAgKiBJ
dCBzZWVzIFJBTSAxOjEgYW5kIHdlIGRvIG5vdCBuZWVkIHRvIGNyZWF0ZSBQMk0gbWFwcGluZyBm
b3IgaXQNCj4gPiAgICAgICAgKi8NCj4gPiArICAgIG5yX3BhZ2VzID0gUEZOX0RPV04ocHNpemUp
Ow0KPiA+ICAgICAgIGlmICggZCAhPSBkb21faW8gKQ0KPiA+ICAgICAgIHsNCj4gPiAgICAgICAg
ICAgcmV0ID0gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZXMoZCwgZ2FkZHJfdG9fZ2ZuKGdiYXNlKSwg
c21mbiwNCj4gPiBQRk5fRE9XTihwc2l6ZSkpOyBAQCAtODM1LDYgKzg2NiwzNyBAQCBzdGF0aWMg
aW50IF9faW5pdA0KPiBhbGxvY2F0ZV9zaGFyZWRfbWVtb3J5KHN0cnVjdCBkb21haW4gKmQsDQo+
ID4gICAgICAgICAgIH0NCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAgIC8qDQo+ID4gKyAgICAg
KiBHZXQgdGhlIHJpZ2h0IGFtb3VudCBvZiByZWZlcmVuY2VzIHBlciBwYWdlLCB3aGljaCBpcyB0
aGUgbnVtYmVyIG9mDQo+ID4gKyAgICAgKiBib3Jyb3cgZG9tYWlucy4NCj4gPiArICAgICAqLw0K
PiA+ICsgICAgcmV0ID0gYWNxdWlyZV9ucl9ib3Jyb3dlcl9kb21haW4oZCwgcGJhc2UsIHBzaXpl
LCAmbnJfYm9ycm93ZXJzKTsNCj4gPiArICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICByZXR1
cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBJbnN0ZWFkIG9mIGxldCBi
b3Jyb3dlciBkb21haW4gZ2V0IGEgcGFnZSByZWYsIHdlIGFkZCBhcyBtYW55DQo+IA0KPiBUeXBv
OiBzL2xldC9sZXR0aW5nLw0KPiANCj4gPiArICAgICAqIGFkZGl0aW9uYWwgcmVmZXJlbmNlIGFz
IHRoZSBudW1iZXIgb2YgYm9ycm93ZXJzIHdoZW4gdGhlIG93bmVyDQo+ID4gKyAgICAgKiBpcyBh
bGxvY2F0ZWQsIHNpbmNlIHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQgb3duZXIgaXMgY3JlYXRlZA0K
PiA+ICsgICAgICogYWZ0ZXIgYm9ycm93ZXIuDQo+IA0KPiBXaGF0IGlmIHRoZSBib3Jyb3dlciBp
cyBjcmVhdGVkIGZpcnN0PyBXb3VsZG4ndCB0aGlzIHJlc3VsdCB0byBhZGQgcGFnZXMgaW4gdGhl
DQo+IFAyTSB3aXRob3V0IHJlZmVyZW5jZT8NCj4gDQo+IElmIHllcywgdGhlbiBJIHRoaW5rIHRo
aXMgaXMgd29ydGggYW4gZXhwbGFpbmF0aW9uLg0KPiANCg0KWWVzLCBpdCBpcyBpbnRlbmRlZCB0
byBiZSB0aGUgd2F5IHlvdSBzYWlkLCBhbmQgSSdsbCBhZGQgYSBjb21tZW50IHRvIGV4cGxhaW4u
DQoNCj4gPiArICAgICAqLw0KPiA+ICsgICAgcGFnZSA9IG1mbl90b19wYWdlKHNtZm4pOw0KPiAN
Cj4gV2hlcmUgZG8geW91IHZhbGlkYXRlIHRoZSByYW5nZSBbc21mbiwgbnJfcGFnZXNdPw0KPiAN
Cj4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKyApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgaWYgKCAhZ2V0X3BhZ2VfbnIocGFnZSArIGksIGQsIG5yX2JvcnJvd2Vycykg
KQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4g
PiArICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gYWRkICVsdSByZWZlcmVuY2VzIHRvIHBh
Z2UgJSJQUklfbWZuIi5cbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBucl9ib3Jyb3dlcnMs
IG1mbl94KHNtZm4pICsgaSk7DQo+ID4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gPiArICAg
ICAgICB9DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+
ICsgZmFpbDoNCj4gPiArICAgIHdoaWxlICggLS1pID49IDAgKQ0KPiA+ICsgICAgICAgIHB1dF9w
YWdlX25yKHBhZ2UgKyBpLCBucl9ib3Jyb3dlcnMpOw0KPiA+ICAgICAgIHJldHVybiByZXQ7DQo+
ID4gICB9DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

