Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D6588AAB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379762.613507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBl2-00047G-Jw; Wed, 03 Aug 2022 10:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379762.613507; Wed, 03 Aug 2022 10:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBl2-000455-Gc; Wed, 03 Aug 2022 10:37:44 +0000
Received: by outflank-mailman (input) for mailman id 379762;
 Wed, 03 Aug 2022 10:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjlV=YH=citrix.com=prvs=207c5e48b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJBl0-00044z-FI
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:37:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b77cd50-1318-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 12:37:40 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2022 06:37:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6688.namprd03.prod.outlook.com (2603:10b6:806:21f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Wed, 3 Aug
 2022 10:37:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:37:32 +0000
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
X-Inumbo-ID: 4b77cd50-1318-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659523060;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lg2cn7gmgcd7Gxlp/Dtid7qxSjdeE17X1PqY/KZZDjE=;
  b=VCYGwJIVcWfG7B4QaXGwSgYDXE8HGfyh7Rfr7w/BCw+rk2p3K7BKRsTP
   GqqNf2bPRbzfsgqR6tOTZjMeFhV9k0dYc26LDrCgNt4BWIKZO6zqT9TVj
   7P3dUT4TnS4uN+WirKaJfli7CDnCggi5f4N0vTum82Earc6jmNaI5zFSb
   s=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 79818381
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:93P5R6zgWqBt7eEHhN96t+coxyrEfRIJ4+MujC+fZmUNrF6WrkUPm
 DcdWmuAbvmIYmL2edx+boq+/EpT7cLcyNBrHQtoqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Es05K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1MFgYLfq87wdpGImFhr
 sYlCDURYSq60rfeLLKTEoGAh+wFBeyzZsYknCglyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSgNWECwL6WjfNfD2z75Qp9yrXydvHSfcSHX559lUeEv
 GPWuW/+B3n2MfTAmGrcoin834cjmwunfKECLbO/scQwgW2VwEohURkUVEuC9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8/AKxFmUCCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2IB5UlqY/7aQ6Ci0YCETJGpaPyscF1NZuZ/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:/l81dajZ8OaboyrDm+vQDCPZ43BQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="79818381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCJgkN22sEUTSWxhh+CIgkASVgEk+MplLjtXGT+RxP4C0fCF0ZIG8EMicZvwe2TftH5VW4K9lbjqFYGbnLNYAYgyAde92ASD/50nO/sLkndPmxpRjixPHdOyIHyceGVC9o1JXoccgSu/xcVAt3cx1BkYOuC5p4RkWY6qGFj9FDcj2nAnA+BSWKTD1k1jH7ot43zCM/DEsIVMYg5gYf4uPAfJccoSfISUv2eN7CtencAqtfHvEgg3V+4aVqTPzaYzVeI6p79gPpBJtAidbk2VOG33jWwRGpmrBV/FrFzcWwOvVMVSeEeQytAuqQCXmPJF6xQZ+p8utJnmDI5YuYoMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg2cn7gmgcd7Gxlp/Dtid7qxSjdeE17X1PqY/KZZDjE=;
 b=g408588vXxEaGbSlG33ZEPuitUeqJThuQ5lcanhWOxCBbeFzJZ5W0UkEMvUGSP+I13y7KEzCy7qtfaG31FVKkapnRlt3oqVpAulxCYFazCqXt8txWtOFBCN9B8L/XT66GUDFliOTKjKF/sQOH5+1wj/nawOnMvTPDGnYrhTqlmX8Nc03E3BsX0dzpEciumrLUcuRxVFhMvJNyhuVCSi1zOMhThr2rBjh2F/6nnfrBeGFBcXc2SXafR7DRVGSQaGGtT9W70/4lrre6vJKjBtkiaS8FdeylmWOSxUZeS5lmOE2URhoLfHR+8G0hqxV2UOOYWD28q9kP0f8b+R2PyhiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lg2cn7gmgcd7Gxlp/Dtid7qxSjdeE17X1PqY/KZZDjE=;
 b=QVUnzPHZUXqI7R/fhK8zyTnC5EUl0dZ/tyK+207r0CWPY/W5ILcY/CM5S1RLma6Q7Ycpxx7YpfEPXy5MNt3JFRF3mJAx3wCLN8lkpLBTv4u9aLn39If2Djj7mLmcu12mk0aVcnnF70sFqvxB/sZSrVsnGwF82D+Ro4deTfec49U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v1 2/7] tools/ocaml/*/Makefile: generate paths.ml from
 configure
Thread-Topic: [PATCH v1 2/7] tools/ocaml/*/Makefile: generate paths.ml from
 configure
