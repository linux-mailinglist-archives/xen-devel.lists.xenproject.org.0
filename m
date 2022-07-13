Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6A573620
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 14:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366545.597418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBbEg-0007Pi-CO; Wed, 13 Jul 2022 12:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366545.597418; Wed, 13 Jul 2022 12:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBbEg-0007MH-9S; Wed, 13 Jul 2022 12:12:58 +0000
Received: by outflank-mailman (input) for mailman id 366545;
 Wed, 13 Jul 2022 12:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Gea=XS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBbEf-0007M7-HH
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 12:12:57 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50075.outbound.protection.outlook.com [40.107.5.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 207fb923-02a5-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 14:12:56 +0200 (CEST)
Received: from DU2PR04CA0272.eurprd04.prod.outlook.com (2603:10a6:10:28c::7)
 by HE1PR0801MB1626.eurprd08.prod.outlook.com (2603:10a6:3:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 12:12:52 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::71) by DU2PR04CA0272.outlook.office365.com
 (2603:10a6:10:28c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Wed, 13 Jul 2022 12:12:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 12:12:51 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Wed, 13 Jul 2022 12:12:51 +0000
Received: from 65dfcc48455e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 20F9DB0C-148D-4D96-909F-6ECDFEEC4A64.1; 
 Wed, 13 Jul 2022 12:12:41 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65dfcc48455e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 12:12:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM4PR0802MB2273.eurprd08.prod.outlook.com (2603:10a6:200:65::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 12:12:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 12:12:38 +0000
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
X-Inumbo-ID: 207fb923-02a5-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OvfdW1f9i51/01P97p9Erm0as1hHQjY/StrlVRvuT3zJmipeeVpC304mrz2AhFIyT8aCD7ZGmm9rlSOq9lqfvspCfaMEKLwnjwecbr6xaUoPKoVBft1JORRS3OjZWAQJSi4elndCR4vxmbHYSozV3l19fRDOCtz4OnALPU1nWR/telQ6TxKtdzD02TRdQyq6Fktj3Ht+HwbxqbSF/ECTKRq3iXV0Lojy6G3Jw5rB6g/Ja/j4FiBmShtJ+JNf8oMjFg/xdl6WZwG71pofw3h+Zjs71RqKod7EtUPQqk8i+RfA/7Jp2UOLSGrwUqZ982MnP5woGHjUtieklJYrWDH+Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TvVPSJu0qbecAqI/rMsKorhUTN+8QkI820jjKA+hw8=;
 b=OsSPaaPxPUYjZLcnLdOlnV+yU7fClpddrO1GBfXVQy5+dXVV9fcmEs3rK6qV39MrlyqP2SNWKl3a5sJ2x/kOInigyXP/HOzixTmHiozXlPgGj4ipPhXlZ6HH+M0klmLrV1Gvronu4ekTePJSwStUvzMg8XLEUJzt5AytqQpo49F3+OWjvQypCDoN2qDpBl/KbO/03ohPJy0RCP2CsZpVDnBTPHtPXSSTQK9lAALRGjgHGyl34QhZ26jIQdLGjnlS2Cm3GKzH9Mv1NvMgwo19AoKh6H1Cu86ujxy6DrTDtqi3Gp7vprn3f9F/iBRaU2BWT7Elzd3qxL6SCu6BxYoVDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TvVPSJu0qbecAqI/rMsKorhUTN+8QkI820jjKA+hw8=;
 b=xsVqgQvZB2HF+/9t7AS57mKhC47KtHttREiE5zEuQEXUwGo5TnprSf9CfAB2UIeeNFJvJD3CuEWA2+/jHswTcDCVuBEh5z9HuriZRyJ2Owzx22KZ0QMKCYe5Ap1/n6gstY9g2ay2XyJ4FXrydnagufa+stSvWX+b+MBLlP3bO5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f09f25337ef9aa66
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy/1MrSTSJ1VHPeu5EKlXEeQkbb5OInwjTaEU1iAwFfcC1Mz6p4DJtTMbxR/uwoRWmZ1mYvgVWK/4vzxvn7FkDEa8V7e0VOvs69cl2QqJBR262IwncKoy6YSNMzvpAxUcSlE0zWtjnUmwIb/h8LurZdjCN1ObQtm3Pde6VSCZ+Lzq3onsysGXlJpmM0Q28xuGZ9hH50PC68o0W2k/2e8ME933Wm0ixqGe7yJXVdgkBF+e/UDaRCuwjxKVEKrRMf1ubyPvBgmVer/aIeP3sfSl6cw8jWm2o57kQSSosTRBImcyt5FrTvs62ufvaixf3CCSaWAkmk7/EKvrvSPK28QDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TvVPSJu0qbecAqI/rMsKorhUTN+8QkI820jjKA+hw8=;
 b=NExBiG/DeL/w+yo+rSAA3DAcCpMCm+x8AEz2xksg2VckXvRbFCZZgQ8YOb+Vj7wVtSrV4iA/n89C1iueBC4Fycpk9utJfVQGoa1R4CdCPrWXoz8rXkZx/XmERhyVjYpQgBTUZUi9Sok33sSkk9DOe15tlXCClAi0WbKn+q8MsouJBARYLo7Fyum8f3yavAyTJgVYwcrAy3acF9lsj9GGUMRLUZpBQouPRSPRVDbEdgEMlYVGpgsNSOeVu1ia7uYCyj93xSkt7qegUBKrv1/CJV9z0BVAzQEU16myFSXM+Qu6RVaweEyJRJ1IYIneir4L7fsHjKkPjv5Lyhv6Rhi36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TvVPSJu0qbecAqI/rMsKorhUTN+8QkI820jjKA+hw8=;
 b=xsVqgQvZB2HF+/9t7AS57mKhC47KtHttREiE5zEuQEXUwGo5TnprSf9CfAB2UIeeNFJvJD3CuEWA2+/jHswTcDCVuBEh5z9HuriZRyJ2Owzx22KZ0QMKCYe5Ap1/n6gstY9g2ay2XyJ4FXrydnagufa+stSvWX+b+MBLlP3bO5E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXakuWoh6IHqUaokStUp728i61bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAABuwAgAAKeYCAAAnjAIAAC4AA
Date: Wed, 13 Jul 2022 12:12:38 +0000
Message-ID: <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
In-Reply-To: <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d46457ed-e9bd-4762-25c7-08da64c90237
x-ms-traffictypediagnostic:
	AM4PR0802MB2273:EE_|DBAEUR03FT036:EE_|HE1PR0801MB1626:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kxFejmC3iqL4lLjNMLYXHYuxkzzG+dKtL3EwznNN+s9+5y9dMuifVccXgKj7DHs4SSkqIDc+EgpjdJLwVbDy4dEYHZjEL1AUblUuOVb04rRksaLu5v2wFxxYjPDZBlgPgflhngi0Dohj+2UTerzxDNWjQLr500SFzf+rpqDKiU1XLk0N1LR+aR+5kqgCAKPiCw/cUyg2HEVD9YERLxUluqxXT5dZ/YzPQsLqz1MRRyaJcIOeSlh97d0Zoo4xL4rYVIw1hjm28VFjfzdOk6RcqhZo5MOeQ6JBpmVBkRuY6tfzRrN+SJ3yW54A8ot4ddM0+nP+juGwgFHYfZF7NuMi1NL0VcJfq8TYhXETdYDzVxaAK5T4YOeeccfVuFLU3s4/PM/Xo0Y/lTMzsu28IxrLf/4S1PcNWvv1QX8r0SLrQQDN8s12Qne/scYWaq7ASqFx67B2CXm819A7LTPufMXq3XfixIbRBjGFikTuwFj/rzAUf3246eMdrnrMikSB9rAGolkrmOPoEjULXi1hreRk8DHMnh3c29NWPBSIeKdE1UTA0AEoxLozazCTOa+EtKct0WzjolHqgkt//ruxBeadGKtN4HpThXvxMYCLO1Dl2t3iMckZjK7j9Zpfgf86y3aqnxEjGYgV7BhR54RyE9HiQKPDObuqk+NAZMpv0MK5jGdnN9Slt+8RgrhEXfjVnT+Yv4eMR0ypH79712Yk27VAYHMyAYXBHPAtK/isXXrgALdGYCXyHxBnunjGRmcekrCzJFlFhiG9SgqXAmgeavVgSpkTcJzFshDPr1pXVqdo8ZBR1kSNKyx5Pqq9az0i6KdO2k072dti8rzHooUgom852SsYNCkLUOvShXjqi4Qm3c0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(122000001)(38070700005)(71200400001)(86362001)(54906003)(6916009)(66946007)(76116006)(33656002)(316002)(91956017)(4326008)(8676002)(66556008)(38100700002)(26005)(6512007)(66476007)(478600001)(64756008)(6486002)(2616005)(66446008)(53546011)(6506007)(2906002)(5660300002)(41300700001)(186003)(83380400001)(36756003)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F426BB6683CE84FAB5A9515EB1ABE12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2273
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6983b583-6184-4875-3a95-08da64c8fab3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WSLRPhaxy+faLLOTE37yAObw2Jj3Xu+l6ocEozQW23EXvmbmb5hTgp1mFTPmU8wNwx5KF3mt4gO6HiSxKwna5shhaiZ7CXCX4/Nr/7xAqmoFXVgRgVWvf3l8zgoaihEkpygj/DYB41FextW4bv7RkYUz73Fhsh9s1S6ovpnDnny2t5Qmk/vgHdzC4Y/C/FRfNmP+6GzR2OqlCTG2xkcIvLmRFLJdQlpt+skLiWdFtu8FVZEMX+xg+ZI9g9j1GUBFJAIFkPR88fyKaPjufCKOcro1vjvrYAvCGGd0RPKOKFvLO26aLtS9ON1Gs2JHWsGYny+yvU/O1m4iql8MC8ZO/QG+9FQats7Uc359rh0dgXkgZm88zsATUU1PQI8VewxxlpvNqVw+q2uPNdtJiz0UsvZovjZmn+OlF+BQ/ee9ukGEnVP28Q6GvzzIH3DIliRmytyN3gumCrSq7GITiPoZiv4nz4evKV13eZyAMtjpOoB3aYhOlW8zzqOKqy70LINr14+a200/YTDglfLDXg0kYZxyp5HQHq7AUK6wOrRvX/coEWLn/mMhgQ4vsGKn0k+wFqf4kE7Qe3XRf6F9ZsLqhN2qT/8W0CD4bFbrR0DYzAJHGIpqh9EAL7whD/NfHYJuJ/pzlCliVQ3IO+7SxZ2ixvy61elvZCFlTM2OGUC2TSRfA/cItmn9inSjI75C50Z5N1GDcUpsO+aoiJX2ZWczmAXIe1VWayrIrKQ9t0zyp2k1H4/skegfAxZYrwu+WHYDdNYDZt12GNAt7puc1kl00eyzyKZaUe1UMHVtzvb9g1Jdluen8DUef5YUVgPtlPvg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(40470700004)(6862004)(478600001)(2616005)(86362001)(54906003)(26005)(8936002)(53546011)(4326008)(70586007)(6512007)(8676002)(70206006)(356005)(5660300002)(41300700001)(82740400003)(81166007)(316002)(6486002)(33656002)(47076005)(40460700003)(336012)(2906002)(40480700001)(83380400001)(36860700001)(186003)(82310400005)(6506007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 12:12:51.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d46457ed-e9bd-4762-25c7-08da64c90237
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1626

SGksDQoNCj4gT24gMTMgSnVsIDIwMjIsIGF0IDEyOjMxLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEphbiwNCj4gDQo+IE9uIDEzLzA3LzIwMjIgMTE6NTYs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTMuMDcuMjAyMiAxMjoxOCwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4+IE9uIDEzLzA3LzIwMjIgMTA6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
PiBPbiAxMy4wNy4yMDIyIDExOjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBPbiAxMy8w
Ny8yMDIyIDA3OjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+IEZvciB0aGUgRklGTyBp
c3N1ZSwgd2UgY2FuIGludHJvZHVjZSB0aGUgbmV3IGNvbmZpZyBvcHRpb24gdG8gcmVzdHJpY3Qg
dGhlIG1heGltdW0gbnVtYmVyIG9mIHN0YXRpYw0KPj4+Pj4+Pj4gcG9ydCBzdXBwb3J0ZWQgaW4g
WGVuLiBXZSBjYW4gY2hlY2sgdGhlIHVzZXItZGVmaW5lZCBzdGF0aWMgcG9ydCB3aGVuIHdlIHBh
cnNlIHRoZSBkZXZpY2UgdHJlZSBhbmQgaWYNCj4+Pj4+Pj4+IGEgdXNlci1kZWZpbmVkIHN0YXRp
YyBwb3J0IGlzIGdyZWF0ZXIgdGhhbiB0aGUgbWF4aW11bSBhbGxvd2VkIHN0YXRpYyBwb3J0IHdp
bGwgcmV0dXJuIGFuIGVycm9yIHRvIHRoZSB1c2VyLg0KPj4+Pj4+Pj4gSW4gdGhpcyB3YXksIHdl
IGNhbiBhdm9pZCBhbGxvY2F0aW5nIGEgbG90IG9mIG1lbW9yeSB0byBmaWxsIHRoZSBob2xlLg0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBMZXQgbWUga25vdyB5b3VyIHZpZXcgb24gdGhpcy4NCj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4gY29uZmlnIE1BWF9TVEFUSUNfUE9SVA0KPj4+Pj4+Pj4gaW50ICJNYXhp
bXVtIG51bWJlciBvZiBzdGF0aWMgcG9ydHPigJ0NCj4+Pj4+Pj4+IHJhbmdlIDEgNDA5NQ0KPj4+
Pj4+Pj4gaGVscA0KPj4+Pj4+Pj4gQ29udHJvbHMgdGhlIGJ1aWxkLXRpbWUgbWF4aW11bSBudW1i
ZXIgb2Ygc3RhdGljIHBvcnQgc3VwcG9ydGVkDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGUgcHJvYmxl
bSBpcyBub3QgZXhjbHVzaXZlIHRvIHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbC4gU28gSSBkb24n
dA0KPj4+Pj4+PiB0aGluayB0aGlzIGlzIHJpZ2h0IHRvIGludHJvZHVjZSBNQVhfU1RBVElDX1BP
UlQgdG8gbWl0aWdhdGUgdGhlIGlzc3VlDQo+Pj4+Pj4+IChldmVuIHRob3VnaCB0aGlzIGlzIHRo
ZSBvbmx5IHVzZXIgdG9kYXkpLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gQSBmZXcgb2YgYWx0ZXJuYXRp
dmUgc29sdXRpb25zOg0KPj4+Pj4+PiAxKSBIYW5kbGUgcHJlZW1wdGlvbiBpbiBhbGxvY19ldnRj
aG5fYnVja2V0KCkNCj4+Pj4+Pj4gMikgQWxsb2NhdGUgYWxsIHRoZSBidWNrZXRzIHdoZW4gdGhl
IGRvbWFpbiBpcyBjcmVhdGVkICh0aGUgbWF4DQo+Pj4+Pj4+IG51bWJlcnMgZXZlbnQgY2hhbm5l
bCBpcyBrbm93bikuIFdlIG1heSBuZWVkIHRvIHRoaW5rIGFib3V0IHByZWVtcHRpb24NCj4+Pj4+
Pj4gMykgVHdlYWsgaXNfcG9ydF92YWxpZCgpIHRvIGNoZWNrIGlmIHRoZSBidWNrZXQgaXMgdmFs
aWQuIFRoaXMgd291bGQNCj4+Pj4+Pj4gaW50cm9kdWNlIGEgY291cGxlIG9mIGV4dHJhIG1lbW9y
eSBhY2Nlc3MgKG1pZ2h0IGJlIE9LIGFzIHRoZSBidWNrZXQNCj4+Pj4+Pj4gd291bGQgYmUgYWNj
ZXNzZWQgYWZ0ZXJ3YXJkcykgYW5kIHdlIHdvdWxkIG5lZWQgdG8gdXBkYXRlIHNvbWUgdXNlcnMu
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBBdCB0aGUgbW9tZW50LCAzKSBpcyBhcHBlYWxpbmcgbWUgdGhl
IG1vc3QuIEkgd291bGQgYmUgaW50ZXJlc3RlZCB0bw0KPj4+Pj4+PiBoYXZlIGFuIG9waW9uaW9u
cyBmcm9tIHRoZSBvdGhlciBtYWludGFpbmVycy4NCj4+Pj4+PiANCj4+Pj4+PiBGd2l3IG9mIHRo
ZSBuYW1lZCBhbHRlcm5hdGl2ZXMgSSB3b3VsZCBhbHNvIHByZWZlciAzLiBXaGV0aGVyIHRoaW5n
cw0KPj4+Pj4+IHJlYWxseSBuZWVkIGdlbmVyYWxpemluZyBhdCB0aGlzIHBvaW50IEknbSBub3Qg
c3VyZSwgdGhvdWdoLg0KPj4+Pj4gSSBhbSB3b3JyeSB0aGF0IHdlIG1heSBlbmQgdXAgdG8gZm9y
Z2V0IHRoYXQgd2UgaGFkIG5vbi1nZW5lcmFpYyB3YXkNCj4+Pj4+IChlLmcuIE1BWF9TVEFUSUNf
UE9SVCkgdG8gcHJldmVudCB0cmlnZ2VyIHRoZSBpc3N1ZS4gU28gd2UgY291bGQgZW5kIHVwDQo+
Pj4+PiB0byBtaXN0YWtlbmx5IGludHJvZHVjZSBhIHNlY3VyaXR5IGlzc3VlLg0KPj4+Pj4gDQo+
Pj4+PiBIb3dldmVyLCBteSBwb2ludCB3YXMgbGVzcyBhYm91dCBnZW5lcmFsaXphdGlvbiBidXQg
bW9yZSBhYm91dA0KPj4+Pj4gaW50cm9kdWNpbmcgQ09ORklHX01BWF9TVEFUSUNfUE9SVC4NCj4+
Pj4+IA0KPj4+Pj4gSXQgc2VlbXMgc3RyYW5nZSB0byBsZXQgdGhlIGFkbWluIHRvIGRlY2lkZSB0
aGUgbWF4aW11bSBudW1iZXIgb2Ygc3RhdGljDQo+Pj4+PiBwb3J0IHN1cHBvcnRlZC4NCj4+Pj4g
DQo+Pj4+IFdoeSAoYXNzdW1pbmcgcy9hZG1pbi9idWlsZCBhZG1pbi8pPyBJIHZpZXcgYm90aCBh
IGJ1aWxkIHRpbWUgdXBwZXIgYm91bmQNCj4+Pj4gYXMgd2VsbCBhcyAoYWx0ZXJuYXRpdmVseSkg
YSBjb21tYW5kIGxpbmUgZHJpdmVuIHVwcGVyIGJvdW5kIGFzIHJlYXNvbmFibGUNCj4+Pj4gKGlu
IHRoZSBsYXR0ZXIgY2FzZSB0aGVyZSBvZiBjb3Vyc2Ugc3RpbGwgd291bGQgd2FudC9uZWVkIHRv
IGJlIGFuIHVwcGVyDQo+Pj4+IGJvdW5kIG9uIHdoYXQgaXMgbGVnaXRpbWF0ZSB0byBzcGVjaWZ5
IGZyb20gdGhlIGNvbW1hbmQgbGluZSkuIFVzaW5nDQo+Pj4+IHN0YXRpYyBwb3J0cyBhZnRlciBh
bGwgbWVhbnMgdGhlcmUncyBhIHN0YXRpYyBsYXJnZXN0IHBvcnQgbnVtYmVyLg0KPj4+PiBEZXRl
cm1pbmVkIGFjcm9zcyBhbGwgaW50ZW5kZWQgdXNlcyBvZiBhIGJ1aWxkIHN1Y2ggYW4gdXBwZXIg
Ym91bmQgY2FuIGJlDQo+Pj4+IGEgZmVhc2libGUgbWVjaGFuaXNtLg0KPj4+IA0KPj4+IEFGQUlD
VCwgdGhlIGxpbWl0IGlzIG9ubHkgaGVyZSB0byBtaXRpZ2F0ZSB0aGUgcmlzayB3aXRoIHRoZSBw
YXRjaCBJDQo+Pj4gcHJvcG9zZWQuIFdpdGggYSBwcm9wZXIgZml4LCB0aGUgbGltaXQgd291bGQg
YmUgYXJ0aWNpYWwgYW5kIHRoZXJlZm9yZQ0KPj4+IGl0IGlzIG5vdCBjbGVhciB3aHkgdGhlIGFk
bWluIHNob3VsZCBiZSBhYmxlIHRvIGNvbmZpZ3VyZSBpdCAoZXZlbg0KPj4+IHRlbXBvcmFyaWx5
KS4NCj4+IFRoZSBsaW1pdCB3b3VsZCBiZSBhcyBhcnRpZmljaWFsIGFzIG90aGVyIGxpbWl0cyB3
ZSBlbmZvcmNlLiANCj4gDQo+IFlvdSBhcmUgcmlnaHQuIEJ1dCB3ZSBuZWVkIHRvIGJlIGNhdXRp
b3VzIGluIGFkZGluZyBuZXcgb25lIHRoYXQgb3ZlcmxhcHMgd2l0aCBleGlzdGluZyBvbmUuDQo+
IA0KPj4gSSBjYW4ndA0KPj4gc2VlIHdoeSBpdCB3b3VsZCBiZSB3cm9uZyB0byBoYXZlIGEgbW9y
ZSB0aWdodCBsaW1pdCBvbiBzdGF0aWMgcG9ydHMNCj4+IHRoYW4gb24gdHJhZGl0aW9uYWwgKCJk
eW5hbWljIikgb25lcy4gRXZlbiBpZiBvbmx5IHRvIG1ha2Ugc3VyZSBzbw0KPj4gbWFueSBkeW5h
bWljIG9uZXMgYXJlIGxlZnQuDQo+IA0KPiBUaGlzIGlzIHNpbWlsYXIgdG8gWGVuIGZvcmJpZGRp
bmcgdG8gY2xvc2UgYSBzdGF0aWMgcG9ydDogaXQgaXMgbm90IHRoZSBoeXBlcnZpc29yIGJ1c2lu
ZXNzIHRvIGNoZWNrIHRoYXQgdGhlcmUgYXJlIGVub3VnaCBldmVudCBjaGFubmVsIHBvcnRzIGZy
ZWVkIGZvciBkeW5hbWljIGFsbG9jYXRpb24uDQoNCk9uIG90aGVyIHNpZGUgd2UgbmVlZCB0byBi
ZSBjYXV0aW91cyBub3QgdG8gYWRkIHRvbyBtdWNoIGNvbXBsZXhpdHkgaW4gdGhlIGNvZGUgYnkg
dHJ5aW5nIHRvIG1ha2UgdGhpbmdzIGFsd2F5cyBtYWdpY2FsbHkgd29yay4NCklmIHlvdSB3YW50
IFhlbiB0byBiZSBhY2Nlc3NpYmxlIHRvIG5vbiBleHBlcnQgYnkgbWFnaWNhbGx5IHdvcmtpbmcg
YWxsIHRoZSB0aW1lLCB0aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiB3b3JrIHRvIGRvLg0KDQpDaGVl
cnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwN
Cg0K

