Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420272B95D4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30912.61120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflZy-0008Qb-6B; Thu, 19 Nov 2020 15:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30912.61120; Thu, 19 Nov 2020 15:10:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflZy-0008QC-2U; Thu, 19 Nov 2020 15:10:34 +0000
Received: by outflank-mailman (input) for mailman id 30912;
 Thu, 19 Nov 2020 15:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kflZw-0008Q7-Ac
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:10:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a941b7d-7312-470b-b0d7-fb74401d5f50;
 Thu, 19 Nov 2020 15:10:30 +0000 (UTC)
Received: from AM5PR0101CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::38) by DB6PR0802MB2246.eurprd08.prod.outlook.com
 (2603:10a6:4:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 15:10:26 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::7c) by AM5PR0101CA0025.outlook.office365.com
 (2603:10a6:206:16::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:10:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:10:26 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71");
 Thu, 19 Nov 2020 15:10:26 +0000
Received: from bb547bcae3cd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04C75796-C140-4D5C-8C0B-68643381074E.1; 
 Thu, 19 Nov 2020 15:10:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb547bcae3cd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 15:10:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6252.eurprd08.prod.outlook.com (2603:10a6:10:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 15:10:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kflZw-0008Q7-Ac
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:10:32 +0000
X-Inumbo-ID: 0a941b7d-7312-470b-b0d7-fb74401d5f50
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe1e::615])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0a941b7d-7312-470b-b0d7-fb74401d5f50;
	Thu, 19 Nov 2020 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J8a5oaJM5LVFh5vHYCpAF5nJfxQRghTjNqBKLyX6TA=;
 b=64LgAEPO8OjyAsrs3lPwME9perpROa4sGZa6K1ZoSVJ81unTA9Ckh2U4hMUGBBwAKlEx7mrTRA4SBVuOCJEVQF++fzHr8Mivu6RfFXSqxtF4iXiq1sc2hfDZIoNgTRIaYJAS0B3MlPlHS3hkP5XpmYOwsAOdwCzAZyV3ynp2vTg=
