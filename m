Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4240401896
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 11:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179510.325802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAZ5-0001lO-5d; Mon, 06 Sep 2021 09:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179510.325802; Mon, 06 Sep 2021 09:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAZ5-0001jJ-2a; Mon, 06 Sep 2021 09:05:19 +0000
Received: by outflank-mailman (input) for mailman id 179510;
 Mon, 06 Sep 2021 09:05:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oa8G=N4=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1mNAZ3-0001jD-Oo
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 09:05:17 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ce56666-0ef1-11ec-b09c-12813bfff9fa;
 Mon, 06 Sep 2021 09:05:16 +0000 (UTC)
Received: from PR0P264CA0140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::32)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 09:05:14 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1a:cafe::2f) by PR0P264CA0140.outlook.office365.com
 (2603:10a6:100:1a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 09:05:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 09:05:14 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Mon, 06 Sep 2021 09:05:13 +0000
Received: from 0031496d2023.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06815203-31B7-4BCB-9BBE-677527EA3505.1; 
 Mon, 06 Sep 2021 09:05:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0031496d2023.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Sep 2021 09:05:02 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 by VI1PR0801MB1967.eurprd08.prod.outlook.com (2603:10a6:800:8c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 09:04:59 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06]) by VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06%5]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 09:04:59 +0000
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
X-Inumbo-ID: 8ce56666-0ef1-11ec-b09c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ8S4ENHD1kcr09LTDYDkrm1ZbBEVK9tOxw2UuxhjNg=;
 b=nodtvef8gMM28EzyBM6VGGxJXZP1BnfgoFd/TVEta4MlOcRlez8QafyprKrvs/uL9WiNsKzlpL5+M0uzPV4Q7x1Y/wqSZcbFYKXkXT69EQxeTGQ4k6C2H8ne8nmSmnxlzdHxU0rJtpR1V8Yafz6T7WY8yQxP2G+1zpFBfEp8XfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HN0sKJibKDo/blIlWl85ccwtSKNfa2kuygtgrJmfQiE+T5d1za6aU1y0xzhicF3Rfpvr/IXx3ECjuyGUTwxE0AbUBscj5JZZxyLcCYWzIdy4lBP+Alclixdn0sQ8aKppUhLYkHQPOdJ97ggBoj+HGsrwuUFDDCeqwqQ2UG4qAfrEpjoaswDei4ev//dbf3EY5lHoTO/bJXfGcyihP3xBouu3YBOqfg3dVlUgMWW+5/eCrXJirSNYKqo44RQbW6e4oC/Pe0e/WXb7AEvgbIe5hQVKqXJr//Zzsn7KN4yw8W+Yj7gHdMEaf7SUtBh5ci8BEi671KzD1CyPZZJekTASCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VQ8S4ENHD1kcr09LTDYDkrm1ZbBEVK9tOxw2UuxhjNg=;
 b=jG804fkFsxTqSXfiks5B1hZUOjQRG4tNZx2i5uj5JH4npXwdJvqM/JyjKjZeNVeZB2sbptaMeWT3Jj6BW2MMFc3jzE2Qx2Ov8WH5FDzgw4FNSfzaYP4dD/ERvE5NA8Jy5gviyO7Ysvc5bU5WP3/G3NL0K1Fu3KGgrvxqIhUYQH950xHnEOc1Or64s4muKcw6RMGup7u4OZ9H2ACihOzFb3aFUQoVBdkYn5z7TXm/4mmYw6E6/427DJDcQhK0jNyWD/NNHN1HlpfCUJUh4Ot12+D/Ki84cMmTMD/lTraS62OiMSZ0iVGGqwK5bSlTe7ILF8P8BmuJKaSqTONjSupPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ8S4ENHD1kcr09LTDYDkrm1ZbBEVK9tOxw2UuxhjNg=;
 b=nodtvef8gMM28EzyBM6VGGxJXZP1BnfgoFd/TVEta4MlOcRlez8QafyprKrvs/uL9WiNsKzlpL5+M0uzPV4Q7x1Y/wqSZcbFYKXkXT69EQxeTGQ4k6C2H8ne8nmSmnxlzdHxU0rJtpR1V8Yafz6T7WY8yQxP2G+1zpFBfEp8XfQ=
From: Hongda Deng <Hongda.Deng@arm.com>
To: "julien@xen.org" <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
Subject: About Arm guests accessing to GICD_ICPENR 
Thread-Topic: About Arm guests accessing to GICD_ICPENR 
Thread-Index: Adei/iBluoJQFkGjReWesRkbibwmOA==
Date: Mon, 6 Sep 2021 09:04:59 +0000
Message-ID:
 <VE1PR08MB5677BABDFBBCA24B4ADA9C16E6D29@VE1PR08MB5677.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 026BE3F40A943F45A19D0F3648C58C6C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 644850ed-7d68-47a0-3d83-08d97115706c
