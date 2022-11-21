Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E06320D4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 12:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446552.702171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox57R-0004Gs-8d; Mon, 21 Nov 2022 11:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446552.702171; Mon, 21 Nov 2022 11:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox57R-0004Dx-4Q; Mon, 21 Nov 2022 11:37:45 +0000
Received: by outflank-mailman (input) for mailman id 446552;
 Mon, 21 Nov 2022 11:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox57P-0004Dr-Bf
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 11:37:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6f8b7d3-6990-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 12:37:40 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 06:37:37 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by BLAPR03MB5475.namprd03.prod.outlook.com (2603:10b6:208:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 11:37:35 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 11:37:35 +0000
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
X-Inumbo-ID: e6f8b7d3-6990-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669030660;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0Yo2Ijg1FoGfPa3iGjQpR7x4/uRmoIYcCH6eiUISy4k=;
  b=OOttn/HVEtcDmgTnWaJcj0UutwyZgbSnw/dwaw2yU+NuLLq1+qXl6ruQ
   t4ol2MPkj3T4XuDQIWcDFn2sD9vFtbr85XnL2gcNIwrz/hhZCKtgIbqJb
   4lOnmrujXF5usukdLToR0CH3kwBYC/bHefiDPH8kPKE37ySgOKA687xet
   Y=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 85261346
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HPQGGqn+BvzEJirRS7ndDM3o5gxKJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWDGzUOfzZM2qgKdF+aYS1pE4HuZKHzYMxSABk/io0FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5gaGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eIICQIhdFeOu+Kd4rumSuMx3p0pLOC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieeyWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapCSefmr6U23jV/wEQMLx1KVWWU+sPgyWT5VNhnC
 hYp+Sgh+P1aGEuDC4OVsweDiHyNuBIGSsdTO+I/4QCJjKHT5m6xJmUCVC8HV9Ugu+c/Xzls3
 ViM9/vlHSdqsaGVYXuF+62IsCipPiwIMW4FYzRCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1VXOgjbprJ6ZSAcwv1/TRjj8sVw/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:y/E4qa3hGH59+GP2zdiLsQqjBZpxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklUqvoXRiKrbzPIt
 MeS/0018wmN29yqEqp51WH9ebcGkjb2C32GnTq9PbliAS+10oJsnfwjPZv4kvosqhNC6Wsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkfwIDcyRCes1JaEJ6e
 L8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORsTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6TmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZlh9GFWDPw8juE8syXI2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85261346"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVoeeGYOR+kLywlbz6L1Vup1JhbE5TZD8MsSjD7WWYQNDFOgAD5hSdTERYLUc7+ragKUXILKUwIgie6xIyGGIotCMn/u3bs+vFTjUaa63qDenM2N/tcqrJWIgaiewLJVmxMJcqJccJwzt1xZ4vye5f/NFf6xjoT1THNb3E4AdzkMR0s3OGygws7XtclUlBfHJAzAo7fI+CEfqMpPMBTP5M7RCpCOfqqimnnhu4LIg7DLx5SnSb+ZPlwVMYpPcPgbMuXGeHP9IDiCy5d82Uj3zMOpGwvic0Hk2lGlO6b2udRAEX0egKj4i8pcI3rE8TpkupDmad+P2D2Tg1JZYjsX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Yo2Ijg1FoGfPa3iGjQpR7x4/uRmoIYcCH6eiUISy4k=;
 b=oFMKxubBfmcaK/tUjstd7lCO6wuy0cia/YZrFfFg4hd8MZWDmiGIz1/TJr++ONeAc3VIniQon5IgQjMJ+tjjGZt+DxhyvwcDL5pPaADZeIuiLkVdVFiVhpxvv4v9f0TtoGQx162eOo1IveHrPwXGr++sPvlTzcKWbfVCcZCPXh372/SioFaohurmIKvESA+n6JdM+NoEQPYOsiTLnvDxZZrQAb1q61Yco1+aIFPwfNYVOcR8Q9aGN/Ipl2cGKdN/s2z9bDU6jKqp45tk1NYkA0gmBzF0kY/9RrNw/Uwt8Yl5Gnz4phoqaTYu27Aaf8bBVv+J8HOt/xFjKomj1F0feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yo2Ijg1FoGfPa3iGjQpR7x4/uRmoIYcCH6eiUISy4k=;
 b=YksVHL0BnFVX9uv0ZngFf4braVvf3bIOUum0MfiOU6HpZ+Xdj7/XZdoi9JAG/CxUSRYGFj0XOEjXAFwQxkVGNJURDCO7bCd49sg4ATt/6IvyUki5ptzY8UK9X/1aSsc9hc08twSrmT1iw77XxnN4AvJzcPckUBL/aWG035s6wnw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
	Anthony Perard <anthony.perard@citrix.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Thread-Topic: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Thread-Index: AQHY+zeiYojqAeFzxUaCyzIpzopUAa5EwM6AgAAteACAAD/FAIAEFtEA
Date: Mon, 21 Nov 2022 11:37:34 +0000
Message-ID: <56152342-2644-e618-7590-0f8335aac801@citrix.com>
References: <osstest-174809-mainreport@xen.org>
 <Y3eZOcmOYkNLdeGe@Air-de-Roger>
 <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
 <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
In-Reply-To:
 <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|BLAPR03MB5475:EE_
x-ms-office365-filtering-correlation-id: eb4a2855-03f2-4e49-4ebf-08dacbb4c8e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GeoSbqtDuFI+b7mFWCsRImEMPYYq406bEtD2PVncn0L3FnzkDApdesZ+66NB+RoZFbmIDMr983IJp3MpfKye4yB/pI4h6/XJZ6kKoF6Iqcaphs/lFtwQ0rah8isj3KrSHdo67IBUccPgThZQBO6kjgLRbbPWRzAEE9bHtlVRkSloXBIUD3fbj3kaoCNcz1UEyhrc6974J/2NQlpoN0U4Hw+eE3Z78jxM2cY7MDrFqCzJTfSYTWRX3JhluKwCFpTmuLOC60BlZa6rGI6y4o0C9sdQBOffjyByoXGKT81DtERjqsfq04YXsUgktDgdVvI8jqcg3ErLGwmFpJ1bOa5DreXj0PQVwpEpIrie9vEsHFgxHx9HZeGaHr+dH7rqpGz92AQAHhSUxPJy91tr1JU1/VnzxxswVA0in6eTLHBIKRUoaVLQJEunZRNePXJVts0/TeYYU8XqrmSBECAqQ2VTVDpXJuVBTJoXc8IYij/c8FZtQWxY5JHRDJ+U2g5Xm/VZ2SjA93DLXyiidFFmSJGUPuJRhzU9sdU49xGnNBQYsZVYmxJEy08lUxN8vzIaFsFmlIb0VJ1YHItWufD+pJfGJGnm/lj5aIi877bYIKR57iYLaqDbv+KTIs1CKRZBB252IQDNYNTE08URMKVx5Y+OmlrNj8+Ilujww9WtBc7jGv7zeiceQUw82V3ZB0d6A48DbytKP1rtlHvHRtvcTifmxRmr4UEE7D/6v24E5UeE3NGO6UikqYQWSYoL+bZxQNzBtUBEIvR6720PpttfWo1gMA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199015)(6512007)(186003)(53546011)(26005)(83380400001)(2616005)(82960400001)(122000001)(38100700002)(76116006)(64756008)(2906002)(5660300002)(71200400001)(54906003)(6486002)(66556008)(6506007)(6916009)(478600001)(4326008)(8676002)(41300700001)(8936002)(66476007)(66446008)(66946007)(316002)(91956017)(36756003)(86362001)(31696002)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVMveThtbDRUV0xDOHdFNnZuZ2F5WE00S2NzSkpTODNnVkdEYlpvU05lZkRG?=
 =?utf-8?B?R0MvMnhoT3A3ZmtJTlRnTlBNc1ArQ2lHOHNsNkxOd0VGSVRUY1VSZy92ZGx5?=
 =?utf-8?B?NHVNa0xJMEhKb2lydlRxSFRzK1BRVytEbVFwYlY1MFdrUmVULysyaXZTemh2?=
 =?utf-8?B?d09Fd012TVdLWDZ3d2ZyV0Q4c1pGVkJwc2VSSlJDLzVOZWpKbEhUcVJDVWRP?=
 =?utf-8?B?cXZjNndMTCtQbFRNQ2IrU2FoSHZVOTFhcE1rOVVLOWFKYjFFSElzWGJWaXFs?=
 =?utf-8?B?N0hkQTZ5Qzk5UWg3UjM4UU9LTjFCL2lQYUlHM0JkUDMxb1g2VVhNcTBtdEpp?=
 =?utf-8?B?V2xqdkIzTFNUZzFLanAxR0NYTVFONWRFb1NDUlNvdFlFc1BTOEFkNE02R0FW?=
 =?utf-8?B?R2o5T3hGZVUzRCtGYU1vUWc4Q1JMdDFkaXBsRGFpc1VXYWt0b0FldnFwWXB3?=
 =?utf-8?B?bHQyUXNWM1pjNXIwYXBqcG9nMDAzZFJqYTduaHdxbjJ3bktpTDdBSEpBZC96?=
 =?utf-8?B?bFE4QVN1bzZjdEwzREtJVGtRQmI5ajd1RHNsK0NTMGdFbENXRmZGR29zK002?=
 =?utf-8?B?andzT2pBS2ZYQm9hY0VIa2dNeDNUQ1JPSkRrMjAzMlg1WlUyM2JhOWZaN3ZL?=
 =?utf-8?B?T0lxSFZYeXU2Vm1wMEU0VjMwZlFLeDZXSWlIZ3Evb1hVT0prb25mM0tsQUVN?=
 =?utf-8?B?dG5SU2hrQzVOSW1tS253RFovNjV1K2kyTE5WOWVMODVPdTdFNGx6bUhoMkNX?=
 =?utf-8?B?ZmErait4a1YvbVhYb0liV2xFZ0JYa1hxV1RwSlNQZWdudGNNTjV0bEljLzRa?=
 =?utf-8?B?eStsM1M1SkN4MG1RV3grSWJzVFdjd0JROFR3QVJFeDQ0aGw0ZUdUWlBLSnhX?=
 =?utf-8?B?SE1jZEMwNHEzNG40dkZWTk92bVYrUVhpdnl0SExwVThweHI1dWh0Q1J2bUZk?=
 =?utf-8?B?TG54ZnE4S1VaQ202WmJtcWF3bCtDM1FNWWFjVk1wUDY3dS9KV2RqK3F1ckdh?=
 =?utf-8?B?UXpBUVpZYmlMVGUweHpOeXhldFMva245aE94a3dCSkc1K2V1Z1FUbGRiOVdH?=
 =?utf-8?B?OUdTMnBWQXIwd3ZoR0Z3dGhXZm9ITWt6cVUzam1ZV2dIR0QwQzduVytmQlVX?=
 =?utf-8?B?TFZTRHRnNUhZSzNNc2ZMMzRVQmdmYXNrYVV3UUh5S3l4RlVYK1VYczBGU1Av?=
 =?utf-8?B?VTRpLzEyZ1ZsZkgxQjNlMVN5Nkk2WFN6ZHFoK3FPN2JCbncwMGRzNEtRNUxE?=
 =?utf-8?B?OUQySWxraTV2aUpWL0hoZk9vcC8rSUVmODlkaGJTem5NcXd2ak91L3lnaGRW?=
 =?utf-8?B?SnNDMUE1TjlkMVpWd1pYU1EwTUhFZW1ERlAwd1BtZTNlclBTK0ZuVGRSMEE0?=
 =?utf-8?B?WGs0Um5kODg1d3hIdXIxWGh3TTN5eGdzbkQzRU9RM1NQM0htdE5PSHl4aXdZ?=
 =?utf-8?B?cmFqaHp6SVVjMmc3dTEyRzlOQ2F2SUJ1d1ZaaHorZ2VQTTg3YWdWS0tMOWcz?=
 =?utf-8?B?NVpHYmRqWTVpdm0zL0JTN2F0Q2tNdkpVbWdJWGF4bHozdHRUS21NZXBmbWhj?=
 =?utf-8?B?bDdjZTNJbjdiRWtCU1hYRTl5TWdDUm5FdEEyUEhYa08rMCt0OTdGT25KWFVN?=
 =?utf-8?B?b3YvRm5sZ2UvQSthb1RtK3pMQ21DRnRqVTc2cnJoelo2Ni94V3RSTFdaZ2hk?=
 =?utf-8?B?M2o3ZUgwK0RKL2poNmFMZGIzSUZLMXF2QU9XdWpJQ09na1QyUDQwTE1Jd1E1?=
 =?utf-8?B?SkxvaXRlZWI1TXpMZmlMc3FyRG4ra2NuQVpWTmVzS3ZFd3FUWGx2RkdzVUNo?=
 =?utf-8?B?Y0N3YnZ4Ty9nWUc2N1lUUXJubk5HaVcxOHZJTUZDMHZydmY1WklLQjYyQUYv?=
 =?utf-8?B?VTlMSzZ3WlI0WWkwdG14SCs5TnUrQUtFaDFNaVBvQzRBeGZ0K0l1SUhwRm4r?=
 =?utf-8?B?d0pxZ2s4WHBFSVVlbUtHMnM2MU1qRW5BcXlMVHc2d2REaXJuYVpGRy92eEtB?=
 =?utf-8?B?dElIb3FRajhyUzJsNnNSc3M0WTNQZzFiRnhaUERsMGtnM1ppK3lURlVjcTcw?=
 =?utf-8?B?bHBoZVM0enFWNFVVUDR6OVlXa2Uvc2dzak5EazB1disxVDJpcHFXQUxXR0hD?=
 =?utf-8?Q?g2i7F5EozQcHj1af59ubREjXL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AA7CBD72BCFE84B9184A5DDBF158D9D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DY2QP6hucQ+BX6x16r3a8kEQJHVk8eI4eeR0k40qxvKbiw5Ut3D3O4lFPKxTaLPOc3W0Lloxxgeokb14BviesJiirWTOkP19Ku7BFMeCt9EYKbgIj25g67NKlVT0ex0/h5UOULEm/a18EfL3/cPy5ptm2QTuvDMbiwfD4jP87lHdbMFYSBgVP7bwSpJf14jPIninozrj8vy47bN3fITpACA/N/nW7Jv3D+pjwv4S2QK5Y2r7DTrvUns/AXgxUbSmJ2eSinSIhpewn/bm095aFPULsZjsAX5b7nwn+1mEcFysnC6Q0eDWw3l3Vy1UQBjHFiMT69bSPuFBM3jV1Rr/xP0295mXj2HHNg7rZiA1VPx/VXyHixas04DvasQGHsqmICCaWEqtRkgf2Q8kt7qrb1Tvl6RCQAFtOz+JLhocOg4En87y+LsmvIqYpgR4qNQhurnR1A2HvyOhmANP0xNpFx6zKtfnXSVXj2YYy2rcxA6tIi7xAdQvv006aqinU2JY3inzAqQY7QYUTAJoFR82sRLoKFJ46TYknqkzgAenWV52MWXh0Rx+mk0tjbQojk31uGw28BbB5r2d+CksekR2cDcwbM4QjwW1gQQlvzmZxdLba9IKKHkB4ZNAE5TCdEFCj96MkojCUheBkE2OM3tqkVvm+mpEk2SRYVuvxJ1jTQK9S/Chx+jOAVkflp3GrNFUcaLl3ZtkbkJx1L84VkWV3c1vbFBtG3kl7LPo+TlzrijNF2+Fdv8LNt+xKvPVHDYxJUyVQeEMI3l3XyVMZLb3/SMOIrITxSmajl2MB4YRdkuryp4UqqbY5ihQPHjnA/6HgAxsjEUQn6ZyPtxQOTu//LxBYL+htCbJgvycXQ5AKGbFsFQFhR7M/0KEy7R3GIMU
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4a2855-03f2-4e49-4ebf-08dacbb4c8e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 11:37:35.0875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JB1hSE6sy9Bda/15asZwOBSwjTuWzm9krCpOFQ1K+9PffHscjzVsxS4zTQwDkHM5xqfcdkaZl0+IzWS7m94Gm9BGH5xeQL/0AfEe673JiKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5475

