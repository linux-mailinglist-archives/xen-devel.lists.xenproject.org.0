Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827434107E2
	for <lists+xen-devel@lfdr.de>; Sat, 18 Sep 2021 19:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189938.339815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mReN4-0001Xw-Bs; Sat, 18 Sep 2021 17:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189938.339815; Sat, 18 Sep 2021 17:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mReN4-0001Um-7z; Sat, 18 Sep 2021 17:43:26 +0000
Received: by outflank-mailman (input) for mailman id 189938;
 Sat, 18 Sep 2021 16:05:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxcA=OI=oracle.com=alec.r.brown@srs-us1.protection.inumbo.net>)
 id 1mRcpr-00071J-KH
 for xen-devel@lists.xenproject.org; Sat, 18 Sep 2021 16:05:03 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2df376b8-189a-11ec-b7af-12813bfff9fa;
 Sat, 18 Sep 2021 16:05:01 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18IFV1CH008193; 
 Sat, 18 Sep 2021 16:04:18 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b56w295na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Sep 2021 16:04:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18IG01oF100752;
 Sat, 18 Sep 2021 16:04:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3020.oracle.com with ESMTP id 3b57ek8p4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Sep 2021 16:04:16 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com (2603:10b6:5:6b::26) by
 DM6PR10MB4299.namprd10.prod.outlook.com (2603:10b6:5:216::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Sat, 18 Sep 2021 16:04:13 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::8974:894e:1c4b:35d0]) by DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::8974:894e:1c4b:35d0%7]) with mapi id 15.20.4500.014; Sat, 18 Sep 2021
 16:04:13 +0000
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
X-Inumbo-ID: 2df376b8-189a-11ec-b7af-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=xbrB7To9cV7w66tQJVgfX7XDn/uoZN2YFAi+ilQyqMY=;
 b=MgiwZs0z2KHWYNekBa6uzgbRCb0+lDcbNCxELCxvelEVV2CNo8cV0wCZd6KS2lVcyq4g
 TDY4kShlSiSUzzngJQ9jYWxghnlUM9axaiUO6Oh7PjSoNuT+VnEJcwu0BSDQJEBk/wwg
 mbOUOwgh9Ks7uniqKLBcR0ExDarwTV1TK8YYnGJ8KVEKBYt9bqTMKPircWXKTpqr6bQs
 6n+sDWu7/gzDI2QCPbY5wenFlAF23i+5tzL+zBSFA0Y0zPMO4dvsy10tkD5CwQUaL2Ma
 R/Nnpx/l0ph/pEIi5/6qPuF5fTBswYC73Vm58aQbggKJ/OLsyIC/Y5MF6/zNUX6l02Zw ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=xbrB7To9cV7w66tQJVgfX7XDn/uoZN2YFAi+ilQyqMY=;
 b=xXa4pr1tsCr9NEuRLBKi/kKEovBLb6yyl0nNUPT2dkLY4nCI1kGDxYDy01zlQtOKl2B1
 JVDLX/t1AS3gccF8gbu3f++be3Cs+zSSQCFck7QvwJED+b8PyXJ3tuXkSNSX2Ev7htge
 QrFKCTOWDXZ5zAr5kPq4lJWHws3SWWw0k637rjhIcnkQ7CLsZsMRgVrAIWzBmTzONOdE
 kZDRNWIhh565TdJZmCYgX5MltSnSOT6tlaMVspbcaKX4ygjysnJNtNIDnyMQtw04Nrjv
 L++/c2ngqDbKYtULngtLgz+d9ixuvRXJKSKaIiGpsz3A7E+mMsdhK/hrALgloufBsAqA vQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFoP/wqpMqTCqdObRP9HZtgbfW4mjeujv+l3lEZzKqfJWbj1LhpF0Zt1wrU3GvhlYsHunm9feUJd/tlggjvEJi8Tw5xn3D+z/hy3QPRT4V63PGSAx1HfwwPIvkatGAbUkjIPsRQUNqHJMuRggQqIOO4xV+CLcQnLV2jiD5Tt7YgxOIufYRWTj3E1xFyGSySK2sx0t5/jTxZj0pVlQ+2nJlYy5B0mB9o2AV1mWJMuats72T7z1lQHDeDmQmDP8i7rd3NWy7cCzlBn56mnXio8MuSogTXaY0UTmwlTACDp7tpeooUJeVUna0Aa4/+AsxA2weUV5j/CWIueBPn3vBKTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xbrB7To9cV7w66tQJVgfX7XDn/uoZN2YFAi+ilQyqMY=;
 b=KmCTcgaERDqyqfsjiEOeKkmnXj4J8LQMIAELN0Mq2nGKTrd5EzIhrqz9ai4AcRk4B0ufpDG2xvNXJo3wqSCMsIR4QL6ZwLik26DlXHwVY1w7TMNd9pjt3rReqvihX+cx0Z4QWutAK7jAA7p5kmiGoc0FKQFCPpHR6NzQwenc7cfoEnYMibBlHxOhWr5LwjZVlSw4yHQMPX9yUmkpTRmhDbFzEJ8Rz6on7cV0ZeZge8TGV6DEFrUvBSzKz2fwh587caenNSZXnxOOKRpJIN/m3j+B3NFs35hXU8+ELUgK6Me09+oST0kPzWLLwWlQkgzqWt8k2dtZZPBoWaOOkjAEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbrB7To9cV7w66tQJVgfX7XDn/uoZN2YFAi+ilQyqMY=;
 b=J00NYJ9PjDv86A6oRcsPXkbDO2la+ss8rFddUIqy/ZKDFTo3f2NUVUhqJIRKRUHNco3X1dghm7SsC6ZlIYsoj18dgQuRG6J7XEKea3l9xv2u+7Dc3rd3DkkO7zY/P4AkBVeFLxX6166tZ36HhgYWtllbW2+H4YxETTsWQh7rcH8=
