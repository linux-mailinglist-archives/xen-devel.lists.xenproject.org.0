Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF127EDD87
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 10:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634056.989302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3YZ2-0006Ac-R3; Thu, 16 Nov 2023 09:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634056.989302; Thu, 16 Nov 2023 09:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3YZ2-00068k-OH; Thu, 16 Nov 2023 09:21:32 +0000
Received: by outflank-mailman (input) for mailman id 634056;
 Thu, 16 Nov 2023 09:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWOo=G5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r3YZ0-00068e-TL
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 09:21:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84dda18c-8461-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 10:21:27 +0100 (CET)
Received: from AS9PR05CA0191.eurprd05.prod.outlook.com (2603:10a6:20b:495::16)
 by GV2PR08MB9301.eurprd08.prod.outlook.com (2603:10a6:150:d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 09:21:17 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:495:cafe::fe) by AS9PR05CA0191.outlook.office365.com
 (2603:10a6:20b:495::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19 via Frontend
 Transport; Thu, 16 Nov 2023 09:21:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 09:21:17 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Thu, 16 Nov 2023 09:21:16 +0000
Received: from 02819f935b83.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3EDB2469-2B6B-44FA-AAEF-B0B9EDB351CE.1; 
 Thu, 16 Nov 2023 09:21:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02819f935b83.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Nov 2023 09:21:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7784.eurprd08.prod.outlook.com (2603:10a6:20b:518::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 09:21:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 09:21:08 +0000
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
X-Inumbo-ID: 84dda18c-8461-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MiCBvJzah2hHS30wM5IvHQkk8gOLzkukp5BteFwetkuFa0gkW7Lh+vx+4FB+N/RlYDXvK+hBryVlVEKrvHTnZIdwIVU/O3dImrc1Q0Q+aNNUr6e/OJCViFlxAlowHIz93HE/UXry4OiSAgvcAoX8uhVzXr2JqF4613J5nDuVCyVctV5uL0piI/04mxXisA3SxxhnLs540lwjUaO7LUl5IKSGHrysvVIvu0MdJVePV8cX0+cjCvPOTa2lTx51qqRGnmZL7IPYUgmVLHgu8VS+8ufr9S3qhP18eqv4AvqwNjQ5kJiXuSIi2wK3dJqQydeaE8QLH5soRldUlGpl7k9Oaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCVVNhYbj3P0eqMRkUkF6laZVw7szRLdWrulqDUK3XU=;
 b=aYIgQbCLpQXc4ie8cmH9gWkuChlNcROo4dZ9KUYFz5bycdvj5yJ8Vzu94Juhos8Q8rpabBEStpNRpok9dfUvWYWiOaOiW3vyQWxG3MD1nsjQdJqb2m8nPz08AgvTW+KhdBKK2QnnpduKZRqHNe8jo1FH80U9d0ytZiBHQSNpm3GiYak3uateASN2KvqhOT2oQsbb8TZna+TcXOjlD93fPOR5CGJ5A57DqrDE4Sq2uabZb+d1PugarUPyJ8R8GjDRo6+5uycYVxLVlPB+Pgoi60D3tfIeDH3jKxsCThlDDyYcOi/8EXb2XDf2f2HO/UESvuoR6Y6IZ42Wzgj7Knf5sQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCVVNhYbj3P0eqMRkUkF6laZVw7szRLdWrulqDUK3XU=;
 b=nK+TOqBcmzfSfEx8bhOcqxrmXbu08u8MYnRDUE/zlppaihPvZ5tHIBNg11G/huCjTBu/+dR/KqQxDxZWhJB3VN4Cf7BJfCrTyBH81aF+mu9MbZcPRqOGUlk+lK93buy9Hhf3VLebJ6OLQDgSupMDXw/g1Pk4xk51J0rGeFCaeWE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5d47dc03d13e49e6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDPPLew0kRyNNAxcdQ/tkczSIT8tOKGKoJzNsdSxrFjYJSxRFv9vaF2XUnMijUdPIk10nuNlduwYxY4VM0V1qVLFZu8BmkOLmQI8red9eVfUSln6co2Bd/biWhWIJFNIuntC5E6qlqMC4njmVcnhhMHGOVInQF/z0wtxwRNZRckoUkAhjjbJhlMYK5PBLflHYjrG7ZuOtFsPZi99NzTVv8jqZsnJzY+iXYifCHe++v3Z+BYrffMIHTPpfUex6Y6P4bjMzEc0wUj3r4qMKhJmW0qoVxiu1xGHQlKQxM1ngCHKYWPheA6NxpwwCj/SERlQyGnysdHb+89NPzAm36y38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCVVNhYbj3P0eqMRkUkF6laZVw7szRLdWrulqDUK3XU=;
 b=CNX7I+vBZOfNC/7sJw42smUf+B6+yfLy15bZ5UQTSRf0aJJukKRhNEIrUP42m5IcA1DqccX5aokiboDYSL4+cXv/ndJY/+pVTLxr1iW+E2LbZOVV+ekj0gnJEh5hBuB7vMXykAfY7RJ989EC+Qy5dHN/1Nv/yFu0E9njhx53yVllya+nj4KaVQRsG3Gexxz1oa6nBXH4FBChp2b21XbO+yQOJ4Z9O15Dz2BF7NK4V4FI8X7lEdScxFdhfbKEDsvLWFWBV09TiOxNS/U9ja2N4KdgqBWLlzTDLRNW+3lyEailLvg+ShFiX5cnqH4vmQj4hUJhzwNF8fDXGTwKI0eohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCVVNhYbj3P0eqMRkUkF6laZVw7szRLdWrulqDUK3XU=;
 b=nK+TOqBcmzfSfEx8bhOcqxrmXbu08u8MYnRDUE/zlppaihPvZ5tHIBNg11G/huCjTBu/+dR/KqQxDxZWhJB3VN4Cf7BJfCrTyBH81aF+mu9MbZcPRqOGUlk+lK93buy9Hhf3VLebJ6OLQDgSupMDXw/g1Pk4xk51J0rGeFCaeWE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Olaf Hering <olaf@aepfle.de>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>, "jgross@suse.com" <jgross@suse.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Divin Raj <Divin.Raj@arm.com>
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
Thread-Topic: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable
 through 'xl.conf'
Thread-Index: AQHaF9iCIgQpf/CCX0GxQ3sKvdu3o7B7oUIAgADw2oCAAAMCgIAAF5eA
Date: Thu, 16 Nov 2023 09:21:06 +0000
Message-ID: <A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
 <20231115182340.505df6c3.olaf@aepfle.de>
 <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
 <20231116085629.40a0445b.olaf@aepfle.de>
In-Reply-To: <20231116085629.40a0445b.olaf@aepfle.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7784:EE_|AM2PEPF0001C70B:EE_|GV2PR08MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bfd8ff-7273-473e-414e-08dbe6856331
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bFIuDuNLsEjmsrZ6GLO961YXI7mSTVLmMBY6D6es7fCk+13yRIubo2PhkSkYdGWcIHS6Yhum9witpJ2zUMtbjUDNZYnHdKObfIBJa5HhCmt0uQGSTH5CMPEmNgup5lCrd2G7sdQw3zJItIceUVYC8nonhG6A3Y81ynUVvHW1QedFZf0WC6SJnJa8kB/FVlJYmvr2IXU1UXFPjzTqivxHNGQxE83MqS55+daBuIaTNQ/OdyuhkUFapiIWAlu59NVfd8zdm3Gd1fCRM/GxL2eRNPyWK8Lu5pKo36rhOLyecDcJs9Xd7a9Sbev03xof5zyIO/eu+jM79fldftWVQ9RkOLNi7hyZQ3iWur2TCcJSrL6iHxEqCMp7carZq0ApvhimZM/BJ4E6X+kDBKmrL7JRcUQMorBAfSjbPWrcB/yCpGEPreJMr374iqeMnQ1C51I6ItKr6SSN2N7ngAjAj4RR7NTib+x/tXK/ZNPLVF/EKpmzGG7rVCyCdhsdgbyWlwSfq0Tgr4vObHj5DyI551KmIOcnRX9Hn0IoJUUQ4y0pADPRIdK1C2Dtgmu30hQsnSAv0S3718jCerETiesxZfvFEtuTHwJjj45HqRsl+llcScf60tgjuDIsYYs1ft8fWmEnxquCwxMn1XYioXvcL2xm+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(64756008)(66446008)(76116006)(66556008)(66476007)(66946007)(5660300002)(2616005)(71200400001)(54906003)(86362001)(91956017)(122000001)(478600001)(4744005)(8936002)(8676002)(38100700002)(4326008)(316002)(6916009)(36756003)(2906002)(6486002)(41300700001)(26005)(33656002)(6512007)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8986830F394BD343A093E75F6ADED0DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7784
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9a7e47f-ab48-4122-0869-08dbe6855c9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9CnWb2K1KWLmJkVuE51Gdn8s6QxFDPII9d3IFhSKbagI8woLpGpMh0GZqM9A3rQdgeadl5d6bOWb1O1+E/Bulby0L+rlzMWIAgetNJrNyKeKGApeI/YUTjXHA3S5jRHDjGRog5W/QYqg5UwIb5D06QgX9KODbVzs45hbCkanHMb6Mg1/ydSjiCuX9sZfW+ksT6nWvDqb4OgExzUlfsbWztrcuUqZvtavpRPvBd6/tXfnlgoMGE2zA7HIj0vleXgDqURqdcCwuP23YGUnKE6L3Clk5tOjiVMLAVXsMK4SG456kALI4+BBaic3zJadYFp9M5SkotHCfbp/DQpSY9vkK8bSEHOY+djTixLPazMfGiO7mmYwWCvDqlU1lGvnm3KTwMfmfnsvBstgf/VJ+Hb5KWn8URyd25F6MaZRMQAyJSoJQkw/Rk7XIg9hS5Wm5V4pAK4t1x0ZXUtbg2Nk67w4fRgAPrPC65tElCoQbehijHZ3keWu6ChLxJtioMTLj9jHf2nDL4R1HwWNN1ywK2ahPRW9KiS7YuZ1JUW73pM1YtF+yCaHHiQgtDrtwISTxOHJNceSVuZz5ow3ZP1qFMemPQu4trekpAJxKqbGnQ73rpco3coTiHoBcxmkwe39iXfHaT+nWkZ87MwPPrs513Wx6PaHhcEWS+9yqqGMrkk7eMV5DCo5DFwVBd2aMCDv4Gfr7/Y8eq0ORLQduFWOq2x76ueWkQlLWv7RrPuvlFyMaLo64Sbz391v+OGYlCqmq90f
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(1800799009)(82310400011)(64100799003)(451199024)(186009)(36840700001)(46966006)(40470700004)(6862004)(8676002)(8936002)(40480700001)(41300700001)(40460700003)(4744005)(5660300002)(2906002)(316002)(6486002)(4326008)(36860700001)(33656002)(54906003)(36756003)(86362001)(70206006)(53546011)(47076005)(6506007)(336012)(70586007)(81166007)(82740400003)(6512007)(26005)(2616005)(356005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 09:21:17.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bfd8ff-7273-473e-414e-08dbe6856331
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9301

DQoNCj4gT24gMTYgTm92IDIwMjMsIGF0IDA3OjU2LCBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUu
ZGU+IHdyb3RlOg0KPiANCj4gVGh1LCAxNiBOb3YgMjAyMyAwODo0NTo0MyArMDEwMCBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Og0KPiANCj4+IERpZCB5b3UgZXZlciBzdWJtaXQgaXQ/
DQo+IA0KPiBMaWtlbHkgbm90Lg0KPiANCj4gSSB0aGluayB0aGUgYXBwcm9hY2ggdG8gdXNlIGEg
eGVuc3RvcmUgZW50cnkgd2FzIHVzZWQgdG8gYXZvaWQNCj4gQUJJIGluY29tcGF0aWJpbGl0aWVz
IGR1ZSB0byBjaGFuZ2VkIC5pZGwgZmlsZXMuDQo+IA0KPiBJbiBjYXNlIGFueW9uZSByZWFsbHkg
d2FudHMgdXAgdXBzdHJlYW0gc3VjaCBjaGFuZ2UsIGEgZ2xvYmFsDQo+IHBlci1kZXZpY2UgdGlt
ZW91dCBzaG91bGQgbm90IGdvIGludG8geGwuY29uZiwgdG8gbWFrZSBzdXJlDQo+IGRvbVVzIG1h
bmFnZWQgYnkgbGlidmlydCBjYW4gYWxzbyBiZSB0dW5lZC4NCg0KSGkgT2xhZiwNCg0KSSBzZWUg
eW91ciBwYXRjaCBpcyBoYW5kbGluZyB0aGlzIGlzc3VlIGJ1dCBtYXliZSB3YXMgbm90IG1lYW50
IHRvIGJlIHVwc3RyZWFtZWQsDQpzbyBJIHdvdWxkIGxpa2UgdG8gYXNrIGlmIHlvdSBhcmUgd2ls
bGluZyB0byBtYWtlIGl0IHVwc3RyZWFtLWFibGUgb3IgaWYgaXTigJlzIG5vdCBwbGFubmVkDQp0
byBkbyBzby4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg0K