Received: from AM5PR0101CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::38) by DB6PR0802MB2246.eurprd08.prod.outlook.com
 (2603:10a6:4:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 15:10:26 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::7c) by AM5PR0101CA0025.outlook.office365.com
 (2603:10a6:206:16::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:10:26 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Thu, 19 Nov 2020 15:10:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d913629fb79f12ad
X-CR-MTA-TID: 64aa7808
Received: from bb547bcae3cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 04C75796-C140-4D5C-8C0B-68643381074E.1;
	Thu, 19 Nov 2020 15:10:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb547bcae3cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 15:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzQM23IjjRCSK7eRz69vQMiFBIGN/8mO9aBb9XGl6a4rdk1bbkpovEzoXxiM4zAxQlcUmhbR7BuU0jR7qtoiGA5BLRC2IAuM1X2ehBUdZ7RIcqR26Kr0HoQNVFiYCFLwYNW4TJOaMuX4HilhmeR/vsLHu87jkGhrYTb8Pxvbp7r7LPwr5uJQEyGBs9ZwKD1UDivv/5LCjGSl5Ux7pnf2PDDM80CRLhIsAxVwHP7SLj6MNiuHbpJDGjJezM89GOmqYlEdXefT7QDn/bOIeYZJF4UyhezYhknq2oCTFnLLfVceyqSFieurINAj/mZmmEsP9+oQry78zKnCxrq2i11kdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J8a5oaJM5LVFh5vHYCpAF5nJfxQRghTjNqBKLyX6TA=;
 b=SIB1Uq+ayKSyC8ZkjDZ2CbgRHJvk4cGazwPkjglXUZ0iVXWYqSwjLUZ3FGLZbyHsZsfkFSgnxp61/r7veUGdZ3f155CmSGNbgm5UXe9e8NX2BB9cynmjBA6iqfuqt6T7L2vLTb4ln5sxVHHk2ZlkmD77xJas+B1R06CeP368u65S/1lhRx2BY/TA28VQwgHzExyzSHdmIgpiUEJEWP72ERFBSxgDWytPaNrcfgBOc/27BFuEq7l+pF+14v0Lc2yYBOB7QVIaeSlop4xsdCIRpbyd5D2anoVM7WjauBBb9X3U7KzA20+pxfzSieb4jXbvgf0+ijlH84R4SZBOpMji9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J8a5oaJM5LVFh5vHYCpAF5nJfxQRghTjNqBKLyX6TA=;
 b=64LgAEPO8OjyAsrs3lPwME9perpROa4sGZa6K1ZoSVJ81unTA9Ckh2U4hMUGBBwAKlEx7mrTRA4SBVuOCJEVQF++fzHr8Mivu6RfFXSqxtF4iXiq1sc2hfDZIoNgTRIaYJAS0B3MlPlHS3hkP5XpmYOwsAOdwCzAZyV3ynp2vTg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6252.eurprd08.prod.outlook.com (2603:10a6:10:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 15:10:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:10:07 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/irq: Propagate the error from init_one_desc_irq() in
 init_irq_data()
Thread-Topic: [PATCH] xen/irq: Propagate the error from init_one_desc_irq() in
 init_irq_data()
Thread-Index: AQHWvoP9L+A4RJEKVEq9qJlQ3XFKdanPjxgA
Date: Thu, 19 Nov 2020 15:10:07 +0000
Message-ID: <ACB17DDA-2E25-4135-834B-B6EA3C146FE6@arm.com>
References: <20201119145434.28065-1-julien@xen.org>
In-Reply-To: <20201119145434.28065-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c902682a-3ada-45d1-63b8-08d88c9d3eca
x-ms-traffictypediagnostic: DBBPR08MB6252:|DB6PR0802MB2246:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2246CACC05A7C084C8D9F3309DE00@DB6PR0802MB2246.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zad9KVk6aSsuqmY7M3366I0dE9AXa7RT5Kq2AEDMQtjbqANNFUopHTGadKmAUo9TRdi7SLywbaJCdteGit4l0OtNQQRrXinbPsk48ys2SWF/FTFVciLlPlVaNK0B9MbVdcgsHN8DlqjY/GMMFYe1VvPGeG4UGfGgBmuY1zkphTAYPAMwQMeuar13vPPotf/6/nOm+ct94BzFL6abmtuMJztB8Fh1ZPZ9kB37jR5ZYC/ZOommOXKHd4ZmXm+q7nJ16h/vH8vMo7CiE0oI7nGfSpMfNa35yWYslS/ruyVTP65+MXF/SwxDS6pTwMNIY2gFwPGemqx1U75ikDfU+SlsxQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(66946007)(2906002)(64756008)(53546011)(2616005)(66476007)(66556008)(83380400001)(6506007)(91956017)(4326008)(76116006)(36756003)(66446008)(54906003)(316002)(478600001)(8676002)(26005)(8936002)(86362001)(6486002)(186003)(5660300002)(33656002)(6916009)(6512007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 voKJuLw2AWVkL1Lg60kNnzJpYTUZy4/S0x1QRhVAEXB55DtXUwzdKUAzHCBfQHS11rosiDOtoakyW6ud1uJIgLCZ9bOXcGAU6iKvhOd6+JPfwhlb2xt8Ret0P8WBZVg/F205ohXHpDnT6e9q3c/pJN6CEESRZUWOPzz7pB+lZw8i4jcf1AcHbWGvZ2EUTEuDuUbgkj9OpqRSkokYVQjLa5hyOm52LzqXazD2IuiRERGYC/vRAoWXcnBLxy4t2by8Mjq4JyLjQEk+LiR3YJR9OO77Vd774E4OxC9T7azodoyA7LtWg4qvAd2cOQRVfST+jG31XXM++IeJgAZb68o168skIUA7ILQgxC9rakk9WtRveEvGidPF3SzwmsnFM+5l8HcOo35bLPViB7otI0gt97zR6qoZWXjUa9Ac/ELTe4FwJJdNwzAvLD74nkvovYgvsxgyGm2MaDFLkVAds51zdXMXyHdvWnriHvhwpxeTgNuP2XqsWyw3Re8S4vA1DSgdZeBduUP8BQTjVhTuc4Zx3FpUH7l5m/C2EuzdKfSzFMTrCzTCdk0n60RA0sDtkTxT40e1C+hYQrUywPcSF8r5NS47buqpIoD8ukAi5Hl3NcUEEyarcLQfxmMo/ncxH56i0LUbmoz5qRmUNwykcmB4Qg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3CFF19CC83252646AE0686B89F14AEC1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6252
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6899d2c-3a81-4c88-d8bc-08d88c9d334d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cKv17o7M1RRpgy7prnL3US0ZEhhwvtHe3jN8KJ7WD/CG48RGrjJ0zQdlSnyouwISWRgqrII91AGd1t0J422I5TbNYZAA4unrXiZXL2VijRReR1e/vvN0K6hfLeyI/speaebNzkhE3xJkQof7MLi2tKPmkDIIO/M+gum+pSXYA4RR3//OQ6MXGFUV7lFQKNxguYeUjk3l8Iyt807tqDlbj3CRAfPq0ESl0jw9Wa+OT2Pv3blXO1kxUEfZuzZNKhYVG1LRwQmXuLolsRbuBGur2JBF187BYL43oP0gY7wMlyieltATMVtwy882AYBgQeQ3DBZb2I0njsGkfS+8ZY7cdoWghS0IHDNr5DLmSIkUyTlQhsj3VjKy9wjnWonb8EsvjNcarRPd5nadVH7yvDYIzA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(46966005)(356005)(47076004)(4326008)(36756003)(83380400001)(6512007)(5660300002)(186003)(478600001)(6486002)(2906002)(26005)(6506007)(53546011)(86362001)(336012)(70586007)(70206006)(6862004)(81166007)(82740400003)(8676002)(82310400003)(316002)(2616005)(54906003)(8936002)(33656002)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 15:10:26.3590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c902682a-3ada-45d1-63b8-08d88c9d3eca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2246

Hi,

> On 19 Nov 2020, at 14:54, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> init_one_desc_irq() can return an error if it is unable to allocate
> memory. While this is unlikely to happen during boot (called from
> init_irq_data()), it is better to harden the code by propagting the
> return value.
>=20
> Spotted by coverity.
>=20
> CID: 106529
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/arch/arm/irq.c | 7 ++++++-
> xen/arch/x86/irq.c | 7 ++++++-
> 2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 3877657a5277..279d221a2b85 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -88,7 +88,12 @@ static int __init init_irq_data(void)
>     for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
>     {
>         struct irq_desc *desc =3D irq_to_desc(irq);
> -        init_one_irq_desc(desc);
> +        int rc;
> +
> +        rc =3D init_one_irq_desc(desc);
> +        if ( rc )
> +            return rc;
> +
>         desc->irq =3D irq;
>         desc->action  =3D NULL;
>     }
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 45966947919e..3ebd684415ac 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -428,9 +428,14 @@ int __init init_irq_data(void)
>=20
>     for ( irq =3D 0; irq < nr_irqs_gsi; irq++ )
>     {
> +        int rc;
> +
>         desc =3D irq_to_desc(irq);
>         desc->irq =3D irq;
> -        init_one_irq_desc(desc);
> +
> +        rc =3D init_one_irq_desc(desc);
> +        if ( rc )
> +            return rc;
>     }
>     for ( ; irq < nr_irqs; irq++ )
>         irq_to_desc(irq)->irq =3D irq;
> --=20
> 2.17.1
>=20
>=20