Thread-Index: AQHYo3Q42FRaL+39W0OkXWTN3nuj662dAyoA
Date: Wed, 3 Aug 2022 10:37:32 +0000
Message-ID: <8e1904e2-38a3-0c7f-1b8a-d20659fa9838@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <0752fe6eaa26f244f6fb45b1c3c6b9906deb2aa9.1659116941.git.edvin.torok@citrix.com>
In-Reply-To:
 <0752fe6eaa26f244f6fb45b1c3c6b9906deb2aa9.1659116941.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 674e5961-d406-4cc1-a937-08da753c2c15
x-ms-traffictypediagnostic: SN4PR03MB6688:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qZDfdelnKwoXBfzbppooqzG+JrV3C4IL0WPXK6zUHuQARDELM5Y9Dvd/GbVpoPEDmFt3gxRDa+yxkj09Xcv/Y0RQ4mpr5Jb92rIyD619GmDQaLgZVe4vv7qPFSCVxnyQVUuiLZU+sxH4ppaYUoapTfO5nCD9dfO8KPj4LsAEqEFitlOVq+ZRYl02cFnEit87exFMPJ6idcK+xKbt+LfkUM97/LMAgw/FKY6MhjPwaqIot0W8tPn+yp1AWih7eh9djwyQj0Pu7JUvTS42Fc/5lyWd45ziJnAdBwWOUFbeYNp0T7scYMgLH5pJi61/xHMfR+pOYtZUiQZlDHr3sFlpDQB/oS/6oJTQr6mbeNhNnJECGWNbgPsGM9oz52GC4fBsyIuf7kSVzoAzvjTSxYRDOh2WuLfuc7yaK+YI/ejQFGgbcweBIhS0jKPDWQJa5xiRQ1bheKjp8buPHggBIItVIHZo+fOBN1A2Q0NhdXkxlqmW6m2uMmLjKOHfSXbTi61fRMyAKH5GzSURnvAaF+3a8HqFmgQaeyYAdqN24z32ptj6AdzZy3NFB759Q7AdsvYPcTXbymgRH+v5GYjUmwqfUUpczFxdop2BEp47ME3qZfO2PMpzfySGNK+b/Aa9E6piTYvJJtABUPO7cfJopafPRiSVVJwjpMOnQtZHDOS1LMrPX03RhZVlnL0xbcUehhcCo2hftP6QJt4xMZGtvRvxD+s1I47yx+bibwr8WJ9yHPTQci9uqaXx/KFASBgUzMr4D/6ghpVa5bKYOPWU8EVoaeQAi2s7RIrbRsS413TZxF1CqEaCBZ9YS7//fH3mvhNyA+skNYn4jvkcbM45ICUTnMpWi4f+E1wPjDEwAwIseyJo6RBMq9q3iUryc97yOJjo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(38100700002)(41300700001)(186003)(122000001)(2906002)(6512007)(6506007)(36756003)(6486002)(31686004)(26005)(478600001)(71200400001)(4326008)(31696002)(66476007)(66446008)(66556008)(8676002)(110136005)(8936002)(54906003)(4744005)(2616005)(64756008)(38070700005)(53546011)(66946007)(82960400001)(5660300002)(86362001)(76116006)(91956017)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDhOaEVRUVhqcGQrdkdUN0hTaDRVR1dsbmxicGd2eXJjTWh6VVBtekhXcHVX?=
 =?utf-8?B?MWZUWExoMDlwQ015RGFOTGtCK0hteWxZMHVKN1VFSU4wMnBZRXhuU3ppV04r?=
 =?utf-8?B?cy9xZ3FNNnhZaHpGYWV0VU9GTDgvVUw1WkVJOGR6YTdtK2g3VG1oaEVUSjla?=
 =?utf-8?B?eUwzdDRJZTNQU0xxZDhMS2lzY0RqRS8zY09Nb3czc2Q2N1psV2pKb3NGemZO?=
 =?utf-8?B?Vkllb3hNd0VGckdpSWJqY3BKTEg2OExaWlIvSzVQYWRzaWdBY3ZjTmxvTE5M?=
 =?utf-8?B?NmJReFppRS9lV1RydS90dE9QTWZTMEZUSFlzQThZVjZZWDZVMDM1SFp3Z0pB?=
 =?utf-8?B?bEprc2tqNlNiemJ0RjZlQ2dwdWdvemlSY1JlMDV1VFlwQzJUZmR6c1NpY3FY?=
 =?utf-8?B?ZStGNlppa0t0SllmRmQ0MXRwWUJEMm5UZHlQazFQMmtLR1JrQnovRFJ6cksx?=
 =?utf-8?B?NmVMUHJtMTI4bS9tTEpYaGhaOXJmNlZBTWtWaXl5VW1sQmlQS0JTR1FPZDdI?=
 =?utf-8?B?aFBmUVpLRXB4YSs4eVl2U2Uxa2NrWkVyeGNQMk1RTVJHQmJWNFFFdlZMVy9w?=
 =?utf-8?B?ZjFsL3VLSklNR1ZSWGt6TjIxaVI2Z2pGOFRuSHhDM0xTNmprWmhuRERFSEgr?=
 =?utf-8?B?NUcwMUx5V0pLUGRYRllVRi9VdVpTa3h1TFMxcm85elZYREExTHh5ckQ0bFpV?=
 =?utf-8?B?aXltZ2NJanhIT2RFQ0hMcDc2TkNzVkxPWnNEbDhuN0l6N0FSQTdBazdqVFhu?=
 =?utf-8?B?bC9wMlZxN1JMRExGL2NaQkdMTVFOd21FWktHWFM4MEF2YXl2REQwUUpiQTd4?=
 =?utf-8?B?MEpPRlRQeVRmV1ZtTlFjOWVkTE5LT2VPdHpDaGl6OFZkY0Y3NktBSTl3M3h5?=
 =?utf-8?B?L28wT2RRdFZvSkVIa3lZTDl5NWxNQWI3TmwwclhMSzZ6aktRV3dmcHRCbWNy?=
 =?utf-8?B?N21Kb250UXdXTEJVZjE0RnRzUnBlTjJCa3F3bUt3K3NPaEkxRTNxd1pCT2d3?=
 =?utf-8?B?TldtOHk4NzVQVmdqVzYyeitqZDdpNTFNaHRWQyswYTF2ZFQvckhXb1hoOGlV?=
 =?utf-8?B?azlmcDNYc3lubFl4eThvaVF6ZjRmdHcvWk5CMHFzbHVaNXYweGdxQ2UyUGt1?=
 =?utf-8?B?RjVWd1pqdXRYOGx6S3Z3ckVYS0JpWFFkMTBlZ3JtWGdXVXM2dzBYOU9paVkv?=
 =?utf-8?B?c0Y0L2ZBeFFuRzZFY0xNWlkxcWdWNWgwU1R2RkhxTmp4OTRicFlWQ1NaNXhl?=
 =?utf-8?B?aExyS0VyamwrU2NzcERORnVrOSt6QXh4OVRoNGZwK3cwNmNYOWhRSUhqVXU2?=
 =?utf-8?B?OHlXMHlBdzdISktwZCtBTUYwaFZnZW9wbGJHblMzemN3dkZKcmFnMmwySW4r?=
 =?utf-8?B?RVljUUhSckwzanY3VEFZaXZuSDBRQlVwcW1pYy9DSS9yWDJnWmgxMDU4b25s?=
 =?utf-8?B?bXJuYU1lczVMOGZMNHpGZHFoc00xKzdIdWRrdy95VlZEb3IzQWM1TmQrZGtw?=
 =?utf-8?B?YVlnSXA3TjM3RE5yRWhRVjZJbE40WHVWNzd6VWtUdkY4ZTRLOXlvYWpDUU1V?=
 =?utf-8?B?S2dadDhDOVFpcGttVGtnbEVQY29Kd3dmd3pLZXRRazZOU0VuL2xyQVlZeVpM?=
 =?utf-8?B?TkV6UGI0WVJLUXA0c3hwVjZCMThQcHZkSGlzWnNOblI0dGQ3b2dURWFyUGF3?=
 =?utf-8?B?WTJlVURLeFoyOCthUGpVWTZiT25IUFo3aTdnbXpQMG5IdWo5dFFSU3RINm11?=
 =?utf-8?B?RXZFYmNzNUNQNzIySVdWVWtPSVNNUkFuNkZWSG9GUFAxSUlmYkZLOS95ZjlF?=
 =?utf-8?B?UXFyd3lUb05MK3NqR1h2alJnSHErNWExU014ZTZBbjVIbkMxLzg3bjRZWFdJ?=
 =?utf-8?B?aGx4THV1L2pIeThqTUZwRmZUSk5qdzJKVTErOTJ4RjkyZS9VdEVPL1l3QlQ1?=
 =?utf-8?B?SGg2ZCtVVjViUy9jWUo5SnphakNhcEwrU3pENFA2UnZpeFFWeWE1NWI4eTZD?=
 =?utf-8?B?OE9wOWtmeXVWaEYrMzQ4c2ltckFiUzE1aDVvNnRza3NCcnZtT2xramx2RUJ6?=
 =?utf-8?B?ZDgzbGJzRU9DamxPTUVBckxuc2JJcS80WHZKZ05YVnFnUVNqaXRWMVRXeDUr?=
 =?utf-8?Q?UTQX/G5BNsZhakz5IuOiAZA7G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FF5DEC855B1EB4594BF888AEBE80C18@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674e5961-d406-4cc1-a937-08da753c2c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 10:37:32.4138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lw9cb+ZrMCesXQTGsckppKhbaDdVAnZSoW3RKVCjTt4Hlgm6/dWGe4e6E+oA7EyIvAQSMSURYIhBchkXqN7tPGnA8yKENeQMIidJsQlOXI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6688

