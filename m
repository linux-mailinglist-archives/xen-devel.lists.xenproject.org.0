Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52579566C19
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361065.590408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hO8-0004a9-S1; Tue, 05 Jul 2022 12:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361065.590408; Tue, 05 Jul 2022 12:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hO8-0004Y4-Ns; Tue, 05 Jul 2022 12:10:44 +0000
Received: by outflank-mailman (input) for mailman id 361065;
 Tue, 05 Jul 2022 12:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8hKt-0003wr-HR
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:07:23 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 064e8da6-fc5b-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:07:22 +0200 (CEST)
Received: from DB8PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:10:100::33)
 by DB6PR0802MB2150.eurprd08.prod.outlook.com (2603:10a6:4:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Tue, 5 Jul
 2022 12:07:19 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::bd) by DB8PR06CA0020.outlook.office365.com
 (2603:10a6:10:100::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Tue, 5 Jul 2022 12:07:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 12:07:19 +0000
Received: ("Tessian outbound ef501234d194:v121");
 Tue, 05 Jul 2022 12:07:19 +0000
Received: from cd99d427b84e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B63FC358-BF4E-4A4D-B7B7-F3D4F520C0D9.1; 
 Tue, 05 Jul 2022 12:07:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd99d427b84e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 12:07:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2423.eurprd08.prod.outlook.com (2603:10a6:4:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 12:07:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 12:07:05 +0000
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
X-Inumbo-ID: 064e8da6-fc5b-11ec-a8e4-439420d8e422
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lTijokD91UPpGP/z9rxyYJvu2+FEsOu9AsUwSs8gupdX/FajA+91F0NpFEIF2+a2D/Kd6JBgEnfPKH8dBOBYNkCbn/A0tui4IDEyJWVmr51fMucB3Bq4D7Y8pyUQO8FH4Y04ehN3i1Tk2oquu67Y8l0aHLQlUKl3cnmFtG1Dl9fDdBRSR8WADWmOPwsUyGtxDHVGuOfm3e25rzd89Ce/Kzfm2slKmmJdfER22ftiwiDEANKhVU0wCGakTDlTtxv36NNL9sWEoAObbbA2ey2rRJlNqwOxHTZ4kqrjOlWWtwyZebzd6Om3Yn5Ggx4PWH1PuiLScwlBSjDWGEFfm1PSWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJAiatbeIknsUIbYDqTpSK9a+9TNf6F3bojQhB2LLfE=;
 b=N0yrjAS+ADTaNyyPQkeJgJD0fhwOms3nO80Rw6bkuOpa8O2elyMfjtenI4XtDV2dJtUP/YJs3vqbv/G9fNCwl0F8e+dCuE/IByLnWdRH7gi72QmWKo/hnKFpDw7t972lRcq8cbTsMgReV+x49GjvgZXBNphSvQnYzKIRKL+A4zd4awMZjuNAVUZ/OnGiPsJvVBcIuD3urauLqD1ereasVPj9hPsXjQpzpB5MK4UL/o4ZM6e1JaEjAk3i6EKmUnB3VMNjyUyxZkitPtyd+vpJa+F2fyN2jygrcdXQyU0hNNuE/OPXAP4o8MfshMEen1HOyQQiwYrYXXY70Gq3+JYfoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJAiatbeIknsUIbYDqTpSK9a+9TNf6F3bojQhB2LLfE=;
 b=VMdOTBNMmK2RHhPf5eDHkMYGgOdzIjDXvoLcR7ZOGIWQbd73Cn3RkxbeMagjUVlMX+nxedZsklx9wQF+mp/SzsaJAydm0c5I2G4UHRvC3qjnnpqBLneI7uVej+JmOLMERYaH26euYRvvoysHVI5+yWx5vfE8MqUf+yyfOyadQCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06446c525ddfd82f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHrIUDJOMDL+e9n71/DzpVHMRZH8dfVnlfF+WSznK8TP5nFqLtWiPyi8RlzWF/cZ92Ksn0MR2HZ81l/9qheI6PFKfv5U+R04YlI9RoTFjq7Jviacmag+QN8Fy6KOOvWMsIv4z/Zpc6hz2eHAHKHQQoEEyn4ZuDEXwQV9JklPByDaITHV41G6S+RcnwdyUIoCck8lu1Ojf5ecjvgRNc5ZWC5Sbqj4yCbeUWz8sjVldrfuz8rTOBazjLGojiKikmPrAuKQBi9bUr3KW4dASJ8fZTlV5nznpTd1WVRLK/CKYGRBbR14euY9iwRruJYTVSg1r/dDwTI8MGJeL6RiDJ7G2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJAiatbeIknsUIbYDqTpSK9a+9TNf6F3bojQhB2LLfE=;
 b=jziJNKKQi87lKfCX6mEwHIXif0GCdMoDmlN0NP/6sa50PHsM7kdUml2of8JkRo+Kw2XbiTX2+UwNcPYJrSMkdjph6tG0NCyhmbUodf1gaSo1BrTlVttvk8E1GFDbHPKy/n5ypNijbMT5Zh5WWW/zH0xbI1rOsOt9WA6U2+Oy6ewfVo/N9R/0FbSiif6dSB2iT/UrYT+94WMa3skChdMPrvB7uArcPmI1aywXBK6EzKgUj5/+nuj2cA4Qgr7053z1gb6p7PMlr7JUhwa/yhymdNiw42MAfo3tEvDIQESJ9VysGiOQSnuMNCZ1kUykq2tpOPTA95WKAZpxt6mbKRCvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJAiatbeIknsUIbYDqTpSK9a+9TNf6F3bojQhB2LLfE=;
 b=VMdOTBNMmK2RHhPf5eDHkMYGgOdzIjDXvoLcR7ZOGIWQbd73Cn3RkxbeMagjUVlMX+nxedZsklx9wQF+mp/SzsaJAydm0c5I2G4UHRvC3qjnnpqBLneI7uVej+JmOLMERYaH26euYRvvoysHVI5+yWx5vfE8MqUf+yyfOyadQCE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <Michal.Orzel@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/7] xen/common: Use unsigned int instead of plain
 unsigned
Thread-Topic: [PATCH 3/7] xen/common: Use unsigned int instead of plain
 unsigned
Thread-Index: AQHYiig4f5ZNYQgFekivSKiReIklQK1mNqmAgAABsoCACYLPAA==
Date: Tue, 5 Jul 2022 12:07:04 +0000
Message-ID: <32242AE5-AF31-4AE1-94FC-4375E9CEE007@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-4-michal.orzel@arm.com>
 <4ee1fbaf-9d31-d28e-cb8d-f330c6a1923f@arm.com>
 <fdaa154e-95f1-6f80-6f27-f94aaaf1f77b@xen.org>
In-Reply-To: <fdaa154e-95f1-6f80-6f27-f94aaaf1f77b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4234b753-70d6-4269-0dc1-08da5e7ee8cd
x-ms-traffictypediagnostic:
	DB6PR0802MB2423:EE_|DBAEUR03FT017:EE_|DB6PR0802MB2150:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YY5a7f2VLqwwBCYQJzMZnn1Z/QiIIz6m9nYZrinhannbETx1oaVGzb9MyITAjKtlVW4k2ZE5MoB3GX+EvceChkFi8tu1qcDffCmlXqe8dL4QIVRJBY4WXYYNq+kcHRiJXZxODln4RyQPxJWaPn1pBrwUEyI1uqR0VsJygbywEc/E0kZ7xBIRrWlO+TNN4qSojxcfFgmSR9AJKTGZD5/d31ah2G5ZWx4E/E62LrZD+DDUSpAfwjzjJMYNdLP/tVXgHgGbsEudmgrUlccJbj/GpeCRPtdAFFvrsZmyTiaGmgktICAZKPzMfigHra809QrxB6BqdBiVB71BEKL1G1H3D6r/WttxClr90ZuAAIMUko2EvW+uqCulNSHGZgZ1cpzjosUMInT3PhwPmue4OXM0L/+aCFD56L9cai2mFYzQzxIu/ok+i/OQKoe8CZyJW80T7RsqtNHdE8Mvoen6psE7uxgWPWmevAr6ARZe0bzwq3KXEC1qaxWVaLf0sUmlNBYlYELjNRg6+qxRcV+03GyUsAbfBFWXBxgjLVhpEercGA2O1peoDRHZj5DXNOfabzMrPB6tFUqpjwJa2RdbhlslAIVuhxB7Y9Q7mwGEk3ftJ9DoxagjbTOiP/6PcnS+QZk7a5u+468faFBUgBHKcZzPuQVhfbG8mb3ZKmME3ApA4K7qVwFyqe0GvleLXOY+hmCgwqlUk2D3WNR+XReqikLhrUYMtPgYBITFPiNSpiI1cqdCk/q6oH1j6R+C9aD0ieZ6EVKRrjcqmTNXnw22St9q9wUU6CePGkiO41gHH8+NCe18aGxpTh185P6O2iie60PlFU0+fww17Wd85f7uwfBtSNdr8LzIy2JNMEYBU1kDgtY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(91956017)(66556008)(4326008)(66446008)(66946007)(64756008)(8676002)(66476007)(76116006)(186003)(38100700002)(38070700005)(316002)(2616005)(6486002)(122000001)(71200400001)(41300700001)(6506007)(478600001)(6512007)(26005)(54906003)(53546011)(6916009)(83380400001)(2906002)(4744005)(33656002)(5660300002)(86362001)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <966CD3112E3D9C4A875BAD2B20B809C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2423
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	646c8403-8dac-42db-a405-08da5e7ee066
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GOyYnuwwQPz9Q0pGL4YCmfqbu6pe2eBbyO3/VXPXO6QVfqnkTztMMNfv7JV6UjMmQ6YqNAwdAC+vCspH0WuYt6MPcfcwC+qUzS3OWVrDQnfLb7DqHZFDwmC21WUf7yhbT0KNyPWzYtBodIoEo1v58qthZT46A26GcYzuY/3BPZoftXXU7xuZtDI7Q8FqBmdllRYKZI+T59+WA/YUuUfASVypuib7bS/NpLTQTn22Yki8KcwyoYe/kThPIoOcz0NXM5TzicT9dDnBwigD73OLQD+/8MgRSZEy1cTUCi7W6Q9O6kMCHzq/A9oY+5fnAYNdtwBMx856AL/cv37stOvpn/GX5qb1IDboNF4jgm2W64CnQWRqcab/5ff19vHHSlhYvpctJj/VnCkVflDODDNXbU+WuK2/nXG2JdmSW+TQDKAgSFRznmO+PE7Kz6Kz3tgsM3hD6K9l8si6i0BtOkzWLfMYOmvrX2Vi2NCqARcjisuTIY45Y//EeNXl7aqsq0Wy9adw6Pm9uyBtr9dzm6Yrul/fX7lHOtx7WfFRsUc0gQaKNax9E6Iamb+HXHzhIh8LAOLz1WDGAK/6Ituzvk35oLbEHvTdTm6LmsZWUFRiwLCO1PhmbrZwhF2A5GzidP8ebuuC+ne0MCpCaWXDy1xnXKxaoxMWlWnGBlO5UM2uQUjNp+YuBZuX6Y5u/ASClhp9NikNcwItOAD5DS5FeZ9bJRz/DwSKyhTxRNKli9J8aDFjmxRn3gF4zqUHWSUVH+AwL6Ddk8RCIAqoul2L9/svkrCaa8T6lkb88X0HrvSVoVgnzVssoLZqNGsRALP+Uciq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(36840700001)(40470700004)(36860700001)(4744005)(8936002)(81166007)(4326008)(53546011)(26005)(83380400001)(5660300002)(6506007)(6862004)(8676002)(70586007)(70206006)(82310400005)(36756003)(40480700001)(2616005)(107886003)(186003)(47076005)(6512007)(2906002)(54906003)(336012)(478600001)(86362001)(356005)(33656002)(40460700003)(316002)(6486002)(41300700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:07:19.0833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4234b753-70d6-4269-0dc1-08da5e7ee8cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2150

Hi Julien,

> On 29 Jun 2022, at 11:52, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 29/06/2022 11:46, Michal Orzel wrote:
>> On 27.06.2022 15:15, Michal Orzel wrote:
>>> This is just for the style and consistency reasons as the former is
>>> being used more often than the latter.
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> It looks like this change was forgotten when merging other patches from =
the series.
>=20
> I noticed the same and was going to commit it yesterday night. However, i=
t is technically missing an ack/review for trace.c (this is maintained by G=
eorge).
>=20
> The change is small and likely not controversial. So I guess we could do =
without George's review. That said, I would like to give him a chance to an=
swer (I will commit it on Friday if there are no answer).

Just a gentle ping on this.

Cheers
Bertrand


