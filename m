Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D05628D2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 04:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358812.588176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o76Fs-0001dx-Em; Fri, 01 Jul 2022 02:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358812.588176; Fri, 01 Jul 2022 02:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o76Fs-0001bD-9m; Fri, 01 Jul 2022 02:19:36 +0000
Received: by outflank-mailman (input) for mailman id 358812;
 Fri, 01 Jul 2022 02:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOeg=XG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o76Fq-0001b7-Ph
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 02:19:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3daa6d55-f8e4-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 04:19:31 +0200 (CEST)
Received: from AS9PR06CA0533.eurprd06.prod.outlook.com (2603:10a6:20b:49d::22)
 by AM8PR08MB6436.eurprd08.prod.outlook.com (2603:10a6:20b:365::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 1 Jul
 2022 02:19:29 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::74) by AS9PR06CA0533.outlook.office365.com
 (2603:10a6:20b:49d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Fri, 1 Jul 2022 02:19:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 02:19:28 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Fri, 01 Jul 2022 02:19:28 +0000
Received: from c54de96ddbd2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D401D96E-BA98-408E-BE28-5393416AA6E8.1; 
 Fri, 01 Jul 2022 02:19:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c54de96ddbd2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Jul 2022 02:19:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM6PR08MB4738.eurprd08.prod.outlook.com (2603:10a6:20b:cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 02:19:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 02:19:19 +0000
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
X-Inumbo-ID: 3daa6d55-f8e4-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JeOU6DH+phyr2NRTxpm3CCvkVB4G9UmUGVsb/7pazRP4u+CarzbeRiJTkoGEYjnpZSO4eFpaNsXYAEtPAK7AjvlmTU/aJuyzTQidoK9ptkGWVRxIJhcCaZlyKo98rlWBbdl6NjVPRYyLLrAlpHa55lQMFrFIrs27P3TmrEPrhDqSlzXnOgKKAng4UtT2IT9TiwWjz+ELBWUTigHaoi8Lv/ajQSqwyCEZ2mhTw8zPFt5xVpgevj13gRubnqFwJl2IiWREdSlx4TCVVoUM4XIALY/lcJcPIc/B7V7t/Wj0+Gtx1WrjNdT2ZvXxOCdJJDZks/sD030VzpWAqdgxRxQzrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8leDshB0WObPEc5klG/W1tDeKdRnxiYzvuy7rcoviw=;
 b=iNpnYkwYzxM8me46qbPaW36X6nfhcQauM+JZ5QikQfm0lmoENtS5YGZhguCvSkDWWAvr6b5Of2mUafQJKrkopyyP1bfcnjPTok4k6+hh+oO6aayKY5EJpMzkNpqts/87HIQnz1zoMqbFnT3BXOKC0EgrCByW4chQx4VUJ6hs5bTwsmCXfHfoSJ3d5xJScGWhY4HqW3zyHhpGNvEhvEEAE/sabDnSWQPRzWVR63KLhsDe2seivYWtqiYPxEca0sHp2NdF0P/MKxtv1PX+15dkf9+UKd+GtZe9+GLcAAks+AUzTJYDH0O7z1bsiwlawwRD8cf1lB/jyDXL0VnQiHf98Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8leDshB0WObPEc5klG/W1tDeKdRnxiYzvuy7rcoviw=;
 b=kiQXnbSkeQR0e/BiVOJVG2IDsO1RQwSzvyQZCoIqZTxvIjXXX/xugigxWgrI/WGCFg4oWUZqxzaAsESTfrFj05Aha282SZ/x4H78akn6TOpMy2ggZuOkBe7LlviVx4F7haDUDA/n42A+vk7zEQ5NgoL6Dbj3z1tGKx0O3tVEIdQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRANAfrtm1Xb5RMwtj4M0wTxEsA+Nt7KOwNG+0ivI8MdgKkDkZhsdcU42rYKeR92gNNledDXcf6oWKbCxq7v7luVBXFdMiTemtKm1XDE0XqSnye1/uoCnxDvdZ3nCC1fMlctiQ4vPzMM0vRMvSlEOKFLnfoQQVh4s/Cai94AMOPGxHbly/KTuPGoRZCZvXP9SRaYTXq45ztAgsQ29HbddbNaq6pzyxsYPp03ElBfHauUXrNwIsXswibOW++YgI+ztpM5po5yNtI5MsEoTSROHYIZKp1A9SnBhZDnwtwq+F/2BEAq1vIn6bDdQF1q+LLOWm6GNK4GV3KgyfCD+WEnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8leDshB0WObPEc5klG/W1tDeKdRnxiYzvuy7rcoviw=;
 b=cRXzWtP+2GsSuqAMe+7OZn0dWdxy1BujhOovKisroR7n+r3F8bZJcTO9gtJEMyNcDltQxwK2kb3iTr5Amo8pqmTYVDuEP3KDOQemgiYoMQIADmMNNf+3QD9LKSlGZdztvBSu9lCU1RoFqd9W/mRv+4K89q3YN8tmSiWSUfHdIdRhsvO1sBaVOioUhvJviq3IRE4mlx87J3kCSwF5BjVGWUf00pYCGYxbdoUg6QRydsfDCCUQCr+3zZYajapBAaeDyFoIX6iGuTFbCDduotpB+7gxXfEvoBnV64nypbB8WnlNcabeXum4R8UD7rIqIh0KMk1OCoPRLqG5N4vCzsCWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8leDshB0WObPEc5klG/W1tDeKdRnxiYzvuy7rcoviw=;
 b=kiQXnbSkeQR0e/BiVOJVG2IDsO1RQwSzvyQZCoIqZTxvIjXXX/xugigxWgrI/WGCFg4oWUZqxzaAsESTfrFj05Aha282SZ/x4H78akn6TOpMy2ggZuOkBe7LlviVx4F7haDUDA/n42A+vk7zEQ5NgoL6Dbj3z1tGKx0O3tVEIdQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: RE: [PATCH v3] public/io: xs_wire: Document that new errors should be
 added at the end
Thread-Topic: [PATCH v3] public/io: xs_wire: Document that new errors should
 be added at the end
Thread-Index: AQHYjLCT8ll1pspHXU2Irp2zQF5YmK1ox2KQ
Date: Fri, 1 Jul 2022 02:19:19 +0000
Message-ID:
 <AS8PR08MB79915165082E112C7631801892BD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220630183655.44391-1-julien@xen.org>
In-Reply-To: <20220630183655.44391-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A6D25A2AA60E3A488C1CECD1C8361DA0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6dfd1694-7e58-48f2-ea07-08da5b08205d
x-ms-traffictypediagnostic:
	AM6PR08MB4738:EE_|AM5EUR03FT054:EE_|AM8PR08MB6436:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nfzgfnXJVY6C3lCtUD90H2plS3+ZZuXb9YU7yF2y0Td2DY8obWW2kmRx0ouCSxbYTjB3/zMpIfizxdrPUdjOntCL9o88W0CsQ3lCoC9SV3n7+2EdmnfcNukcDAfZGAf1MgPc0lCLroEwMbGQUT9OZKChc4gS7j5HLhpheEJdUohG6guecRODOM6dKJIB61WlvmIX8BHg+0ZuapBeOAibEvmqVfTwm+oU2JiYaCanCyF/OS6c5QF/K4Zq2Haf2e0FlVcKFRNVk7+cG/ULCGGwOuI6HHQ5zL1zQgP251eIUsYmimocy16HT6bSaAAFpfvz5kyRsQrVmAJ/RmhfHxgZix8HPtyRXc5AOtxvhqQWtIlFY/XzauDTqLLfVoT7JaXbStR1P+VZ0Z3zL9BrdCPh5GxEhobBMXhjP0cn+6+sdBN3/Aweqv5L6tuSN+SWZyZaGWTuPzRPz2ODRi78gP4+b5Civ4FFKs7u1ZH87oc1t1QgfwW/8K08gC4dET7IJHNYw1jLPkGEnmWykjRg+aX7xxXua0oL9OReS6t/4NobBJHclqydsF0t5fBT+Bd1vuaW7Mshwp1XLWEg7Apb1rFAB1xZLD2xogErXhQzXjS50n2uvYkHOv+mRnCTyuaxkkUNDNPBrccODngjE4IAJrH8vBygvFP2SMfKfWzFGKzkGUueVou8OCP0oHA+g3vxZTUDTPWsjKu7ertam/9422xOKIxucKjlrlNsxbG4p7qX8mXUNmmqJnxNe3mBxDu+DlTrHnwtvcqxcJ5sBVUW9AumCtVjUWPw6Ha7ZTmZz5PKHaOpFnM/xY1cPrwQYjcaIi6L
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(41300700001)(5660300002)(2906002)(83380400001)(7696005)(71200400001)(55016003)(66446008)(122000001)(186003)(33656002)(52536014)(66476007)(66946007)(64756008)(478600001)(66556008)(110136005)(4326008)(76116006)(8676002)(26005)(316002)(38100700002)(9686003)(86362001)(38070700005)(6506007)(54906003)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4738
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05362098-15cc-4d60-80f8-08da5b081aae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	98I7wQ3oxToDk7W+KXApDanIr4JwMW3t1tAPMtkA+0IS0JOeiXR3Ld3K70NakEVwX0PgM2ZO/4MubOmXW6Zt9skdRPQO15c57qgO1bLtTsQAR7UfeXq1WwX+cePJ6pAaACBBUutr6EKtXZ7hsolGaRsAA/ULiQD+UCCWxtHJTSWZRFQjw970a7a5kukWWUMJ9kswE5gEhiC1hWfvhyyMA7pIJt08szf3QyXU5BE6wLbM5AIlvIZUIrdN0N+/oupBvoW35vl4sRJMLvkbisDGVF34UBTXEYobnKOvmaKRqxQs02oyetNXCqtsHDFO9OSeP093xsrVY9nJwle5BRFyDevcH+BdHB+6ieFWezD2f0cQKSsT5SgJ/mbv3giWCm68owCCQImEcQFKz+X4ocAGJODDo4K80cj4cUaIyGZCdJJ2ccpBxrRhgtjpnGzDGqgk9p6UeM0df42F1Zk8/jIZOZe+0afV0p61F3hPA9q1KgPCS2qPVdrNgAEQDIwMHKCaLrkm5xWr2p9MnQW1VaVds2yt0WgM1dDNafNlu3oLiN5L8SAFe/Mw7IW7Lpqr3C3FiBzTQRdYgERLxnyylZMj8ikIom6pu20heT2HL5b2T8ni/f92Ou/xBwa0v1rCKHT6RDQeQ4GOWyJ6KmEsXkaTVNH9MhAxq5g+I/LEUpP6tC3OMI90CbpyhzGE62JB5YgAlGJ2JVf0yiVHzhmOWiRr2VlALSrZSsgcrS77lcimgj3ooD9GsUwFXAHea5a7yxlQvHBMH4bxQGKGY9gMTa7UcgtN8QT1RbalSlaqhbxk9i9uC3gGZ9Hozs/lzN0YHs8n
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(40470700004)(46966006)(36840700001)(54906003)(82310400005)(52536014)(55016003)(82740400003)(356005)(36860700001)(2906002)(40460700003)(83380400001)(81166007)(86362001)(186003)(41300700001)(5660300002)(47076005)(8936002)(336012)(7696005)(8676002)(70206006)(478600001)(107886003)(6506007)(9686003)(40480700001)(316002)(110136005)(4326008)(26005)(33656002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 02:19:28.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfd1694-7e58-48f2-ea07-08da5b08205d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6436

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v3] public/io: xs_wire: Document that new errors should b=
e
> added at the end
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Some tools (e.g. xenstored) always expect EINVAL to be first in xsd_error=
s.
>=20
> To be conservative, mandate that new errors should be added at the end
> of the array.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

While the change is looking good, just FYI there is an "ERROR" section in
/xen/docs/misc/xenstore.txt that points to the io/xs_wire.h. You may
want to add something there (that depends on your own taste :)) )

With or without above additional documentation:
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> ----
>=20
> Changes in v3:
>     - Mandate that new errors should be added at the end.
>=20
> Changes in v2:
>     - New patch
> ---
>  xen/include/public/io/xs_wire.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/include/public/io/xs_wire.h
> b/xen/include/public/io/xs_wire.h
> index c1ec7c73e3b1..a4d954cb05aa 100644
> --- a/xen/include/public/io/xs_wire.h
> +++ b/xen/include/public/io/xs_wire.h
> @@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
>  __attribute__((unused))
>  #endif
>      =3D {
> +    /* /!\ New errors should be added at the end of the array. */
>      XSD_ERROR(EINVAL),
>      XSD_ERROR(EACCES),
>      XSD_ERROR(EEXIST),
> --
> 2.32.0
>=20


