Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E162F4AC2BC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267114.460829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5iW-0005Po-VK; Mon, 07 Feb 2022 15:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267114.460829; Mon, 07 Feb 2022 15:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5iW-0005Ml-RN; Mon, 07 Feb 2022 15:14:12 +0000
Received: by outflank-mailman (input) for mailman id 267114;
 Mon, 07 Feb 2022 15:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH5iU-0005Mf-VS
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:14:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98e8383e-8828-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 16:14:09 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217ENmqD002244;
 Mon, 7 Feb 2022 15:14:06 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3552g7mw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:14:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB3579.eurprd03.prod.outlook.com (2603:10a6:5:4::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.18; Mon, 7 Feb 2022 15:14:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:14:00 +0000
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
X-Inumbo-ID: 98e8383e-8828-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYVuSX2DpmN/wHKARgBufxe0Uu7DUx9dh0GfgZOtbsgjuOCll36jH0YfgK2NiJ16075fTu6NYKMIcegkPHc+uuZZQlTxV+cWwB4MNoAgwQnsvZw+46LHNpgQABwmfkdhpyvhlENbJV7bm918KtRtGUmYWGHMA6tGojHuMssAL2xjLmqGRD88sU3ZZMQYa47MerIS4lkJFfrt84e++dKCl3HKjLWkCf9VPA9zmkSAi0MSjW0lLG2oyKxH3gnMLwUgn1dO3eiXaCRDclanLC64ODF7hsdVB0yV4QzSiL4SwG7oPBrDsGwwiPZvSjKr3/cVXN1fr/aXBGqhVF7OH0YkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZp+nQWwXrMM/PPKvVGJiei+Rn/mNFCHzzWEQW/SgBI=;
 b=GldUGI8j0M2K6BXuBgW0+Pgl1HlP3Emd3ONPcU4cXk+IPVYnktRXeDqVj12zpAMGDMMq8y2N46eJQ0bshuxVw7zYida3pzaiMOZglc1Vv8ydtFidMNKq+ysfn+qw1YIDJB4ldjLm1I00G4jF5efnrD3MD/bpIWjYQ8cxykflACCq86Bc+48HdQ2Pj8P1Ef8Rn/8T7SDp8jiL6oiCT9PipNWuxCTh1N5MB99sTKG96dr4fUSVlPfvKpaWPD6gq9e3NpG4pX1XXwiysGMkAWBTlH9F1RvJpHN93Wq0P+CGcoydklEXHutiHFw6m37YJM0CJ7XWKImlyrN3ppsqqr2sxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZp+nQWwXrMM/PPKvVGJiei+Rn/mNFCHzzWEQW/SgBI=;
 b=khsfgpyYdVQTlWErWmTF/vW9MznhjbBLUxtPVh3LlFMsxd8zc3DP+i9EuykUNoOmXXhYhzI2GLcnUbRklH9mIlFiaNeoYBkTOlHrlc5uWuT9kW9QGYGLIJK8774SXVqNuki//tQpsWavauRZmVEWhpzOSh4AzPx2IswRrdeg1soq8zoKegZ8UImNx3HxKhhvuCMYKodLs45Gg3FB3QJmkyEaWhxoFHmKf1jTP2c+3hTni9HJxaqYRURC25ruMx3aCkm6+LqnzHLzyRKznxDQ+gqB5VK3jjmF60gzR1XkrMZzb1nAYZDRkqo9SkZpBu3xYlyhZZ6EaCGPtnXHr8DYEg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGICAAAPHAIAABC8AgAAFjoCAAAI+gA==
Date: Mon, 7 Feb 2022 15:14:00 +0000
Message-ID: <c5eee75b-bcf3-7e31-e25b-0bf0b217267a@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
 <6b4ea90d-cc9c-edf7-e579-a84d72431d7a@epam.com>
 <f6f16729-8404-6703-11c6-dd7a4ebc658c@suse.com>
In-Reply-To: <f6f16729-8404-6703-11c6-dd7a4ebc658c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 031b094d-da9e-4df3-20b4-08d9ea4c781f
x-ms-traffictypediagnostic: DB7PR03MB3579:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB357925528FAEC5A9255EB7DBE72C9@DB7PR03MB3579.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OgVgK8BmTXv9AElFjv1PtM5ayx6pF37EVcYh3rX0XRezED8Gk3F5tuS7uuyT8f6qUhvTDB6qjAlwcVVifjgvMWHsRV8Z5xgOiASDAG6WqUOQQlNR8cUjxQH88UN9BdhOqkdE5lzUz0PTaJKx9F2mbphTzFlT4brtQPUPRstGEppr/ewP9LoDbFqgByB9QDCqnCbkBP/Bl5ibqERkG1764JOrjToUJNDg118nZx0y3m5osqVxqxHOLkurRRLX46BLFfwpzoEQJgQHEYW1SspQzqBELLTuNCV1SsUPUG4eOQcfUMsYxctZF3zsvWQ42BzUH1fjPqtM9dSmiUstMZM9GJZeywigQ9Yck2bptj5R1Zkv13d5hyI0aN6M6kffK10yQLsKr27Q6eUHxRI4YHv/WVfMUVnzPxuX1iPv/PaLs7SFXleUPFzfpIzhVWJM95R0PxVfFIjzyEQc+qA9kIJOO71wcxnmzBrVJvVwhncFubyL0Hd/LzanrhUevBpL16/ZmqtxYdnqv/fmeV6lSdNeIcyoB8uLBxy69RCqixa7PKGdKzIbYajv5eSnHaNMNTYmOxcTXCkzZzYDs75mBMCDaX++TEzLsyjjpzxRd5xdcs6cB6ZI0pl5DA53NiMqyvFzzbRTXAZOZlcS+eqyhdM0n2fPF+3q5vjTtdf1PvLnsdOlaZSXOpVXeecXXtaaQj6sPZ8qcohrjoicZqNkHGeM6+ZsPJqd/UaTgtWig+h20+g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(7416002)(2906002)(2616005)(6916009)(6486002)(4326008)(38100700002)(54906003)(86362001)(122000001)(5660300002)(31696002)(38070700005)(55236004)(36756003)(31686004)(6512007)(91956017)(66946007)(76116006)(8936002)(8676002)(64756008)(53546011)(26005)(71200400001)(66446008)(186003)(66556008)(66476007)(107886003)(6506007)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVRKM1EwRkNDVmE2QUJFSy8xOFU4aDN4U3VTNzBZVUNYUHROSXB2SE1XL1Rk?=
 =?utf-8?B?Y0VhQkF6OFNacUZ4cHd6d1YySWR4a2dPblpib0NPZW0xM1p6VGt1R3RSUlJr?=
 =?utf-8?B?enZ2Y2d5Qm9GNWtubzFUM3ZPTHBYdkQ3ejdGd1BxdlBDblgraHNXYm1MU0Zp?=
 =?utf-8?B?QTJvbHdNRDNFZFJISEJENVdJaG9BZitOeC8vRHFPOCtrMWM5SUx2MHpYRDFN?=
 =?utf-8?B?bWFETExqZjV3a2RmMnRxU0doamZFbFYySy9KVTJ5NENwWFExcXVEai9uREdW?=
 =?utf-8?B?QklFYjRudFA4LzlML0daOVN1Tm9JOERXSWxHVHJqcTJ0dUFoYmlvN2NYL1Ix?=
 =?utf-8?B?T1k5ZkZUQUpWbnJFQWdQeVNZbk5mUm5KZnIwVmZxeURBa0hjTndiVE02UTd4?=
 =?utf-8?B?c011bm4xYmxjNjZ0UU9sV2NrajVWOGpBd25vZTJTZDFDUndmejA1WFkrUFRu?=
 =?utf-8?B?TDZjZncwbERlalFkVitjd3ZyQmpGODJjekxtQm5JY25CejU0Nll6bFRJUk0x?=
 =?utf-8?B?S2xXMTJoMEczRHZpdVR2WGkwckRQT3g5Ymg0NXpoYlBrSDdKd0FEeStYVXdR?=
 =?utf-8?B?M1J3VzA5ZzNYRTNkVVBuN25TcEJYTFA0Q2dqMmplOUwrSmQ1bUpoTWpGOURl?=
 =?utf-8?B?SkYxcmpMZ3NBYURxTEhZczN3NHhwT3BZdCtIZDAwdytwS0tWVE9WaDVjb3V4?=
 =?utf-8?B?MEswOWFzUTJMcFozVUtNV3ZKeGpIMzdtT3o1a29lSnhkY0xIM3IwM1JUREN4?=
 =?utf-8?B?VVFLRS91L21QN3pkR2UxSGh3eUptSnJkNkE3Q1FrYmJPK3Y4aDlsdTB1aHJU?=
 =?utf-8?B?ajNyWUlyQ0VFaHh1TGttZ2J5WVMwM0xiOTg1T1FpRno3V0dGRVYzV01Gc3dH?=
 =?utf-8?B?RjN0c0xZQnVUaWJ6dzI1KysrTkdXZ0h1dDh0Zi9FNkxLWkx4b2U2RWhaQ21u?=
 =?utf-8?B?dW9KczZocEx5b3RjZENIaUs1NEwzb2xJZW05d2wrQmpjdUtyUTJVWllTQ3Ry?=
 =?utf-8?B?NVA1K053VE1sYk5nWUN1OVdoM1VzWWpaQWIvUVEzYzUrTU9HajNPdldFWnh1?=
 =?utf-8?B?L3JZZFNITlRxZzhvd2VHUjNzcHBTNkM2bjZ0NXJkMTA2c1pTSVVZOWZrSkxQ?=
 =?utf-8?B?VDFrRDB2RDZDSThHeVZHak5yYUxxNnY1R0NXYm4yVlpQVDBoWmluNFFPRkVQ?=
 =?utf-8?B?QlcyYThMTERvcVVFYml5QTQ2b3k3ME9yd0x0OWkweTZGdk5FajFkbkVFb2hC?=
 =?utf-8?B?WVFXT2ZGaVZSUE5LS1RhQVN2VHRMQjZZeWFQUUtRaWhlUUZQcnVyYjl4TVVt?=
 =?utf-8?B?czR4cmxOZU1NUUFYdVhZTUpKR0tHYys4endHaTZWUkJSVUxVQ05qNTU1NHl4?=
 =?utf-8?B?d1RjZHhIdGQvZDNwZlQyb2lzOUl1M2JkK0lVOVRPMDlXQXY3cjhsdXVvZTJm?=
 =?utf-8?B?aW1Rb2p5dGNDVHAxRXl5ZE5yYWUzazM1YWxGbDRRM1R1TEdxVjFBd3FRc1pi?=
 =?utf-8?B?L0dxM01FYktVMXc2TEN6S3lScUFtc3NnK21sSXhWcTZDTm9wdXFWMVkwRkRp?=
 =?utf-8?B?c21OQjdCY01IYWwydlgyYnhybHZjcXA4bDVFWENJL1d5M24yQ1FMQnVaTW82?=
 =?utf-8?B?UEszZjBITHRvbk94WUVFYjczMXB2MVUzNFc1MzNOb01NaDNYWU9KMjZwSFA5?=
 =?utf-8?B?YkN3VEFBaVFGOEJDSS9NUHVpblRzQjhYbG92YU0vTmh5cG5Qa25WcVJpS0dp?=
 =?utf-8?B?WjRBOVBwVlVjYVlLSGlvVjhpcHpmdkY4RGh4bWoxcWQ4NUFUS2FkN2JEUEpE?=
 =?utf-8?B?SjkvYWtJV0dTTCszN0x4U0d0ZTFZdVk2MGVlWTlyT0hVZDF4NTIxeW81em9X?=
 =?utf-8?B?Ymgwbjd5ZXhDRG5ZZnF2ZmtSZC9saSt3OWFVRm1oTnRLV21lS3lNK2NBKy9h?=
 =?utf-8?B?WU40SnZZTFo3UzBlcmU1MWhrM3VONnNJTXFyR29RM1VOVkxLM2pDVjFtaVp1?=
 =?utf-8?B?UlFuN3ZnaGhIWkFjUG9HaUwwMmJqb1kvQ3VqUWhVWWl2ZFFDdk94U2VQaktj?=
 =?utf-8?B?Z1pIaFFBVWlJVzFPM3NSQ252ZGdydkFaNkJtMUFobGRzMGJqN3hGVytSYzhv?=
 =?utf-8?B?bWFoRnVuMmFuY1EwSEMwRi9UZkg0YjRvYXl5ZFZ2N3FDUjB6Y1pXdVNFZ2VP?=
 =?utf-8?B?d1BYTnFENXdKVE1jWFZKY3Zqc2d6R1lEQWNyWjN5ZjJ1Nng1YzhHVXA2NmZo?=
 =?utf-8?B?OXdBb0JaKzFDZ0xKcHp1cG1Wa0FkL0huV0pJVEp0bDhrRjMzQUJYc0p2cG13?=
 =?utf-8?B?elo5cUgvbkQxZnVsRkp3MXJiOUlEM1RoV2dhSC80MFh4THVQbmVLWlVmK1R4?=
 =?utf-8?Q?yNlRpumCuiHkVnps=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D682B7665033D14BBDCC3BC61FCAFE13@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031b094d-da9e-4df3-20b4-08d9ea4c781f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 15:14:00.2262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGIGBrab+YMxlS4Yak8y++fprr84J6teSJG1BcTc53kOu/RyGPPM2/qmR5IAmO21PS7ZcTtTxXPufS7CsfO8V+GXPAwgpS2lFm8U4j1IMw81NaDEw/MNxAUx6TJBUVjg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3579
X-Proofpoint-ORIG-GUID: 12i6N7aPE2unoUddlVMdLuD6HzEXecMx
X-Proofpoint-GUID: 12i6N7aPE2unoUddlVMdLuD6HzEXecMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=627
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070098

DQoNCk9uIDA3LjAyLjIyIDE3OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNTo0NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNy4wMi4yMiAx
NjozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gQnV0OiBXaGF0J3Mgc3RpbGwgbWlzc2luZyBo
ZXJlIHRoZW4gaXMgdGhlIHNlcGFyYXRpb24gb2YgZ3Vlc3QgYW5kIGhvc3QNCj4+PiB2aWV3cy4g
V2hlbiB3ZSBzZXQgSU5UeCBiZWhpbmQgdGhlIGd1ZXN0J3MgYmFjaywgaXQgc2hvdWxkbid0IG9i
c2VydmUgdGhlDQo+Pj4gYml0IHNldC4gT3IgaXMgdGhpcyBtZWFudCB0byBiZSBhbm90aGVyIChi
aWcpIFRPRE8/DQo+PiBCdXQsIHBhdGNoIFtQQVRDSCB2NiAwOS8xM10gdnBjaS9oZWFkZXI6IGVt
dWxhdGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgZm9yIGd1ZXN0cw0KPj4gYWxyZWFkeSB0YWtlcyBj
YXJlIG9mIGl0LCBJIG1lYW4gdGhhdCBpdCB3aWxsIHNldC9yZXNldCBJTlR4IGZvciB0aGUgZ3Vl
c3QNCj4+IGFjY29yZGluZyB0byBNU0kvTVNJLVguIFNvLCBpZiB3ZSBzcXVhc2ggdGhlc2UgdHdv
IHBhdGNoZXMgdGhlIHdob2xlDQo+PiBwaWN0dXJlIHdpbGwgYmUgc2VlbiBhdCBvbmNlLg0KPiBE
b2VzIGl0PyBJIGRpZCBnZXQgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgZ3Vlc3Qgd291bGQgYmUg
YWJsZSB0byBvYnNlcnZlDQo+IHRoZSBiaXQgc2V0IGV2ZW4gYWZ0ZXIgd3JpdGluZyB6ZXJvIHRv
IGl0ICh3aGlsZSBhIHJlYXNvbiBleGlzdHMgdGhhdCBYZW4NCj4gd2FudHMgdGhlIGJpdCBzZXQp
Lg0KWWVzLCB5b3UgYXJlIGNvcnJlY3Q6IGd1ZXN0IG1pZ2h0IG5vdCBzZWUgd2hhdCBpdCB3YW50
ZWQgdG8gc2V0Lg0KSSBtZWFudCB0aGF0IFhlbiB3b24ndCBhbGxvdyByZXNldHRpbmcgSU5UeCBp
ZiBpdCBpcyBub3QgcG9zc2libGUNCmR1ZSB0byBNU0kvTVNJLVgNCg0KQW55d2F5cywgSSB0aGlu
ayBzcXVhc2hpbmcgd2lsbCBiZSBhIGdvb2QgaWRlYSB0byBoYXZlIHRoZSByZWxldmFudA0KZnVu
Y3Rpb25hbGl0eSBpbiBhIHNpbmdsZSBjaGFuZ2Ugc2V0LiBXaWxsIHRoaXMgd29yayBmb3IgeW91
Pw0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

