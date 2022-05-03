Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2A518269
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319433.539678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlprw-0000zG-C0; Tue, 03 May 2022 10:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319433.539678; Tue, 03 May 2022 10:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlprw-0000wV-7q; Tue, 03 May 2022 10:35:00 +0000
Received: by outflank-mailman (input) for mailman id 319433;
 Tue, 03 May 2022 10:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1P+g=VL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nlpru-0000wP-50
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:34:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad099603-cacc-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 12:34:57 +0200 (CEST)
Received: from AS8P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::17)
 by DB9PR08MB6794.eurprd08.prod.outlook.com (2603:10a6:10:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 10:34:50 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::ac) by AS8P251CA0026.outlook.office365.com
 (2603:10a6:20b:2f2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 10:34:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 10:34:49 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 03 May 2022 10:34:49 +0000
Received: from 6d44f2fb7666.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEAA4B0D-3FAB-4976-8EC0-CB83754B9F4E.1; 
 Tue, 03 May 2022 10:34:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d44f2fb7666.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 10:34:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB7183.eurprd08.prod.outlook.com (2603:10a6:20b:3de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 10:34:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.028; Tue, 3 May 2022
 10:34:41 +0000
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
X-Inumbo-ID: ad099603-cacc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hbuhjdpFRYRD9+ktCNV4mVV68+WGYsD9imWKhM7fa5NfHR0mAKCDP4KsXGq4r8A6qadielIO+aPZMTjpxVH9fTsKGMe2xOh9/1CybNhEnS4TCgQGSlYURrf+JCcQXFJg5RwnSlFwXr9F/sOVwLQJs+jWtJjsTbn6J/8jDiGR0JT2+mbOSTo6iyKynyxm1lPNM4Dj6CYfpDzvvf8f1N5hPJnV5OKR49RJJ4X46U8Sortn7DYxO4iO9kY0+PHcwth9W3G9iaIoqylURQ391BnGRs+YrR47qNkXxV6xkko41KR9aBQ8pSY0BEbxY9LoLsXlKsSNKpgZ47nu3D5R/jEgmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3vWs1doxMo9fgyOrrbLJqWRH16n928hwX3XuATQuu8=;
 b=b2ndCx4TRvggiR+8+IPAK0iyuTNdkzMEsjUkQ7wMs7svggR9uhMhQvlnKTMT8tyrVAssUfC0KKhMQS1XeC49vF/y7sSYAQZfE3mq9WTUXGmHr8hc34VYPJF7b3lH8CizKdg3oxK4K2Ab1vjfk9Lt+MefKlzs6zdm5KbKUDOecYwDjN4+OBf9nGL256j7TgYCR99CBUToH4PBLoirxqldv9VihQjWZCtBNVvldFt7YaxOW58K2l35yAlug7jGl3ajdGqChJW07VRXyDGAnM1AhwPoVMCqqOECxQObQm8UjgCxWuO9OqNOpR2W86D2OBZDTplMf848tEXdybJQhUmxGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3vWs1doxMo9fgyOrrbLJqWRH16n928hwX3XuATQuu8=;
 b=nRxJP08caTwnzKtVABZE2CYulNYDpzJraxu8PCZKKLXyF4FoGrcFAB/Rctis0p1z06YPzxGEgHrIFFwsReBUnvPqaYRX8WMfpcGbfVD58TXEKpsJ9PIT7Gf9SaEk4ftdOApyn9Tob7/HMtO6jsJtuGHA4GDVmpo9jtJveRtrtNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb39af702bff052e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OK27lGfaigEUGPHkgxlz3Wiz7BY0vTeWJeBjo4wXlIAJdtzdgMe8bzI+mxMS8jDKhRSR6aSZpw43G8EaGGvfumJq/z+xpRqURTSzlbdZonw/Q+EaJpViHXe/gj8m+/Nn88oafDPLDpUu7Vy49b8mriMoHgJ8kQwjMqRADj4I/WcRLpnNrt2cqlQo8GE0RpjiVP3RYn0cE+AVqYfVV9jR7bRQFXyBN5WicKFMQYj3PjCp98GEKtmyT9bAh+JjD1k0YeFXy6BY2i9+1MObe1RZIqc5P0A0kGv2Rj287T04OvQL+TUxOuLOFQmu1Sdep9SKu9lbH4UmHWF1HDsm6ZN60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3vWs1doxMo9fgyOrrbLJqWRH16n928hwX3XuATQuu8=;
 b=daqxst6AdPsDryIV/mJnGkFmXnpx9T2leAXfshLLJIp/W3GMTP/W1OYe0tYlLjIQBdEp7tLz6znCy7j00p+vsMK4hFcaLQ9yGsVFtymmJFDcwxh5mr4EXuvNK/9OBc0/UawRMAXmvXQJrte4zRcoDLrqW4fa2pf6/gYj2X10E+Gnp7Kojwg/kaAn/U+4LG4yfwUnuJ7yPFPs1DT/kKC+YNZo4TN8VGKm1/HBgpDRK3cnRL7TatpS8NBhjxJOM7RcmNAThfIcPTRfmsQRBuvhtCk7ydIJAbH7U3819lu+BWxkVpgt4kSHxGd5osxNFCgLr5oYcx40YQvFZ3cnEsTLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3vWs1doxMo9fgyOrrbLJqWRH16n928hwX3XuATQuu8=;
 b=nRxJP08caTwnzKtVABZE2CYulNYDpzJraxu8PCZKKLXyF4FoGrcFAB/Rctis0p1z06YPzxGEgHrIFFwsReBUnvPqaYRX8WMfpcGbfVD58TXEKpsJ9PIT7Gf9SaEk4ftdOApyn9Tob7/HMtO6jsJtuGHA4GDVmpo9jtJveRtrtNc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 1/7] xen/dt: of_property_read_string return -ENODATA
 when !length
Thread-Topic: [PATCH v5 1/7] xen/dt: of_property_read_string return -ENODATA
 when !length
Thread-Index: AQHYXAvKXCj8tnIY3E2+4y7aOufq8a0M+rIA
Date: Tue, 3 May 2022 10:34:41 +0000
Message-ID: <3234C7B5-CF82-4C34-AF4F-957F6A5CDFB5@arm.com>
References:
 <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-1-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aa668b61-f8b0-43b3-7ff5-08da2cf08cf0
x-ms-traffictypediagnostic:
	AM9PR08MB7183:EE_|VE1EUR03FT052:EE_|DB9PR08MB6794:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6794650F35F738D4E763A8349DC09@DB9PR08MB6794.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HTVChEhBZkKEAQk5uaWtIrHTClTtuwx8qpjLjy+Ua7bBIl2nkyaNTyAiOm1GcRmUz4j00+gAY+YKKvcuqCQnnnYp/TXRVNpqTUjC5sdBhgz8DYQhfhbcpjq8vb9JBJw1uz5GrLaxVKvnjhHTc7CvsZobDv4wgpB4qKemnBNjsgOPlD5TsFkQophYLqPSk9Mp4O5GJB84KzeAgAHXaZwy/gFL3ZtO2QScMWTkQpkMbWiwMCF8cohjsoAiNhYgOi7Uv1/hmwS7T2pQXJuKfZgsN+xbXlkKHicDEwKKAswyfprRZCxnMrALnDFNSuTxY5YvQARYhukx/leBoGlhXgnb13wKsVYSY7rtw7Zj+pZ1X5KvOP4cogJNum+jl2ShGlD7Z96wylQ7lS1ivSBC1Wk1SGDJdeA7e5VyfdFhTmYwK91hVSwgYwgMfwJqSEKfkhvev/qJk+pMXsRs9t78ymb3kFXUc/iN44vlP/4DJjlZ6+ldolS+VCiVGVKWpUy5n7hrQYDK/ddxVji+VIhR0bhM6UYKSlvHqMvfNMlsWqdEXdgKWdV6TCq2efhrSYIZqAceHoCV8p7EacPu60qSdsFu7bWrTKIAcyypVv4bEbA6zVt8i37+wvu89bHgNIVSyXrkfRVdw6gVrSKPjV01KRZTHSx97hYNSygaEL4QJPRTuw0dDrWKbVCirnm4emsRlsx9ZcgMJPi77xiyJPefgnpFCr2iiEjm7Kf+a1WxLaZN2uHuwLXwrwUGPoOSe1bTU2/e+SPtiQpcCZwYoUOhxhPcCfxrqnp6+5PdTemg72oNLSmjU0Y3fYMxd2edZT6R3gtJBlwOA0FTqYGomRrOyRcVfA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(38100700002)(38070700005)(316002)(36756003)(6916009)(66446008)(64756008)(8676002)(4326008)(54906003)(66556008)(76116006)(91956017)(66476007)(66946007)(71200400001)(2906002)(5660300002)(6512007)(26005)(86362001)(33656002)(2616005)(6486002)(966005)(186003)(8936002)(53546011)(508600001)(4744005)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B3DD13814C8B2448B2B8D46591D574B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7183
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a0c5f19-1b19-49f7-4f31-08da2cf08819
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+nggilWcK/gSrZHpjnUFiNkr/Y/WtUVmudsixFlYAeOiIWMrUe6udzMHr8GQkKF98EHkO4mSiDp88S7BpgILl5oLiwCuAaDMp1d9PrdYOA1E1hnLuKpTXCa03OONk35Kptb2epba5KTCzkGKdhT4lbNIEHbLZuxXDgGXsFC5aW999KVNUYuLKcurYfmyvozIVJqO2ZsQgjicXsETQbh8KBSeFXhJJXtkbn44q0yPUwux4ic2CcRRoli7VsofweqCOYIhwLOoIrgEk56WwwbwOutBcYbmkrzbgsdjJoKUTKHrKZ3OQK2KfuQv+mDHGJLPX2Ko5lEhWXmHOUlQjw0Wpmx/ztr2TSm2tmPZrKAiXOupjqtEjVv6BC2DRiCo2TwG5mrlX5Hv9zEHPTC3SUh9OwEvebSC2TfkLpSISq9T5T6gwuJr3j5yI/5M7k7lYW7NfD81D70yOHKaxH/Ak1ftNe9+VCAwRE19Rl5CX1raGaZgxvum07kUxqNq+frEiy+zkw5lzxx5ALVF+6AuQB+xA8TWTbSX2pxUVrE67S2EUGt7lPJmJ0dML+KKV0ErKsz2drGoR0EcUn7qL8hpCSwQoawtxOsG1LMZ+vBBZutC/gSsjP/GGNaoYpVlDu5NFxhZcDkQR9rUEsnyS/wBaoqZaRSuJlitUUYNY8hCSKBRXDfEolY9rNkLpZMj20ZAcrzfu1yjAe77LojSTV0fdGqCcwgjYtsm8q9fYd8sEzeaF5VQP/FzPCXwvv4YlaLRwEcaeEvLpTbVK1HcuDsT/PuUA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70586007)(70206006)(82310400005)(86362001)(4326008)(8676002)(6862004)(40460700003)(356005)(2906002)(36860700001)(81166007)(4744005)(5660300002)(508600001)(8936002)(316002)(33656002)(966005)(6506007)(36756003)(6486002)(53546011)(6512007)(26005)(336012)(54906003)(2616005)(107886003)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:34:49.3753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa668b61-f8b0-43b3-7ff5-08da2cf08cf0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6794

Hi Stefano,

> On 29 Apr 2022, at 21:57, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> When the length of the string is zero of_property_read_string should
> return -ENODATA according to the description of the function.
>=20
> However, of_property_read_string doesn't check prop->length. If
> prop->length is zero, return -ENODATA.
>=20
> Without this patch the following command in u-boot:
>=20
> fdt set /chosen/node property-name
>=20
> results in of_property_read_string returning -EILSEQ when attempting to
> read property-name. With this patch, it returns -ENODATA as expected.
>=20
> This commit is a backport of:
> https://lore.kernel.org/xen-devel/20220416003028.1315268-1-sstabellini@ke=
rnel.org/
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


