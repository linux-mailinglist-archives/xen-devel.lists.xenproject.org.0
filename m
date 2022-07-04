Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0CB564FB5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359926.589210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HP5-0002l8-P6; Mon, 04 Jul 2022 08:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359926.589210; Mon, 04 Jul 2022 08:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HP5-0002iO-Kk; Mon, 04 Jul 2022 08:25:59 +0000
Received: by outflank-mailman (input) for mailman id 359926;
 Mon, 04 Jul 2022 08:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=byhi=XJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o8HP3-0002iG-Ir
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:25:57 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10056.outbound.protection.outlook.com [40.107.1.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec3adf2d-fb72-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 10:25:55 +0200 (CEST)
Received: from AS9PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:20b:46c::20)
 by VI1PR0802MB2413.eurprd08.prod.outlook.com (2603:10a6:800:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 08:25:52 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::f3) by AS9PR07CA0002.outlook.office365.com
 (2603:10a6:20b:46c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.13 via Frontend
 Transport; Mon, 4 Jul 2022 08:25:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 08:25:51 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Mon, 04 Jul 2022 08:25:51 +0000
Received: from b251d42e738d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FBC16E6-3FCE-44AD-80A7-8A1D8375F6D7.1; 
 Mon, 04 Jul 2022 08:25:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b251d42e738d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 08:25:44 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM9PR08MB5876.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 08:25:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 08:25:43 +0000
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
X-Inumbo-ID: ec3adf2d-fb72-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NH2gG/T/sWSwR6mQBi74JpD+9iq+p1EDoeOfDkHmKQ7EK51HxdouTJUL9Mb9r2RSkqaV1lwADmblGY40TehORECoCqfaxaFkPFQBNmjrs+zm8oXe7R9upJRIBy1MJN6MMphL/iLANruJlxGiQpdJ/cMyy0qscYj68E1w0ndGr9cu9WgfJ7QAq/bORnc81lvUpb7rcCZZ9S2vHwpraAs3KERc4/Obc3bXMMqwISCuVYb8Bdafe3UAu/8ZCMniuBe47wLRJBZ17pOsgAZ+6EWh0AjsIKAqYGaZkuJ2A5W+eJekQ/tFmpWqjoRbog9cFmK0EIC4G0Qn5lPsRgdLN4Lovw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSGkZuZWUzelbyoh0bkhI+vSmzyC5A19iqWkuxoyJuk=;
 b=h2sqnjlWntJc8+DtG0BxXK7DSzbB1Y+pfntGa8PDqhHkjsi5FwX1oTmkqI4Jdm7q+0gUtTRmOm5SeAz9C/EV0T71s/mf+qX3GxWe2MOBqPjnlST28ZCNoUXmN02NQvyJiBU/T8kWkoot+zT5XSYN1/cntroPGKRcZH7Ys92xRZUiEgeucP41bmuaCYaRzMSFMy5XsJdBeohqDSZEImWUbGuMQZS+TA4RXZ2M3+pZ6vK3o6ubr0fBlJfiHuP7tDp4x90gGCvTEv0Ro5T+NSlnaprV9rUusLLUaKyTNOdtsW2Yl3SWiECMKLNwiZyrCsouaaovr8z+mIEOL77BTTzpcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSGkZuZWUzelbyoh0bkhI+vSmzyC5A19iqWkuxoyJuk=;
 b=Hj52l2urtMk/zghoBceWe3DF/LLUc727y1FWgJqDYMbbxqHCpuhVeBXRMuBa58xr2YUWX+Mf1F/9haqrQKysL6mPbrVLqHkS8j9yOJZhb2YKH2Xl+eOkVEpHgmbN46M2QzDoXZ/N8AIzNBTgohQWpmoVtEiz8oN/vdOIa2eSs4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9037251a07c3b247
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcX9oOWRJItCeEEBp7q81h8UniWEE1rKuy2Q43coGTLLMq8dF+zQQKPFJi5WT3RfTwpvN5RdRtZLCeRwf9xX9M9STeZT1QFnUJRKa/U62dSpNSCb3IBofQVc6m77WNlEJ8RteAh40iaNB89/9gfCS4eUCooYck4EtqUJcqcSAU+94eYvvVh7iRgYaQZ6uJNJExYLcb+jZv8mG2t+1wHfD/nTMhLQHZ4ecpVedOOTy1ZckuaIgyKdbeabXbT15VKCOi0st+2Jr1havbiPiHNzjBp0NMEEkVkoVmReMXnnbJswvYPAoG85qLfzAJnN0I3RR2lIkMGLKHV+Uhu89yy1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSGkZuZWUzelbyoh0bkhI+vSmzyC5A19iqWkuxoyJuk=;
 b=R8/BFvVCHHA2de4+HDRCEavCS7zeMpM03SifJR2N55cdKudrT1Av7YdUJhbRN2HJJ/0JwISvZGAucn4zzuHTpRjrtalVgYiF3I9NsiWZgAqH7GuYL6zu0wheChDMvEso6KVClx3HQPx8b1MGERxCZNJS4p3ef64nbt/MK2iirh+11tMJ6ctKl5pRWiuSL6fR7IrQO1/Vw4WJshIhp49oGYdxVrnS2YzVoewvEn9HQU9Su74kuGERNFmlM/oSGiMmUORQgVQcN6bROCZa2Qc2aVbmB/EAY6Bs8YASaqkmHlplFl57hvivgsoriAQjasBrBhoFPqk2RCDiHGTxBo+7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSGkZuZWUzelbyoh0bkhI+vSmzyC5A19iqWkuxoyJuk=;
 b=Hj52l2urtMk/zghoBceWe3DF/LLUc727y1FWgJqDYMbbxqHCpuhVeBXRMuBa58xr2YUWX+Mf1F/9haqrQKysL6mPbrVLqHkS8j9yOJZhb2YKH2Xl+eOkVEpHgmbN46M2QzDoXZ/N8AIzNBTgohQWpmoVtEiz8oN/vdOIa2eSs4U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Topic: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Index: AQHYj3bsMO2Y3PSLZ0WCUDTYt37uBq1t0/kAgAAEvQCAAAI0gIAABXOA
Date: Mon, 4 Jul 2022 08:25:43 +0000
Message-ID: <E77F6E48-80EE-4874-B560-D57ACFF0C264@arm.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
 <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
 <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
In-Reply-To: <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: abc9f04e-b461-48c5-45e0-08da5d96ce77
x-ms-traffictypediagnostic:
	AM9PR08MB5876:EE_|VE1EUR03FT045:EE_|VI1PR0802MB2413:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bL15ToF/SxR+nNRYIRU1qK7j8PkgUOwMsTb7ckEA+8r+2II6Tc5/AYH0F7R3Xfw2fJnmkILGfhJp2GCoEQRoaNuTiVZFy2I+G4uqpfh+CZacqFfPF+GgIQRziOXq6/pRdxeIcdrXypmCHoq4lZfy0fu5pivagimU3T0HJnLuG1Zg2wCVA7OgdLIeZHK7y3FecJ4RTqjRp7kujfpEE68zuCh77RZdkerliaJPCMiFmEe+Vkf1tMHhRG27hpxql8cKDZJxd26vh/znsc1Wfk9hHoEE1Fd3BQcjn0aQrOOkMCy+M3ru762mlpn4Bq1PCjXm8Jgu1hUa3GGaF6sjRWpP/rbx96Svik0v5wxaIFqdgIN4MhvcB1TIbUmK5kL8I+39qfUxppm7CwEJ27TzijdKrWZkbg6c/pqDn7sjIhak6fB/V1ruNNi4cZCOd8GfcNkoDdaAva8RJ+BY4gWSbvKvenzNqRybpWhJPyeDrAILCW6at2SZt3L7ej+elZXcYjnIPNLklqxMCg3TOAI6lgUTIKDuCfl8SZw4Q1YloGJaj7MNAnG7X8JwX82+yOuPhEQeIShL7x8TpPQH5zSgleF72CExJaEPk+0VdWEo2EH1yu+UFjCaMnVW/0rvDhPxQe5W7VJWdA7UVuMa/pf12417Dq7JXrxuF7t0w9tCw/vWOZzJFKEYQOvPeA9suWrVQyc7m2FZRAsr1Z2BXIGUtDwrrGjJllq24Jg+hvXzz8Gqms8S1uHBMdSv3uVW6m1G5WQBQegThNiNq14iXZLy0G07/IhWqzUGb0FTGKeTjbMNUr3fGHrGfpxcUgieY0CkolojwPEgDENZGzSEb08+maSWmVdcv+oKRlBaYCBtZd5es3c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(33656002)(86362001)(122000001)(6486002)(38070700005)(38100700002)(5660300002)(8936002)(478600001)(41300700001)(2906002)(316002)(54906003)(6916009)(71200400001)(64756008)(8676002)(4326008)(66446008)(91956017)(66946007)(76116006)(66476007)(66556008)(186003)(6506007)(53546011)(26005)(6512007)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <599D54F8406C344288E7D8EF1861A0F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5876
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7b84482-b017-4a36-500d-08da5d96c95b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QqA2lmK4mj9O79QvjXKCkKesOygkc0LeuYYV7dj+TGoRwS4i2eLgPMHQkBRlR9tHIOLMLWvyFb52TSDqvekUeT4+NmsYc2giI3gEw43cg0uijKl7GOID3eYThhM8hHhXJC1sTr0UST3ZEY3k6X0aQPKxVrtPmWl7Jb0yjohz3vhHJD2SnNnoerqPBfFNGemiVDTVlqE131BVx6pVcvKtQKZnRr7apTChye6ILa8hHA13GRMRa39Qc9pg7HUmi+BDKGKF+03ZcMxFOlK4Yv+eiwOk1kT5hSuSKg8DLyQvErFyGVlfaohDIx054mWHYb6zE/WUujFrXlH5ABRWweCovqoYXlFkvH3gMQP3BqDPIxLCx93CzoGkG10mc2YIdZNRbIckR6W4dFwIfZ/IXGMJW2+Qhw17mcs3OUawrLo+fp/qky6JodXvsyRa0ALLo0GWBwNaygVTRiVTkwUA7W0TLSUp2uR+TsLmkUUtM4ALLVhooxZH6H8BsSxifMAaEBdjlba43b/MdNE/5gmkwBY0fzxGXwgQwzZYp+FzQT6mmRPpBMgBm30w5eRhfK95Rt0w9EhsSm8xkjZsOLH1aYa1Jb9TsGT6DkU3T35PI9xSx8hLMd2yUEYil3LJA2hcKqMfcJMm4d7mXpanyMdRkvc35TxsQ6pfCawwWKSsrh6QcwTvxagJlWMf5kxcQ0LAWB02jCCDaiR9ycglCVsmwrNY0pHiYC/6KYqiyadXfpbbzuNPKlKaZKq11WVwQ/dgQQYQnns1PDg0zs8JwDsILggeV3Yi6WEC5+NHJBVuI/7a38Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(136003)(346002)(396003)(36840700001)(46966006)(8936002)(5660300002)(6512007)(2616005)(6862004)(86362001)(107886003)(356005)(6506007)(478600001)(33656002)(53546011)(2906002)(41300700001)(82310400005)(26005)(40480700001)(81166007)(83380400001)(186003)(47076005)(336012)(36860700001)(54906003)(36756003)(70586007)(70206006)(316002)(4326008)(8676002)(6486002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 08:25:51.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc9f04e-b461-48c5-45e0-08da5d96ce77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2413

DQoNCj4gT24gNCBKdWwgMjAyMiwgYXQgMDk6MDYsIFhlbmlhIFJhZ2lhZGFrb3UgPGJ1cnphbG9k
b3dhQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDcvNC8yMiAxMDo1OCwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gSSBhbSBub3QgMTAwJSBzdXJlIGFib3V0IHRoaXMgcGF0
Y2guDQo+Pj4+IEkgdGhpbmsgc2hvd19zdGFjaygpIHNob3VsZCBiZSBkZWNsYXJlZCB0aGUgc2Ft
ZSB3YXkgYXMgc2hvd19yZWdpc3RlcnMoKS4NCj4+Pj4gU28gZWl0aGVyIGJvdGggb2YgdGhlbSB3
aWxsIGJlIGRlY2xhcmVkIHdpdGggZXh0ZXJuYWwgbGlua2FnZSBvciBib3RoIG9mIHRoZW0NCj4+
Pj4gd2lsbCBiZSBkZWNsYXJlZCB3aXRoIGludGVybmFsIGxpbmthZ2UuDQo+Pj4gDQo+Pj4gSSB0
aGluayB0aGF0IHRob3NlIDIgc2hvdWxkIGJlIGRlY2xhcmVkIHdpdGggZXh0ZXJuYWwgbGlua2Fn
ZSB3aXRoIGEgY29tbWVudA0KPj4+IGV4cGxhaW5pbmcgd2h5IHRoZXkgYXJlLiBGb3IgbWUgdGhv
c2UgYXJlIHVzZWZ1bCB3aGVuIGRldmVsb3Bpbmcgb3IgZGVidWdnaW5nDQo+Pj4gYW5kIEkgc29t
ZXRpbWUgY2FsbCB0aG9zZSB0byBmb3JjZSBkdW1waW5nIHRoZSBzdGF0dXMuDQo+Pj4gU28gSSB3
b3VsZCB2b3RlIHRvIGtlZXAgdGhlIGV4dGVybmFsIGxpbmthZ2UuDQo+Pj4gDQo+Pj4+IEkgZGVj
aWRlZCB0byBkZWNsYXJlIGJvdGggb2YgdGhlbSBzdGF0aWMgYmVjYXVzZSB0aGV5IGFyZSByZWZl
cmVuY2VkIG9ubHkgaW4NCj4+Pj4gdHJhcHMuYyBidXQgSSBjb3VsZCBoYXZlLCBhbHNvLCBhZGQg
dGhlIGRlY2xhcmF0aW9uIG9mIHNob3dfc3RhY2soKSBpbg0KPj4+PiBhc20vcHJvY2Vzc29yLmgg
aGVhZGVyIGluc3RlYWQuIFJ1bGUgOC43IGlzIGFkdmlzb3J5Lg0KPj4+IA0KPj4+IEFzIHNhaWQg
SSB3b3VsZCB2b3RlIGZvciBleHRlcm5hbCBsaW5rYWdlIGhlcmUgYnV0IHdvdWxkIGJlIG5pY2Ug
dG8gaGF2ZSBvdGhlcg0KPj4+IGRldmVsb3BlcnMgdmlldyBvbiB0aGlzLg0KPj4+IA0KPj4gSW4g
YWRkaXRpb24gdG8gdGhpcywgaWYgd2UgZG9u4oCZdCB3YW50IHRvIHByb3ZpZGUgYSBqdXN0aWZp
Y2F0aW9uIGZvciB0aG9zZSwgc2luY2UgdGhleSBzZWVtcyB0byBtZQ0KPj4gY29kZSByZWxhdGVk
IHRvIGRlYnVnZ2luZyB0aGV5IGNhbiBiZSByZW1vdmVkIGZyb20g4oCccHJvZHVjdGlvbuKAnSBj
b2RlIGluIHNvbWUgd2F5Lg0KPiANCj4gUnVsZSA4LjcgaXMgYWR2aXNvcnksIHNvIEkgdGhpbmsg
dGhhdCBmb3JtYWwganVzdGlmaWNhdGlvbiBvZiBkZXZpYXRpb25zIGlzIG5vdCBuZWNlc3Nhcnku
DQoNClllcyB0aGF0IGlzIHRydWUsIGluIHRoYXQgY2FzZSB3ZSB3b3VsZCBvbmx5IG5lZWQgdG8g
ZG9jdW1lbnQgaXQgd2l0aG91dCBhIGZvcm1hbCBqdXN0aWZpY2F0aW9uLCBob3dldmVyDQppZiB0
aGUgY29kZWJhc2UgZG9lc27igJl0IGluY2x1ZGUgdGhlbSAoYmVjYXVzZSBub3QgaW4gcHJvZHVj
dGlvbiBjb2RlKSBJIGd1ZXNzIHRoZSBwcm9ibGVtIGRvZXNu4oCZdCBleGlzdC4NCg0KPiANCj4+
PiBDaGVlcnMNCj4+PiBCZXJ0cmFuZA0KPiANCj4gLS0gDQo+IFhlbmlhDQoNCg==