From: Alec Brown <alec.r.brown@oracle.com>
To: "coreboot@coreboot.org" <coreboot@coreboot.org>,
        "grub-devel@gnu.org"
	<grub-devel@gnu.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "systemd-devel@lists.freedesktop.org"
	<systemd-devel@lists.freedesktop.org>,
        "trenchboot-devel@googlegroups.com"
	<trenchboot-devel@googlegroups.com>,
        "u-boot@lists.denx.de"
	<u-boot@lists.denx.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alec Brown <alec.r.brown@oracle.com>,
        Aleksandr Burmashev
	<alexander.burmashev@oracle.com>,
        "allen.cryptic@gmail.com"
	<allen.cryptic@gmail.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "btrotter@gmail.com" <btrotter@gmail.com>,
        Daniel Kiper
	<daniel.kiper@oracle.com>,
        "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>,
        Eric DeVolder <eric.devolder@oracle.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        "frowand.list@gmail.com"
	<frowand.list@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "hun@n-dimensional.de" <hun@n-dimensional.de>,
        "james.dutton@gmail.com"
	<james.dutton@gmail.com>,
        "javierm@redhat.com" <javierm@redhat.com>,
        Joao
 Martins <joao.m.martins@oracle.com>,
        "jwerner@chromium.org"
	<jwerner@chromium.org>,
        Kanth Ghatraju <kanth.ghatraju@oracle.com>,
        Konrad
 Wilk <konrad.wilk@oracle.com>,
        "krystian.hebel@3mdeb.com"
	<krystian.hebel@3mdeb.com>,
        "leif@nuviainc.com" <leif@nuviainc.com>,
        "lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>,
        "luto@amacapital.net" <luto@amacapital.net>,
        "michal.zygowski@3mdeb.com"
	<michal.zygowski@3mdeb.com>,
        "mjg59@google.com" <mjg59@google.com>,
        "mtottenh@akamai.com" <mtottenh@akamai.com>,
        "nico.h@gmx.de" <nico.h@gmx.de>,
        "phcoder@gmail.com" <phcoder@gmail.com>,
        "piotr.krol@3mdeb.com"
	<piotr.krol@3mdeb.com>,
        "pjones@redhat.com" <pjones@redhat.com>,
        "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
        "rasmus.villemoes@prevas.dk"
	<rasmus.villemoes@prevas.dk>,
        "rdunlap@infradead.org"
	<rdunlap@infradead.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Ross
 Philipson <ross.philipson@oracle.com>,
        "sjg@chromium.org" <sjg@chromium.org>,
        "trini@konsulko.com" <trini@konsulko.com>,
        "tyhicks@linux.microsoft.com"
	<tyhicks@linux.microsoft.com>,
        "ulrich.windl@rz.uni-regensburg.de"
	<ulrich.windl@rz.uni-regensburg.de>,
        "wvervoorn@eltan.com"
	<wvervoorn@eltan.com>,
        "xypron.glpk@gmx.de" <xypron.glpk@gmx.de>,
        "rharwood@redhat.com" <rharwood@redhat.com>