x-ms-traffictypediagnostic: VI1PR0801MB1967:|AM0PR08MB5443:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB54431355A200535FE21012F0E6D29@AM0PR08MB5443.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U+JsCEUnT1/WS903E+Wf7RF9MCZRlXBZqeliXiTaLzeNvVqOavKpcd+J1uaAjKIbIhGlZzk5hYncVCqk+rMkumdPcrnalpdlRoSQlRNUPb5z+f9FyiwVxBWCbxV1DNqfpBtPy/wU88fhpEDOMC5atc51UTaFrrgWnU7FRBxWjzkTqKDoAkDB7DJfFTU80NAdC7TU/qlh3d8QGs1YH0oW1yO3x8IXqIg4Pcitt3AEXq4C2r5kr8lGrgoLxi/UjytTERHiVROq+Z+TZz3jP45AuBDh2S/xtrHdaoK2hru/Guy0fhrFoFMYZ8fITjoqO8UkiZu/HBlzHBlazz2mfeupR1Mv4WcVvXmoHzJcSxOdXNmNHlUyButkjP2ggqNjG0mRe5EY8Hwe0jP/TUF8EtVdvIHl9c4TU+vnvIm8GqTRNZdWnxjGTWej3AUVN6BvrHddPcBtcawDBFILzxwpeRbvkzygaraqGakRpGYGOqVEKOS5l/tCts+GoXzH6xjp8pF2maqLYLo0+evURPll75HfaMHPQvlLlsPNgoTnPqrcWoG89/c7tmwxaGPOorI9q2g632IGbXaJScwWuhhGPUbAaZJ5pd2bNrMFl7O8jmz3iR7bajZqKzUPx/i03AcXeFohk98ykvo0zhIuQbjmmQ5ujpFZUkuGWqmLQJDf/Hz7B9vkey7KIi9LWlWVtBg6D8TLN4Q4MHAmNjzD5nnV+9KUg5Ckzvgf7KZluRdCdPM7kJPmm0DzPUOwruZxAmmBd6cgtWJuIivE12K+gCSH1xaSP3+NkuHPolowldy9P8+UM5g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5677.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(54906003)(186003)(4743002)(26005)(38100700002)(966005)(2906002)(66946007)(478600001)(122000001)(55016002)(316002)(33656002)(9686003)(110136005)(76116006)(86362001)(71200400001)(7696005)(52536014)(66476007)(66556008)(66446008)(64756008)(83380400001)(5660300002)(8936002)(6506007)(4326008)(38070700005)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1967
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	abd6a0e2-6da9-4081-2d9c-08d971156796
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jD1RlvswgEv2o5dgHiAatjNNHTOVujMPHlsC1GTpt6ijl83FLYbZ5uFW9HY+J03/eiQjXiejlnJwZwOH1coZ1S3PakGmdiZQiwZK2xlaRp4kEbgjUmO2LW/HFs9m7BeiQ5PYksUnCQbk7PwKxv3we1GS3wFYeiKYUUXrDgGhO8aOfrntNSnz2IES3nOKFNNNKg3vuh42wuR0Qf4zU8H84QUso8dAKBsajA15FucYO5dPL7dTdCO1lsWZZDpGiptWLvtwAA2XmB0T+8rmIVDUV6T5P+0dLXA6P+DRZx9IsGcqIK8KuqoErN7NTsfncpszRmE5w9vBihJm+4MksBlC5spD0bvckRjavX2K/vFl5ClQRWtC5dNUzTvmz0x65iryP4lheF6Hu2OuWTWcVbvc1tcbF4VYWstmX8JkiDSEViQvk+UC5U7QG2DVEHl9d3qUEeL4vmLvG1jTWwPI1uezzpEWPs9QoX1GcRx9FoDPKcoETdquS7ebo6mEbUCrwqyoHc0Rdd0OsxP57LYmEi7cmax4asdvk6gQsRg/P4Wo33J4u9rCDYKLjYV1Sv+xHYm2bAK4P9acHcwLVOFzPjjumTTU35v9B7WJDDYStlN9Z4gbyDPaVkglZPFbCZK1ImBSLcQMnroI+3a0gT0NiE/DwJeDJUNuywkP5yJ6UW8PQb7NPBO1EWZ7UkFZpFMo2icm+VFqP9RGYirGGbdJyZ7cqpEE6sK34B1+t80w1cqVtJZcBbKRLcLh8pp89m5S9dbf9F0GGCLnf8weiJ5p/hTjNk5jJ8ZSdGw/1KPWzMQn79E=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(70206006)(36860700001)(356005)(5660300002)(52536014)(70586007)(966005)(316002)(33656002)(9686003)(478600001)(8676002)(55016002)(82310400003)(8936002)(110136005)(4326008)(54906003)(83380400001)(81166007)(4743002)(47076005)(2906002)(82740400003)(7696005)(336012)(6506007)(186003)(86362001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 09:05:14.2547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 644850ed-7d68-47a0-3d83-08d97115706c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443

Hi Julien,
=20
Xen provides vGIC to support Xen guests, and currently xen will return IO=20
unhandled when guests access GICD ICPENRn registers. This works fine with L=
inux=20
guests, for Linux won't access these registers. But for Zephyr, this mechan=
ism=20
will cause IO dataabort on Zephyr's initialization which makes Zephyr get i=
n=20
fatal error.
=20
One method to ease this is to let vGIC ignore GICD ICPENRn registers access=
. I=20
tested it with Linux guests and Zephyr guests, and both works fine. And I f=
ound=20
in this patch[1] that it would be more complex to touch the read part for=20
I{S,C}PENDR and the write part for ICPENDR, so could we ignore GICD ICPENDR=
n=20
registers access to ease Zephyr's initialization problem?

If Xen wants a complete GICD ICPENDRn emulation to fix it, do you have any=
=20
suggestions?

[1] https://www.mail-archive.com/search?l=3Dxen-devel@lists.xenproject.org&=
q=3D
subject:%22Re%5C%3A+%5C%5BPATCH+for%5C-4.15%5C%5D+xen%5C%2Fvgic%5C%3A
+Implement+write+to+ISPENDR+in+vGICv%5C%7B2%2C+3%5C%7D%22&o=3Dnewest&f=3D1

Cheers
Hongda

