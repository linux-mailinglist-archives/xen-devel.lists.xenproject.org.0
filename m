Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79059566F2C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361282.590713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8icH-0002yS-2T; Tue, 05 Jul 2022 13:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361282.590713; Tue, 05 Jul 2022 13:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8icG-0002w3-VS; Tue, 05 Jul 2022 13:29:24 +0000
Received: by outflank-mailman (input) for mailman id 361282;
 Tue, 05 Jul 2022 13:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8icF-0002ps-7l
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:29:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b18c8ba-fc66-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:29:22 +0200 (CEST)
Received: from DB6PR07CA0067.eurprd07.prod.outlook.com (2603:10a6:6:2a::29) by
 DU0PR08MB7519.eurprd08.prod.outlook.com (2603:10a6:10:321::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.19; Tue, 5 Jul 2022 13:29:20 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::30) by DB6PR07CA0067.outlook.office365.com
 (2603:10a6:6:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.14 via Frontend
 Transport; Tue, 5 Jul 2022 13:29:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:29:20 +0000
Received: ("Tessian outbound d5fa056a5959:v121");
 Tue, 05 Jul 2022 13:29:20 +0000
Received: from e52ec1b325ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2184590D-EA4D-45A5-84E7-8889E85CE566.1; 
 Tue, 05 Jul 2022 13:29:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e52ec1b325ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:29:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3847.eurprd08.prod.outlook.com (2603:10a6:20b:8a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 13:29:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 13:29:11 +0000
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
X-Inumbo-ID: 7b18c8ba-fc66-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m88tbrFWFCZwBr3eP263jlwqRkw8s9Q6PWLXhKMNj6zNJjiyZTfHxW6H7qnTZCp/lzhG1mUc+noT34sw6Z/ZtmPAj+pOkiAzcTVPU+P4lfEKnEyW7s2sKAQfS+KNfxik4yBMm5khJ6TIjLdPAir1S/gzInZBYTAlHPP83s5mcF4VHSwSgM+BoFWpQkpfJE8cYoBKaj6CSuSLRNGbqOPbYjpUZpcPLr9IFZ8AzgXTV1oGmmTqbjndliyQvWTuQML8tXSAIlEvhw4abGN5RCyZF5NcL8RfigcLC7cU3wr+/mSaCZRsrZeYowTo7CniAWokalGFKaObgoGfxNK7eFTk6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZRUVt6T4fRC/hSuLzaHk5FIy9dURYF/Ez4GzpFDPTY=;
 b=JZmQuPe3Va9o12JN/AeuAzRckX0Si+i7ClhJuyDXVmotuOTpeRmQEEBCXgMnjHoqJ2twMmkwNshRIvjkJW9jUpDWZWg3MPHGQMqZtjwf4IbUcSN+1gm/7xQOHJboIkgvqD8HAxzunLHbfYQECgweJyXB7EFGWo6xXlyj6wv8kb+8vhuV8evTyBlCRBsPuiCVrrTdtDgGgXAuEPT+F/Ns7P+zHDPbPKSKIrhzcfCYyvnhMT9oaMZugYsu/VGoIZ8LfEMxCR9du8GQim+P8WAazHMOchPnbTJ8kgXWzlcANHK3K4OMt+ZeVZ1j2E4TbbBmM/KPN/AWuvekL2AyAt+OOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZRUVt6T4fRC/hSuLzaHk5FIy9dURYF/Ez4GzpFDPTY=;
 b=B0S2G9KYFI5xcZ/z2X2g/7e29ibEW+vtck6CEvrpWkXE4iM48out1K3zLdbxL7hAyrbd93DgGUpZmeljvABVV8KDOITIRzJZaKDoxgUaHPlDen6q/Cacq5rsoSIxHFsBPVC4qiZYlCiSQCwh1BhuukVbZtEw27MI1g+UKdTJfM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cd7bb388d1e3c19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlngEC1QADEXjnNopGdN6Ywj7cLcnA46tc4ERYwJf00/auUEG9doUhEKUnxBganSnUyfut40CZzZ9DEYFgjmXDYzcM8lwsj46iQyMP4cXIYW2JzQEUNXjbfDDzkQB2c20n/Iy7HKIr4Yxze/ovjuDn/+9Af1oqYppx3Haze/BjkYf3sDUehOrhSHdbcr+5JQPpaEUDGbHatJbv6CQjmiv/ddYqSL89DLPblhbYInm7vgKmwHEqbMSzEpYTIUwCsjnpGlXDCixnMHVGc/X/+YJECcNG6gCHjC3aPevmUkT2cHp+bO0DSFPU+V/OWNtQVLo0tfZPm3D8rYo0ns9iQvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZRUVt6T4fRC/hSuLzaHk5FIy9dURYF/Ez4GzpFDPTY=;
 b=HKC2JaxF5mN3HSbkMJpMXRTDVG4gswNmt58dtXLtN7A+OjE/X7kyKy54P707/Fu7KRvXYQF/EjKDuuL5AV4k0cWexwQrZXqvA8Iy1bBbEGF1sS9lInr9VQ1OILr0yk38bSOzFC5CJ9LRvQRcgyLJnpffyKrF1bqm5+HiBAaPL1VbRT3tz9ySM4iEuyobbuafidEPK891Qae2A/BLHPUpIpijQyGEr+TepMP9f0Tdim1AJUqJfIeofhdclMm54jQM8tSNSXKjY7E4WSAamB7dIsONSBUi9e12PR1PWBWNFQ6xd74SQLaK977ZGTPckJryKjBG3AXfJk1233DX0kh58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZRUVt6T4fRC/hSuLzaHk5FIy9dURYF/Ez4GzpFDPTY=;
 b=B0S2G9KYFI5xcZ/z2X2g/7e29ibEW+vtck6CEvrpWkXE4iM48out1K3zLdbxL7hAyrbd93DgGUpZmeljvABVV8KDOITIRzJZaKDoxgUaHPlDen6q/Cacq5rsoSIxHFsBPVC4qiZYlCiSQCwh1BhuukVbZtEw27MI1g+UKdTJfM4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v3 17/25] libs/libs.mk: Rework target headers.chk
 dependencies
Thread-Topic: [XEN PATCH v3 17/25] libs/libs.mk: Rework target headers.chk
 dependencies
Thread-Index: AQHYh+Q1zaZSd9AMO0OKzG6eXIwYj61v1qOA
Date: Tue, 5 Jul 2022 13:29:11 +0000
Message-ID: <89F3BCB5-FD43-4091-8E10-4E03144D9C40@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-18-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-18-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3d019dfa-2017-4296-ecf0-08da5e8a5e0d
x-ms-traffictypediagnostic:
	AM6PR08MB3847:EE_|DBAEUR03FT013:EE_|DU0PR08MB7519:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MBcypdyQmcJ8YoUds28rmqgZlANhwzGrUonWsuZ4f1FQ9hAsnsTv1MMf0xpZh1/aoD7jGsey0lfb5cdSiwkBwXBchvihszdV7jRC4045N5JYtzp+5VDWK3ifKmKpKzHLm5DcClZw9ioCQKiiF5EWPU8j7wJWiCic0tmUU2p1t/35dWiU2aqDlkmFAIQmK3eWPsempWm3tJIm3fg7oT9nwQlELYXgtcSW7svnA2j/yRtGBia2MnvPiM+c3b22asK9SmsAgHspTBTh8QEn2EYm9tkatrQbZnYkqe4kRwx06hsysh0a4XJpp6j8ooyPtnnf8sycHLD04swDu7Tbk+Yx5yTsqUfmxA5Yt1NXa4VxCzzYQgSM6EkWstPsgPfwH7cZ49yO04n7nVW9qFiyCX11IKfbR2jQghPnDxqYnCUgVK1NZyy2t2Q2nNVkanXc219RIgvpPpPu25Yy0EbQoQt4PAG7A+exRwbxrbGl4aKGp3pjDbLam6mLYKoD2/A6wUS8jA1NKc+/bf6IuwzjFn4hwpiXFKCkGUYzuY4vRx+YweKiqFGfSAdsd+1AthtAXs8p3GJALyIgk0+ZV2hJIInR4TJTuBH2EI0K3jKHwg4N2hOWeqY66pExvNM66A7WlIzvxiFOW65jzPTQOrJUxrUA77bjc7Vs3U5feWc60u4pcdWsnxdPw/JEMu8dkI6J3YxcVcmzCKP1IoGJxSwr05SXWg+JSalqjnGFFQaHiFcohFlSwb1TwP64xunfMkameDeHVIfv+pKqkTaKEMLSvbXZqrW9tOKbofoapOta/vqNIwqu0OAoB9bxh1xdzBbEFzyAyPyqFyWdyuXGZ5S/AFV9qFReka1F/3ul3qOUOoWkkh0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(186003)(66946007)(66476007)(38070700005)(83380400001)(41300700001)(6512007)(122000001)(38100700002)(91956017)(316002)(33656002)(64756008)(6916009)(71200400001)(6486002)(478600001)(6506007)(54906003)(53546011)(66446008)(8676002)(76116006)(66556008)(2616005)(4326008)(86362001)(8936002)(5660300002)(2906002)(26005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEBA302235ADC241B12A521C7833B9F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	182901f9-ce7f-4309-099e-08da5e8a58cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFNDNRPdPdg2kaWtBRpWjoBpkpOT2Jx+THgHH5HjTGuYsN2UTmIEHzi9HQFVqSMjSREFrWxigrT6Xfo59MoaPlRHpm83V3nSgARr8OPtct9a/w32yQqjTL1VBjctx0gEBfuqEWLfzzI0HfuwTmx7RU2LtX1yilbVc+Nue27aKheM9UBhOk7nX0ao5qqjqEjNaZobSxDZ6c4CdocjAYZ94IynMjA7dA8kmamRugZIC7zLCc0omh9DHLJmwRoqDX1KiUDNfLuVpMqzm2VKe8fpkH4x5dxKb8Bm/OsY9pTm7aKqqF03rGzTdmI9bgD1N2G7UbTA0SMsX9ZAZLMtes1KJ9tSgdAZEswpfP809tm0twozfYQVJ6WVaIINlGP2h65XYBH8c+kHxpDEoTnhsGUlis0N1d/DsTGbcjy6OCf/lr6VUSDiIKKmZErNE8ALAFt8yG1IM102rqz5pSao3ByTjT+Un2iOPUR7ILwRjmR6emkf3LK1igmUIYWOX/6Aa3OwLGODKlsk9K8t4XHBRgz5Q3NCbRr4qY+MPsmUK4F4WEqk9mKDK4LqGyCXGZV4nT0XzE5ki+zcsf6bjx3IPJKFJrZ8f/yPdQyG9XMXlkvAYInsZ1h9s/CCw0E+3USbhqxSSeaEq3VgWRxihmOBBx+e8GBeSaS763e+SYWvI480f8RCjZO0UdLYPYQQEYkfBCftdcNJJ7uOsvnBeJ05MfSBPjFnaO2ihlx7uxt8Av/fhNUljEfZ5gsWl8qVufEnSK8JLlQ4fxVaZyaJ62WLg8mijvGX36FKkLtigHEMPjX+QIPrm3GChxH5gU0n91cqoyMH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(40470700004)(107886003)(2616005)(6862004)(54906003)(5660300002)(8936002)(6512007)(70206006)(70586007)(86362001)(316002)(6506007)(81166007)(4326008)(53546011)(8676002)(26005)(33656002)(40460700003)(82740400003)(36860700001)(82310400005)(83380400001)(41300700001)(2906002)(40480700001)(47076005)(36756003)(336012)(186003)(6486002)(478600001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:29:20.2658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d019dfa-2017-4296-ecf0-08da5e8a5e0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7519

Hi Anthony,

> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> There is no need to call the "headers.chk" target when it isn't
> wanted, so it never need to be .PHONY.
>=20
> Also, there is no more reason to separate the prerequisites from the
> recipe.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> tools/libs/libs.mk | 10 ++++------
> 1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index 7aee449370..f778a7df82 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -55,22 +55,20 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR =3D $(XEN_INCL=
UDE)
> $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR =3D $(CURDIR)
>=20
> .PHONY: all
> -all: headers.chk $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(L=
IBHEADERS)
> +all: $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
>=20
> ifneq ($(NO_HEADERS_CHK),y)
> -headers.chk:
> +all: headers.chk
> +
> +headers.chk: $(LIBHEADERS) $(AUTOINCS)
> 	for i in $(filter %.h,$^); do \
> 	    $(CC) -x c -ansi -Wall -Werror $(CFLAGS_xeninclude) \
> 	          -S -o /dev/null $$i || exit 1; \
> 	    echo $$i; \
> 	done >$@.new
> 	mv $@.new $@
> -else
> -.PHONY: headers.chk
> endif
>=20
> -headers.chk: $(LIBHEADERS) $(AUTOINCS)
> -
> headers.lst: FORCE
> 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
> 	@$(call move-if-changed,$@.tmp,$@)
> --=20
> Anthony PERARD
>=20
>=20


