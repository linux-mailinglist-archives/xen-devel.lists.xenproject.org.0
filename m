Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB5736A8F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551667.861293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZGY-0000kO-Jj; Tue, 20 Jun 2023 11:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551667.861293; Tue, 20 Jun 2023 11:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZGY-0000iG-Gv; Tue, 20 Jun 2023 11:11:18 +0000
Received: by outflank-mailman (input) for mailman id 551667;
 Tue, 20 Jun 2023 11:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2irc=CI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBZGX-0000iA-04
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:11:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b25ab4e-0f5b-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 13:11:14 +0200 (CEST)
Received: from DU2PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:10:28d::19)
 by AS8PR08MB7719.eurprd08.prod.outlook.com (2603:10a6:20b:524::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 11:11:12 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::2d) by DU2PR04CA0194.outlook.office365.com
 (2603:10a6:10:28d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 11:11:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 11:11:10 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Tue, 20 Jun 2023 11:11:10 +0000
Received: from 906226a6946b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99332828-B569-4D7C-8B87-F414D483E04F.1; 
 Tue, 20 Jun 2023 11:10:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 906226a6946b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 11:10:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5429.eurprd08.prod.outlook.com (2603:10a6:20b:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 11:10:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 11:10:57 +0000
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
X-Inumbo-ID: 2b25ab4e-0f5b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxI3ahc9f6N1b1z/2T3j1kAQUzLL0OmOAOwewfY/PVw=;
 b=JVmneOBG3DcAY1iIu2M+IehGVfWGxR520FFDB4XxKGi5LChbiKhbSu53K5k8A4ovmDh5RGpvnhOyfvkyzQ3yQBzglCk6oIx4iladldWodWpkh45Xxy/PSpRq+NSDvk+aTWBqbsVuzugisKtsWlOGWS07bkd+jomQN4+MQi1aWLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d92611e5bd06db46
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQR5c0EUy8aaJP5RxA9Ex7yx0t0F3BYiND6djq47lW1TywUALlBXn6koauj27FsWtfegihaRIG4SpfdPBiWfBri8Rfu5HPeRM8qIP4IoCFUJ+jQOug8YC/hhvb549kj+qFQpuNBe0fLSbcEmDAU8gz63tOozlVPuBvcrNasXbxAHgQTeqsVUyWa7C9tUO3Q/hEhLL6T7ZNJeT+8agrspbLBdHppV580T5QM+7DoQMZ9nLclL0NiewEsMZxQQAqEqNk15CfLojjd4WUdR52gVcI8CDb96xwN2OmOJpXAOqDfPYNWj0an/7YHyLlHQbTzlGTjWw35bkwswJ0VoMDhe0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxI3ahc9f6N1b1z/2T3j1kAQUzLL0OmOAOwewfY/PVw=;
 b=AbWsqJM6hKIlQZt5tuGINxnNc//uvBJvBXe21UjP4RaRrR/YzK6h8w3dORm4NXr7O1a2fbu/58yqVYxUYbdz3mLyAs9s1p8SJaqfIitzC2OWF8gZlKUvhBaEa5QksGFEbCgLAbPphbpE5YJPpFaj71spCtlTuXs2ttjdjUrurv8Fx2SlTHpxhZUJI/jWoafFCwsfWIbFL72PQwg59LSp1CvsRM+yi1+AY4RpGMN81Ppb+ThnLVlIMY3IWv+mY9r/9MzeGmSkLjeX4yAs8jQ/+gUMi2q0dBWwqUfZe111eBmwlkEnpMNeMMpuwgIc9KxXHsZ07CBJEVGSAlW9IKEV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxI3ahc9f6N1b1z/2T3j1kAQUzLL0OmOAOwewfY/PVw=;
 b=JVmneOBG3DcAY1iIu2M+IehGVfWGxR520FFDB4XxKGi5LChbiKhbSu53K5k8A4ovmDh5RGpvnhOyfvkyzQ3yQBzglCk6oIx4iladldWodWpkh45Xxy/PSpRq+NSDvk+aTWBqbsVuzugisKtsWlOGWS07bkd+jomQN4+MQi1aWLA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
Thread-Topic: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
Thread-Index: AQHZos+4j3GmbsysAEGR9uy2Puvqtq+TihkA
Date: Tue, 20 Jun 2023 11:10:57 +0000
Message-ID: <AE0D190A-CC77-491F-9C78-0C0F432BCB39@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-2-julien@xen.org>
In-Reply-To: <20230619170115.81398-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5429:EE_|DBAEUR03FT013:EE_|AS8PR08MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: bc05702c-5bbc-4d0f-4266-08db717f0dc5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yzhfcKcH4B1L/hhhQvziXPe0sgHAIgHX3GwVH43WHLx/jk48xmxMv57oznmZ6dVEGfQKK+8zFlCGksk+Ys+dqMQw0ZG/doqBwJUfgR7NJhtqzNCBhJS75+KVpbWMhiAqWBarlxsgSU9TJVUt94grskgAlED9hk3taJwDUHLT0nYxY8wep/bJg1NwiOTGuif4uKJhKEOXhiiky1mQqP5OZlhkVaM38AB5o1LXzD9Xd99doEWSs7JKiKRWdPhdMbjaDNxs9GvuRkxdmq2ItlFgntrT49JbsYwKjs4tmU3mUweBiIgevlYxt8yGRTF02f2nOovNTWWO2FMjuro23F0hkzX9Sg0MQJa+G8+3Ei9D3x9ZfsU9JyJYv96UGvncIdRJxEsjUR4FsBEngsyr1DjoHLOF7GHR4moSP1rIfyHI4ZYJ3Zel1fQs7b9oxXT6ShUvXMKvEfxsVNYJATj8h4igYVxuDiKdrmaiFNURN94nJbVm5weUMA7f10wjur5ZWKItD2/gBcI6y8bsNPAFfXgfK1bqcOfhC4j1GfVXtwAg+ujeXxWd3rWRNlKG82ukRdLhfyHxnO6tlDtrnjNtmJEDK56rId1yq7bl9gA8lcoPfpkSVGLtmBJ1oYoJr+oXQaX5X+8NLJqQzYStPcULOn9Skg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(8936002)(41300700001)(8676002)(478600001)(38100700002)(122000001)(71200400001)(2616005)(83380400001)(6512007)(26005)(186003)(6506007)(53546011)(6486002)(54906003)(38070700005)(86362001)(36756003)(316002)(4326008)(91956017)(33656002)(64756008)(66556008)(66476007)(66946007)(6916009)(76116006)(66446008)(4744005)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <353F1607D144CE439570566F1CBB8666@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5429
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a89cb615-dea4-4b6d-7abf-08db717f0596
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DfWKRfg0eeIQGQgeg1ErpWBen+8Vo6JBdsQ7jAW165SACIWCDnjWgR4Q8bIS9HY6SZ5C4vpZytQliv/f+fHX+cYBYavs/acQEZs9o3sezUzb3HIvtV+VUZZLTc0pSnOGLePdaER6mAt0tZ7wAl+RBn6KmjjrfgreeEQUlJoUy7QRVpVj2DhcGWa3DklWZWGXH62GYo/jzWo7zjFTv8R5JSWqL0gr4V4s64R9oVRUHhyeZ5PM+pnqW1QQ172DuQAyi/csXNe62SCR0lQwIcil+isv7B2yXBoyx3f4IUHKIe0WBalUodVkbJv3Scjqe8TnirYBq6yrSLiXMhLEwxZKfdRr/JyT3WxDrxnobmTyO2ZkfEcV8ifZj6oFxyv1ac/XyXmfmgEcmgaSw0riTYTpqNHpC5t5kD1rKU7+UzjMZYkMF40H8wjIUHt6xFsJPzCE/oTIVF3iGDySO9bM5oGemWzD0FV6VEOrxq0muwwuP94hveIbsMRvK6AzmBekeU1oqklogR+u9gyrDQFgtyWc7uqyCGW/vtytoUTt0I56nlhN30iCRTfbBlySiG4CojZNg9VUR33Hz6seG7nQw5UV5x/eD01vjlfb04zDVbazNZIcIde21YiAbykJQctnFARsHPmA9yZSL/l+FJAdvhaOZ5Xl2ODwfvZhYcFsYAMcSo6RCIDNIp6Gxqes+4QvIR3DCyvTSvBJRVHp2BMY6zhr8OnstTrvDO+9QYLzqdz8plhBONC63kRg5cGp+VVwpmpB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(6862004)(5660300002)(40480700001)(86362001)(36860700001)(2616005)(8676002)(40460700003)(8936002)(26005)(6506007)(54906003)(6512007)(107886003)(186003)(6486002)(33656002)(53546011)(4744005)(478600001)(2906002)(81166007)(356005)(82740400003)(83380400001)(47076005)(336012)(316002)(4326008)(70206006)(70586007)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:11:10.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc05702c-5bbc-4d0f-4266-08db717f0dc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7719



> On 19 Jun 2023, at 18:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm (ARM DDI 0406C.d A3.8.3):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
>=20
> Fixes: e79999e587d7 ("xen/arm32: head: Remove 1:1 mapping as soon as it i=
s not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---

Hi Julien,

Yeah makes sense!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