T24gMTgvMTEvMjAyMiAyMToxMCwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gT24gRnJpLCBOb3Yg
MTgsIDIwMjIgYXQgMTI6MjIgUE0gQW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6DQo+PiBPbiAxOC8xMS8yMDIyIDE0OjM5LCBSb2dlciBQYXUgTW9ubmUg
d3JvdGU6DQo+Pj4gTm92IDE4IDAxOjU1OjExLjc1MzkzNiAoWEVOKSBhcmNoL3g4Ni9tbS9oYXAv
aGFwLmM6MzA0OiBkMSBmYWlsZWQgdG8gYWxsb2NhdGUgZnJvbSBIQVAgcG9vbA0KPj4+IE5vdiAx
OCAwMTo1NToxOC42MzM3OTkgKFhFTikgRmFpbGVkIHRvIHNoYXR0ZXIgZ2ZuIDdlZDM3OiAtMTIN
Cj4+PiBOb3YgMTggMDE6NTU6MTguNjMzODY2IChYRU4pIGQxdjAgRVBUIHZpb2xhdGlvbiAweDE5
YyAoLS14L3J3LSkgZ3BhIDB4MDAwMDAwN2VkMzczYTEgbWZuIDB4MzNlZDM3IHR5cGUgMA0KPj4+
IE5vdiAxOCAwMTo1NToxOC42NDU3OTAgKFhFTikgZDF2MCBXYWxraW5nIEVQVCB0YWJsZXMgZm9y
IEdGTiA3ZWQzNzoNCj4+PiBOb3YgMTggMDE6NTU6MTguNjQ1ODUwIChYRU4pIGQxdjAgIGVwdGUg
OWMwMDAwMDQ3ZWJhMzEwNw0KPj4+IE5vdiAxOCAwMTo1NToxOC42NDU4OTMgKFhFTikgZDF2MCAg
ZXB0ZSA5YzAwMDAwMzAwMDAwM2YzDQo+Pj4gTm92IDE4IDAxOjU1OjE4LjY0NTkzNSAoWEVOKSBk
MXYwICAtLS0gR0xBIDB4N2VkMzczYTENCj4+PiBOb3YgMTggMDE6NTU6MTguNjU3NzgzIChYRU4p
IGRvbWFpbl9jcmFzaCBjYWxsZWQgZnJvbSBhcmNoL3g4Ni9odm0vdm14L3ZteC5jOjM3NTgNCj4+
PiBOb3YgMTggMDE6NTU6MTguNjU3ODQ0IChYRU4pIERvbWFpbiAxICh2Y3B1IzApIGNyYXNoZWQg
b24gY3B1Izg6DQo+Pj4gTm92IDE4IDAxOjU1OjE4LjY2OTc4MSAoWEVOKSAtLS0tWyBYZW4tNC4x
Ny1yYyAgeDg2XzY0ICBkZWJ1Zz15ICBOb3QgdGFpbnRlZCBdLS0tLQ0KPj4+IE5vdiAxOCAwMTo1
NToxOC42Njk4NDMgKFhFTikgQ1BVOiAgICA4DQo+Pj4gTm92IDE4IDAxOjU1OjE4LjY2OTg4NCAo
WEVOKSBSSVA6ICAgIDAwMjA6WzwwMDAwMDAwMDdlZDM3M2ExPl0NCj4+PiBOb3YgMTggMDE6NTU6
MTguNjgxNzExIChYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAxMDAwMiAgIENPTlRFWFQ6IGh2bSBn
dWVzdCAoZDF2MCkNCj4+PiBOb3YgMTggMDE6NTU6MTguNjgxNzcyIChYRU4pIHJheDogMDAwMDAw
MDA3ZWQzNzNhMSAgIHJieDogMDAwMDAwMDA3ZWQzNzI2YyAgIHJjeDogMDAwMDAwMDAwMDAwMDAw
MA0KPj4+IE5vdiAxOCAwMTo1NToxOC42OTM3MTMgKFhFTikgcmR4OiAwMDAwMDAwMDdlZDJlNjEw
ICAgcnNpOiAwMDAwMDAwMDAwMDA4ZTM4ICAgcmRpOiAwMDAwMDAwMDdlZDM3NDQ4DQo+Pj4gTm92
IDE4IDAxOjU1OjE4LjY5Mzc3NSAoWEVOKSByYnA6IDAwMDAwMDAwMDFiNDEwYTAgICByc3A6IDAw
MDAwMDAwMDAzMjA4ODAgICByODogIDAwMDAwMDAwMDAwMDAwMDANCj4+PiBOb3YgMTggMDE6NTU6
MTguNzA1NzI1IChYRU4pIHI5OiAgMDAwMDAwMDAwMDAwMDAwMCAgIHIxMDogMDAwMDAwMDAwMDAw
MDAwMCAgIHIxMTogMDAwMDAwMDAwMDAwMDAwMA0KPj4+IE5vdiAxOCAwMTo1NToxOC43MTc3MzMg
KFhFTikgcjEyOiAwMDAwMDAwMDAwMDAwMDAwICAgcjEzOiAwMDAwMDAwMDAwMDAwMDAwICAgcjE0
OiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4gTm92IDE4IDAxOjU1OjE4LjcxNzc5NCAoWEVOKSByMTU6
IDAwMDAwMDAwMDAwMDAwMDAgICBjcjA6IDAwMDAwMDAwMDAwMDAwMTEgICBjcjQ6IDAwMDAwMDAw
MDAwMDAwMDANCj4+PiBOb3YgMTggMDE6NTU6MTguNzI5NzEzIChYRU4pIGNyMzogMDAwMDAwMDAw
MDQwMDAwMCAgIGNyMjogMDAwMDAwMDAwMDAwMDAwMA0KPj4+IE5vdiAxOCAwMTo1NToxOC43Mjk3
NzEgKFhFTikgZnNiOiAwMDAwMDAwMDAwMDAwMDAwICAgZ3NiOiAwMDAwMDAwMDAwMDAwMDAwICAg
Z3NzOiAwMDAwMDAwMDAwMDAwMDAyDQo+Pj4gTm92IDE4IDAxOjU1OjE4Ljc0MTcxMSAoWEVOKSBk
czogMDAyOCAgIGVzOiAwMDI4ICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiAwMDI4ICAgY3M6
IDAwMjANCj4+Pg0KPj4+IEl0IHNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIHBhZ2luZyBwb29s
IGFkZGluZyBBbmRyZXcgYW5kIEhlbnJ5IHNvDQo+Pj4gdGhhdCBoZSBpcyBhd2FyZS4NCj4+IFN1
bW1hcnkgb2Ygd2hhdCBJJ3ZlIGp1c3QgZ2l2ZW4gb24gSVJDL01hdHJpeC4NCj4+DQo+PiBUaGlz
IGNyYXNoIGlzIGNhdXNlZCBieSB0d28gdGhpbmdzLiAgRmlyc3QNCj4+DQo+PiAgIChYRU4pIEZM
QVNLOiBEZW55aW5nIHVua25vd24gZG9tY3RsOiA4Ni4NCj4+DQo+PiBiZWNhdXNlIEkgY29tcGxl
dGVseSBmb3Jnb3QgdG8gd2lyZSB1cCBGbGFzayBmb3IgdGhlIG5ldyBoeXBlcmNhbGxzLg0KPj4g
QnV0IHNvIGRpZCB0aGUgb3JpZ2luYWwgWFNBLTQwOSBmaXggKGFzIFNFQ0NMQVNTX1NIQURPVyBp
cyBiZWhpbmQNCj4+IENPTkZJR19YODYpLCBzbyBJIGRvbid0IGZlZWwgcXVpdGUgYXMgYmFkIGFi
b3V0IHRoaXMuDQo+IEJyb2tlbiBmb3IgQVJNLCBidXQgbm90IGZvciB4ODYsIHJpZ2h0Pw0KDQpT
cGVjaWZpY2FsbHksIHRoZSBvcmlnaW5hbCBYU0EtNDA5IGZpeCBicm9rZSBGbGFzayAob24gQVJN
IG9ubHkpIGJ5DQppbnRyb2R1Y2luZyBzaGFkb3cgZG9tY3RsIHRvIEFSTSB3aXRob3V0IG1ha2lu
ZyBmbGFza19zaGFkb3dfY29udHJvbCgpDQpjb21tb24uDQoNCkkgImZpeGVkIiB0aGF0IGJ5IHJl
bW92aW5nIEFSTSdzIHVzZSBvZiBzaGFkb3cgZG9tY3RsLCBhbmQgYnJva2UgaXQNCmRpZmZlcmVu
dGx5IGJ5IG5vdCBhZGRpbmcgRmxhc2sgY29udHJvbHMgZm9yIHRoZSBuZXcgY29tbW9uIGh5cGVy
Y2FsbHMuDQoNCj4gSSB0aGluayBTRUNDTEFTU19TSEFET1cgaXMgYXZhaWxhYmxlIGluIHRoZSBw
b2xpY3kgYml0cyAtIGl0J3MganVzdA0KPiB3aGV0aGVyIG9yIG5vdCB0aGUgaG9vayBmdW5jdGlv
bnMgYXJlIGF2YWlsYWJsZT8NCg0KSSBzdXNwZWN0IHNvLg0KDQo+PiBBbmQgc2Vjb25kIGJlY2F1
c2UgbGlieGwgaWdub3JlcyB0aGUgZXJyb3IgaXQgZ2V0cyBiYWNrLCBhbmQgYmxpbmRseQ0KPj4g
Y29udGludWVzIG9ud2FyZC4gIEFudGhvbnkgaGFzIHBvc3RlZCAibGlicy9saWdodDogUHJvcGFn
YXRlDQo+PiBsaWJ4bF9fYXJjaF9kb21haW5fY3JlYXRlKCkgcmV0dXJuIGNvZGUiIHRvIGZpeCB0
aGUgbGlieGwgaGFsZiBvZiB0aGUNCj4+IGJ1ZywgYW5kIEkgcG9zdGVkIGEgc2Vjb25kIGxpYnhs
IGJ1Z2ZpeCB0byBmaXggYW4gZXJyb3IgbWVzc2FnZS4gIEJvdGgNCj4+IGFyZSB2ZXJ5IHNpbXBs
ZS4NCj4+DQo+Pg0KPj4gRm9yIEZsYXNrLCB3ZSBuZWVkIG5ldyBhY2Nlc3MgdmVjdG9ycyBiZWNh
dXNlIHRoaXMgaXMgYSBjb21tb24NCj4+IGh5cGVyY2FsbCwgYnV0IEknbSB1bnN1cmUgaG93IHRv
IGludGVybGluayBpdCB3aXRoIHg4NidzIHNoYWRvdw0KPj4gY29udHJvbC4gIFRoaXMgd2lsbCBy
ZXF1aXJlIGEgYml0IG9mIHBvbmRlcmluZywgYnV0IGl0IGlzIHByb2JhYmx5DQo+PiBlYXNpZXIg
dG8ganVzdCBsZWF2ZSB0aGVtIHVubGlua2VkLg0KPiBJdCBzb3J0IG9mIHNlZW1zIGxpa2UgaXQg
Y291bGQgZ28gdW5kZXIgZG9tYWluMiBzaW5jZSBkb21haW4vZG9tYWluMg0KPiBoYXZlIG1vc3Qg
b2YgdGhlIG1lbW9yeSBzdHVmZiwgYnV0IGl0IGlzIG5vbi1QVi4gIHNoYWRvdyBoYXMgaXRzIG93
bg0KPiBzZXQgb2YgaG9va3MuICBJdCBjb3VsZCBnbyBpbiBodm0gd2hpY2ggYWxyZWFkeSBoYXMg
c29tZSBtZW1vcnkgc3R1ZmYuDQoNCkhhdmluZyBsb29rZWQgYXQgYWxsIHRoZSBwcm9wb3NlZCBv
cHRpb25zLCBJJ20gZ29pbmcgdG8gcHV0IGl0IGluDQpkb21haW4vZG9tYWluMi4NCg0KVGhpcyBu
ZXcgaHlwZXJjYWxsIGlzIGludGVudGlvbmFsbHkgY29tbW9uLCBhbmQgYXBwbGljYWJsZSB0byBh
bGwgZG9tYWluDQp0eXBlcyAoZXZlbnR1YWxseSAtIHg4NiBQViBndWVzdHMgdXNlIHRoaXMgbWVt
b3J5IHBvb2wgZHVyaW5nIG1pZ3JhdGUpLsKgDQpGdXJ0aGVybW9yZSwgaXQgbmVlZHMgYmFja3Bv
cnRpbmcgYWxvbmcgd2l0aCBhbGwgdGhlIG90aGVyIGZpeGVzIHRvIHRyeQ0KYW5kIG1ha2UgNDA5
IHdvcmsuDQoNCn5BbmRyZXcNCg==