Subject: [SPECIFICATION RFC v3] The firmware and bootloader log specification
Thread-Topic: [SPECIFICATION RFC v3] The firmware and bootloader log
 specification
Thread-Index: Adeso0zdR7rpvUcgTOKp4wEL6mxamA==
Date: Sat, 18 Sep 2021 16:04:13 +0000
Message-ID: 
 <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: coreboot.org; dkim=none (message not signed)
 header.d=none;coreboot.org; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92a6c0a8-fbd8-45b6-3a09-08d97abdf59a
x-ms-traffictypediagnostic: DM6PR10MB4299:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DM6PR10MB42998D247186AA97716DB268BCDE9@DM6PR10MB4299.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +XeejkzqCerWKQ4kFG7sw+qGeW6H7YE4gqehBjPAbztFx9u74MMmmqwQGmyC818XJSHq40Zqaau/BzPmOOlLX9QQxBwFkO8jRVfcvQRZPcULuk3UpwbhP4zQJRVe0VwGvxoYHocuLlxtwz9R4uGT0Q1Le7Vr9gErz2n3X1eECVbAwh0jUTL9MOo1BmIsN6JJbSaDyZO6fFuBkseJ8QOvoAL5mn6ZQDXDgjTD1m8qlgSEiqcwSIRIjRZyURUPWP2UW1f+azuc4h2tazdOsOmf3lNH7KoCf2iH6xiuxhqgsNNzRsl4kXktnjtrphC9J7oxChDLdOHSXT4OKaFdRNx6ugocAfAt7ttJzFcLcR59v3+ySR/JRwIAjnwcX71PZ1MDpF9W+Lh8HCDY7Gu1MlBgfuLOGdkASQgsrU9Yw/5l9kjpcc8r7OGYDiQp0nsuaIE+acw9uz7EFqXzqNmmtK4mAdM9YlDH0Ww5l5zQALhOFBi3KEjYUTAn5V8N6Ra8O+dXWtdyrf3e5zdDwuPA5hGIJDg10F4Tg/wK8eYi213Bmu6UuHpAR6g16UJGD80Rk1wxOxYgWCsk5+ZtKlNqMxf+juI94a48mKh9+TpzEo1q8AjNHLOh7yIM8BFh/hW5VIsmqxGFtWxGmuhCRzFQCFGaYTy7degb0YaO7xSGylFDk1IyTRZlPSpf5RfBUZG+Z7i86n60CWkIhO0pOEk+KAqdtIa3GJMVENNVbXuCHOS+lSOeNA+xSp8Url/pe1b1zzlNxM6scvAV1r68izlRVF/7ewh7xVUpOujLAD/xgPYLPh63GJSxz5meoeCxZ1XL4tYag57xnZFkyE/fgBlpqYD3Cg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2986.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(8676002)(54906003)(122000001)(186003)(64756008)(76116006)(66556008)(66476007)(83380400001)(508600001)(66946007)(7696005)(6506007)(316002)(71200400001)(38100700002)(26005)(66446008)(38070700005)(7406005)(2906002)(5660300002)(110136005)(86362001)(966005)(9686003)(33656002)(52536014)(55016002)(8936002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IBEYD651bZBh5kYu6KQAC3eBK5Ec5wXHi2aWQgoRNC6gPRPk7/I9whbMWa9g?=
 =?us-ascii?Q?rojXotSQxAmmk277+XwBpOh9jJ5VlJ820R1EPzd+SNODtFtWdwHV0QsEiA7/?=
 =?us-ascii?Q?CvOyCgrT86WBHCS3gdlfzQp1PYknUOSP02AjJlfxOZhpAO+AccYwje7Jni4u?=
 =?us-ascii?Q?ZMt01gqrEjVjamo8Sg4y75MIK9w6ts9aUvN0mGvSWOXKkuIJvUI20d7JXHKg?=
 =?us-ascii?Q?AjdT9idJrsL21R0aMWh2arpIyieNXjAdKp55suljiPUHlZbqI4A2jtdU7Ikw?=
 =?us-ascii?Q?nyuzHU2oqXT5QRgi4XTLJY+XVUVjlgX8ZImtT479VDdrVvA1qezOdTnlNRz5?=
 =?us-ascii?Q?M9eCxZz6+4hE0vB0477W6ZzuQjSilVF5Wbfz/4wBjZmrTCs9HnvrLQAUQoeJ?=
 =?us-ascii?Q?NgiYY/oLz9D4iV62YmJKkszUZa7Q/rQ+697BCqGadfAqspymlQ4D9HTIJ4qM?=
 =?us-ascii?Q?Qlyd+emaHMZYrHiHL8gG6XK6NuTIBRJboDe9pOIjmp5BY5WLiYMDxpAuv56C?=
 =?us-ascii?Q?YF99JGFVpxXZD9aft4l/cJw6mM79cE2iOl4u0qLLUhHpCeICWMi5dTEw8+hc?=
 =?us-ascii?Q?oMmPNCODwYEvcYZd1ffxnhnz9UpzRLfkuKZG4k5SvH8J0NaPDg9NSUsQf02P?=
 =?us-ascii?Q?vNpmx6ECRDdnTojSb8tcuMa0/zaF0+1s8ZfphVFkSykaTBd5DCybd2PeXCli?=
 =?us-ascii?Q?YNrxFM1+2wuYZKOvrU+kkcdYbqVby0S5LL8OaMlliT3rqDf6br8hv+HHyE6f?=
 =?us-ascii?Q?r73YWRQcmIW3QdWC5aSgIPw2ZzynWyEQ7vSYca2Epj26GWqR4hrYZwzzmu0x?=
 =?us-ascii?Q?OjZDUsPXswjZpkMSVdeXfzGYbu4VCr8D9O7+0DOs8xCeFWK7KSbN5VanQABu?=
 =?us-ascii?Q?g1i6x6DAlXFCkmRPgOwPMwLeMjs/rij/yyT2shHobugGoovGN/IY9ZtsR12w?=
 =?us-ascii?Q?iQd6v7HZQKcCSnrGpGJ6sV2dbv4drtThMbKX5P+nSsL38l1fr0wbeNDwxoPT?=
 =?us-ascii?Q?CqMFv/ZPTy4ejdZGdMjcwSsMoOa8y4rcYhtMRq9Tlx9v4XOzAWfJ+6rx2rF7?=
 =?us-ascii?Q?fftA6zAmVojq8JS5h1AVoQeU2tpgWTWy3hMSW+wJic2rjm8oYQdnywVJjqQj?=
 =?us-ascii?Q?QBuEnoN18B+UFa82aKOA+q7oecP+gm9vp+M216IDHWHGWe1lqbCDl4NPZS+F?=
 =?us-ascii?Q?R2UrjqQSWO89PtvEt7/cJoQYA9Uu7BPZA4JIqFIqcqssQRB0FTbAuOQ3CCzD?=
 =?us-ascii?Q?6lpjRLP/UiZefG6xK5aAfLLMXPDb2lY1W7fDhR1r/8Rt059KOjnU/k+u/uKa?=
 =?us-ascii?Q?fnE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2986.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a6c0a8-fbd8-45b6-3a09-08d97abdf59a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2021 16:04:13.5360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgjUFwIwcbFqVjxgocOeNHvJXRb3scmDXxPPxaAQ6OPOrHO7LrA8AtEGh3ogqrn22xAorrG81pVCKqd5DLRDQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4299
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10111 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109180114
X-Proofpoint-ORIG-GUID: BzC4zYK0BxX4Eu679X5ckd50UaCuzhOC
X-Proofpoint-GUID: BzC4zYK0BxX4Eu679X5ckd50UaCuzhOC

Hi everyone,

I've been working on improving the specification for the firmware and bootl=
oader
log that Daniel Kiper has proposed and take into account most of the sugges=
tions
that were made in these threads [1], [2].

The goal is to allow various boot components to pass logs to the running OS=
 and
then to the user space for processing and analysis. These logs should be ge=
neric
enough so that it can work in multiple environments and be human readable.

It has yet to be decided where to put the final version of this specificati=
on.
It should be merged into an existing specification, e.g. UEFI, ACPI, Multib=
oot2,
or be standalone, such as a part of OASIS Standards.

Below is how the layout of these logs would store their data.

bf_log_header:
               +-------------------+
u32            | version           |
u32            | size              |
u8[64]         | producer          |
u8[64]         | log_format        |
u64            | flags             |
u64            | next_bflh_addr    |
u64            | log_addr          |
u32            | log_size          |
               +-------------------+

bf_log_buffer:
               +-------------------+
u32            | version           |
u32            | size              |
u8[64]         | producer          |
u32            | next_msg_off      |
bf_log_msg[l]  | msgs              |
               +-------------------+

bf_log_msg:
               +-------------------+
u32            | size              |
u64            | ts_nsec           |
u32            | level             |
u32            | facility          |
u32            | msg_off           |
u8[n]          | type              |
u8[m]          | msg               |
               +-------------------+

Where l is the number of msgs, n is the size of type, and m is the size of =
the
msg.

The bf_log_header structure forms a linked list. Each bf_log_header element=
 in
the linked list points to the individual log buffer and the next bf_log_hea=
der
element in the linked list. The first element in the linked list points to =
the
last boot component in the boot chain. The last element points to the start=
ing
boot component in the boot chain. The log buffers which contain the log
messages are produced by the various boot components, typically from the
firmware to the bootloader. The log message is stored in a log format that =
is
compatible with the boot component that produced it.

The fields in bf_log_header structure:
  - version: the firmware and bootloader log header version number, 1 for n=
ow,
  - size: the size of the bf_log_header to allow for backward compatibility=
 if=20
    other fields are added,
  - producer: the producer/firmware/bootloader/... entity, NUL terminated
    string, e.g. GRUB, Coreboot; the length allows for ASCII UUID storage,
  - log_format: the format used to record the log messages, NUL terminated
    string, e.g. bf_log_msg, cbmem_cons, etc.; various producers may genera=
te
    logs in various formats if needed,
  - flags: bit field used to store information about the log state, if bit =
0 has
    been set it means the log was truncated,
  - next_bflh_addr: the physical address of the next bf_log_header structur=
e,
    none if zero,
  - log_addr: the physical address of where the log buffer is stored,
  - log_size: the total size of the log buffer.

The bf_log_buffer is used to store log messages from the firmware and
bootloader. This format for storing messages is called the bf log format. T=
he
bf_log_buffer contains the header information of the bf log format with the=
 log
messages being stored in an array of bf_log_msg messages.

The fields in bf_log_buffer structure:
  - version: the firmware and bootloader log version number, 1 for now,
  - size: the total allocated space for the bf_log_buffer including the log
    messages stored in msgs,
  - producer: the producer/firmware/bootloader/... entity, NUL terminated
    string, e.g. GRUB, Coreboot; the length allows for ASCII UUID storage; =
same
    as the field in bf_log_header,
  - next_msg_off: the byte offset from the beginning of the allocated space=
 for
    bf_log_buffer to the next byte after the last bf_log_msg in msgs,
  - msgs: the array of log messages stored in the bf_log_msg structures.

The fields in bf_log_msg structure:
  - size: the total size of the bf_log_msg entry,
  - ts_nsec: the timestamp in nanoseconds starting from 0 (zero); the produ=
cer
    using this log format defines the meaning of 0,
  - level: similar to the syslog meaning; used to differentiate normal log
    messages from debug log messages, but the exact interpretation depends =
on
    the producer,
  - facility: similar to the syslog meaning; used to differentiate the sour=
ces
    of the log messages, but the exact interpretation depends on the produc=
er,
  - msg_off: the byte offset which the msg field starts in bf_log_msg,
  - type: the log message type; similar to facility but NUL terminated stri=
ng
    instead of integer, but the exact interpretation depends on the produce=
r,
  - msg: the log message, NUL terminated string.

In bf_log_msg, the producers are free to use or ignore any of the level,
facility, and type fields. If level or facility are ignored, they should be=
 set
to 0. If type is ignored, it should be set to an empty NUL terminated strin=
g.

Since it doesn't seem possible to have each boot component using the same l=
og
format, we added a log_format and log_phys_addr fields to give flexibility =
in
how logs are stored. An example of a different log format that can be used =
is
the cbmem_console log format used by coreboot:

cbmem_console:
               +-------------------+
u32            | size              |
u32            | cursor            |
u8[m]          | body              |
               +-------------------+

There is still the outstanding issue of how the logs will be sent to the OS=
. If
UEFI is used, we can use config tables. If ACPI or Device Tree is used, we =
can
use bf_log_header.next_bflh_addr to present the logs. If none of these plat=
forms
are used, it becomes a lot trickier to solve this issue.

Any suggestions are much appreciated and will be taken into consideration.

I will be presenting this work at the LPC System Boot and Security
Micro-conference on the 22nd of September at 7:50 AM PDT (14:50 UTC). Come =
and
join if you want to discuss the design. The schedule for the System Boot an=
d
Security Micro-conference can be found here [3].

Thanks!
Alec Brown

[1] https://lists.gnu.org/archive/html/grub-devel/2020-11/msg00100.html
[2] https://lists.gnu.org/archive/html/grub-devel/2020-12/msg00021.html
[3] https://linuxplumbersconf.org/event/11/sessions/116/#20210922