T24gMjkvMDcvMjAyMiAxODo1MywgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gcGF0aHMubWwgY29u
dGFpbnMgdmFyaW91cyBwYXRocyBrbm93biB0byBjb25maWd1cmUsDQo+IGFuZCBjdXJyZW50bHkg
aXMgZ2VuZXJhdGVkIHZpYSBhIE1ha2VmaWxlIHJ1bGUuDQo+IFNpbXBsaWZ5IHRoaXMgYW5kIGdl
bmVyYXRlIGl0IHRocm91Z2ggY29uZmlndXJlLCBzaW1pbGFyIHRvIGhvdw0KPiBveGVuc3RvcmVk
LmNvbmYgaXMgZ2VuZXJhdGVkIGZyb20gb3hlbnN0b3JlZC5jb25mLmluLg0KPg0KPiBUaGlzIHdp
bGwgYWxsb3cgdG8gcmV1c2UgdGhlIGdlbmVyYXRlZCBmaWxlIG1vcmUgZWFzaWx5IHdpdGggRHVu
ZS4NCj4NCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEVkd2lu
IFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQoNCldpdGggdGhpcyBjaGFuZ2UsIGJ1
aWxkbWFrZXZhcnMybW9kdWxlIGhhcyBubyB1c2VycyBhbmQgc2hvdWxkIGJlIGRyb3BwZWQuDQoN
CkNhbiBiZSBmaXhlZCBvbiBjb21taXQuDQoNCn5BbmRyZXcNCg==

