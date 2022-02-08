Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7864AD584
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268027.461800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNnV-0005a2-9A; Tue, 08 Feb 2022 10:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268027.461800; Tue, 08 Feb 2022 10:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNnV-0005WH-4l; Tue, 08 Feb 2022 10:32:33 +0000
Received: by outflank-mailman (input) for mailman id 268027;
 Tue, 08 Feb 2022 10:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHNnT-0005W6-UM
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:32:32 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8b36ed-88ca-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:32:30 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218A8sDE032547;
 Tue, 8 Feb 2022 10:32:27 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3pgk83dn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 10:32:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3390.eurprd03.prod.outlook.com (2603:10a6:803:20::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 10:32:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:32:21 +0000
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
X-Inumbo-ID: 6a8b36ed-88ca-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQK1aKygvjxnXX6xTW8NjYJtK2e2fTHMDYGKqSTykF7zCmufD6vyjNntV5xVWGlUm0i5v7eIZWu61apSejrJspNp9CWFd+Vxrb9mVqQANl3FISSNwL+uviIjLIiYIhzFsBnJOZfiDjUSpJUfgVt78Uj8qrHIiDY/kD4B1F2ZFuhx42yiiMVpYZyKnovqQ4q3o0u2wC6kGrFkjlBHc/CCGMd3yRtTmSSL2Fdt23k96do+wrhiDN2TwLjQHhNKqJ2FMuZAC4BaOmftxRJ5ZgjblWeav8BdqOwFQnw8TGaDI0Ioi2+3QB18VFhPlW+ac3dA7snJHIJjhnG2mwAo0k4xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG4b2rQhdAhL/+zIFYHPFUKHkMqS1X24X2vCGEa0rFU=;
 b=Yz7UfPDubc2FZg8gR6IUADuW3xVhN7gieXIMCOuS9/HIkBNCbg/i+FqRctjXWx3Y3AAF7eUSm7R4ZIAdIxbYcDqFql3X6ohLK+m6zqSh1W1bxF6ZJx++kp9UryV1x4uKOEg2D4YoNs1g4INTpDGcBguBpm4o9LZgWZXNAi8k5NUxKsOeNJRZ/lyLMXJHSqquPkYF64ZmMg8CL34a112RyQBnQOwSPvyi+mCf9PFY5pbvsqt0lji7RgP2OTzFdxk7wapnUpko0D8k4nTYZbeZPF078dz1ep98sR76aGSBuoRA9y4ZF8tCMlic3Qm4z2y+WPbJOh3DFDUfliOyqON0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG4b2rQhdAhL/+zIFYHPFUKHkMqS1X24X2vCGEa0rFU=;
 b=V04dPvepm3K2utIxirD3VtIukaOx8DuUXiCQSwT1bvJxum9DLZ+miHHFuIO/BSoelfBlyfqHIVdNVw/rUDqVmpcOnAGtniFWDW2VizZ4rAf0CGPkWhq4d15Ss/Li8ssr3/IBFO/lkH9bf59fElLFg3El7M7M8VjERIj2ARoje4wJtOQZxKIkKH+J2Vc3OrcnvJunJ2Uu2eo6b7imU5n49IF7bZ3Q+1hMVCWbW+i3W8JV8az+MiMv0sF+qLChshUCdz0U2K57pwoAlYga3vJ+NzvJrOQ/gxAREznInbP9z/ekg8UhKAc0FNxqw/7EijOTcPLuU9k1p/Pc8JhJB0fWsQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgIAABJiAgAEmUgCAAAXkgA==
Date: Tue, 8 Feb 2022 10:32:21 +0000
Message-ID: <145d6ab6-dd40-83d5-b8c4-0a995ce25094@epam.com>
References: <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <YgJBwrB/qDLSNMIu@Air-de-Roger>
In-Reply-To: <YgJBwrB/qDLSNMIu@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7f29d9e-1d9b-4b70-36d4-08d9eaee4a27
x-ms-traffictypediagnostic: VI1PR0302MB3390:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33905A9372874867DDC7EF29E72D9@VI1PR0302MB3390.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e/Zno5NHi5gvav423mmSqMjsr9HCDpv1iDgAE12s6H1QZhOvYiMuihHUxTIGahxiJ7qY+/P0VRAED0wKxAVaPv7DWEMXIb80HCEqmYmNtAKy1VuF9nirN8oH09f+fl4JUOmZRYq1l3VKe1Hluv7/UonzNDOH/29jaME9S1/J+Z4rNwq++9Pv09LTYcVwNrSBNlNFf5BDR2pM/uXiLA90zbQLybQgcPjEP+N0flS21X3zlaU6jNOnD4boTH4NwYgH94kmIR405EP/TmoHLDtQht7T5BmgwBwGJULSI2SsiAuwN4eJjO06/Bk9lxk0p6LOm7KjccvqvueIVJ1gVNNziCvkSl2E5NO3F6srCT0j1QwbccW0WMfxN8mTKedGg3SWdmcv2AGkw1waldVyZbQA7JiWZmoKgJf2s1mq8VEtLYOyZwAdMdTm+g9pIns4Rdb4cK+MEIlXbI2LTGyJY3whJfey0/m0SiGSq9ilGVqOixCehEViDlI27udt/cyP39NptB85BufzWY7P92c9VYzUXYrI29XGjakeEwZYAs0XlW/f6y6gvD7rdeghhOLI/5EBTRqG9em0wBPt9O5tyIYD3Osu5nmjJjTIbs5b1wxPP6MK0q05yPq3jRFcmHWL5oPysjSmplpCxRHEQ+9+lsCacmERQwrbSm6Xp7sTjbJrlRs7HDSD/FvNAFXkzU4eNcsyGds/HFfLGItt91+m+IoT+TETkxtV2DLNhsc0mP5LRdkq70xWOl5E3/nceNnOLxjA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38070700005)(53546011)(6506007)(55236004)(316002)(7416002)(31686004)(122000001)(508600001)(38100700002)(6486002)(5660300002)(36756003)(4326008)(31696002)(91956017)(186003)(54906003)(64756008)(8676002)(71200400001)(66946007)(76116006)(66446008)(86362001)(66476007)(2616005)(2906002)(110136005)(107886003)(6512007)(83380400001)(66556008)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NzlhTlhtbUJZUXhVaEdJV25yNUEwbE9IbWR5Vm9UTlExRENVL2tWU2d0WCtw?=
 =?utf-8?B?bmVUUHR0d2pEeTJqL203c1kzUFZQSmh3bDZrZzh3ZDU5NEpnUTFsaUZlNnJ1?=
 =?utf-8?B?eFlUMllhQURxNHZQekoyMnBSUFpUNnc1Z255UER5UXVpVjdmUFdNZkVqZ3Zp?=
 =?utf-8?B?OWN4TS92V0E1QVF3b0VETUd2a2hjeGF6MnhuYmVnbzdvbDZwc3ZXWEo1S05D?=
 =?utf-8?B?VmZHeDJSVUplVTlPaHA1eis4SWF6UXpzWlc5SFA4enJUeUUrTzJuS3FnaDlx?=
 =?utf-8?B?UjlBb1BUMW9lcHNFVStNV3UxU1RMeUJnaHZnbXV2Zy8yU2FEU1BwaDdBblNi?=
 =?utf-8?B?eHJUbjR5RUJXbXdMWkpHaGRDT0lZbDFHbUZsbkVUc2p3VE9Ga3hhTHorVEVZ?=
 =?utf-8?B?TGtTZnhDZUhLeS9wcHZYRlNMVXd6NGJPL1MvaDkwRGl0S2JIeWZRNGZ6VnNZ?=
 =?utf-8?B?dG5lNkdWaytJQUxlTTFDTUxRT2paeWo4d2o3c2NEbGEvRTI3Tnhpdkt2VmdH?=
 =?utf-8?B?N1JDUWRIbUUyOHhLSi81NzdwdGRzNW9UOSt2S084Z29IYUlpVjRoYTY3NUYv?=
 =?utf-8?B?WDY5TWtwSHNwYlpSQVRjSTMxMjN6c1ovYUxzNXZidGhEdEVjZlpuTU5kb3g4?=
 =?utf-8?B?aGxBdVI0ZmQxN3FsWUhab3VVWTh0dDhvdGhEK3VLS0ZqeHByT29sd2EweFBy?=
 =?utf-8?B?T2ozNmdaNlJ0ZGtmS29LTndHbm10VTBaNUlNb2txL1J0ajdKYytySkozNzJB?=
 =?utf-8?B?T2g3Mm1HbjRqZVh1QkZiSHBwak9ISjhCZVUyc0VBdTRiN2FFSFg5S0dpeU9I?=
 =?utf-8?B?TnFGZ2tMa203bk04SE1GSmUyait1MGp6Uk5KMG5UbnRPcFdETEtUZGMrSUxH?=
 =?utf-8?B?RjFaYTZZUDdUL09lL3ZHOWZ2WWtOekZwRmk0UldSQWpTZ1FwNWlPSE1FbVpE?=
 =?utf-8?B?REo5N3VnV1UvRi9pTU8vM0dMYjAxMEJtbVNsOVpuRWltZHphTzNXZGlLdkpK?=
 =?utf-8?B?SE5ucmdSYjhGMFM1V3htcnY5RSt6cE02RmNIeERSSGJ2OUkzaVgrYzZFQS9k?=
 =?utf-8?B?dkhHSHZ0c0lCSjhKTlhnc3lVNlVjTWpxeDFvdmxhMzh0V3J1ZnQyOEhBeXA5?=
 =?utf-8?B?U2sybVozUlhEVmVEY1FZWDZoalJpWmo3YllodHp1YUZSSnhVVStXVUh2TjJo?=
 =?utf-8?B?RmNQc2F5Y2lQVzhnZnNSVEgyNkFZQncyYnQ2Z0Y0OUVWU1JTamNFTmU4Nkh6?=
 =?utf-8?B?SGdickJXUXAxUVZmOUlmbUpDUzNoR2hocERWSlhCVWF5R0tER2VINnFvNkFr?=
 =?utf-8?B?SU9jUWpuSXZSdlBHaSsxL0ptRzB1OFdQVWFHeHRLcmtYSkpmV0RPZ0kyZVJJ?=
 =?utf-8?B?UVo4bDBhVkdpZXVPaXJya29YMkFzZnFhVEhxT1BQMU5jdnR2dU1waENnUk00?=
 =?utf-8?B?c2Y0NHVrSHpUKzdHdzR4OTlKRlF6aXNzYTBzTXJQVXRFRW5mOUJkRjdiSitE?=
 =?utf-8?B?a3Q3YmtHTmxIbkpZNmdVdXAzcXRpUzd6eHZ5WHZkbFFrNllDSUlNWmNaZWxv?=
 =?utf-8?B?NlByemN4QU1taThuSER5QzJxbXlOWmFsV3UyUC9nRXdDYms2MkN4cHhoVGVm?=
 =?utf-8?B?Q1RsQW5CL1NYZHV1U1RjY2dlQWFtMGZwdmZkMWpNWmtaTWFEUUtCeC9nYlFT?=
 =?utf-8?B?UGRGeHpKRkR3WjJRNFcxLzRwK0huTmEyeTViSUxhZ3lUVG5Vc0xvdDhHaktq?=
 =?utf-8?B?cXNCdXpCbkt0Q0FmU2NmQi9Bb2doNlBITFRxeU4ycUgyNFdvTUVvYTZTQ0Zr?=
 =?utf-8?B?YXBaWFJ0bXJtbFJ1eHd1RldIQm9JYmxCcitTbjFCaW1lWnVmSUJPV3IwS0tp?=
 =?utf-8?B?NCtFTjErRzNwQVF4eERCTWFSTXUrUXd4UW0zUDhlVXM2YVVaenc3Q0MvUU1x?=
 =?utf-8?B?K3o5WG12cUxnTElKL1c2MWFTTjJ3MS9pZ0h3ZGpTcmllVDBtRnMzT2pURXNZ?=
 =?utf-8?B?V2U2bEJYRnMzSHg1eUVjSlRkUjJOVXhoZVFqRXBWNEVEcTNJbk9ZM0NrdXFw?=
 =?utf-8?B?TEdFZjJ5WWlhdmE1U2xBL3Q4YWxuYmhrUXhpY2Y2bjRFdzJoOFJGR3lmRmxs?=
 =?utf-8?B?cXR4bEFYb1VLbjMvdW4xdmRZQ3Q2WnY2M0RCcGxVYXB2RVFyTlFETjdPU29K?=
 =?utf-8?B?R1VVMXlIalEvYUs2SENoRitDUVVKa1ZyZVEyMkp3cVBaZUl2WUVGM0ZqSEpC?=
 =?utf-8?B?b0pIbVp0TUFGMUJlbytuejhrb2NXeThacmx1eGhWZ3hvNm0za3BiRVEwOUhy?=
 =?utf-8?B?emhHMkVCK0R2Nm9yNXJyNnBvZGtOQ2p3dC8ybHlQOTNyelZ3d0lvbW54WHFU?=
 =?utf-8?Q?xUv3Qe1tbMRFgGCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C3120A237DC15478708B30622BF91C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f29d9e-1d9b-4b70-36d4-08d9eaee4a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:32:21.5898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkiQg9OOf3TwbHRmaEOIZZpZ02vx9oA41DGSsFszrTNtkFYELrsDzuGfmo69X8PaYSKOxGXZo7EE4GhgfKJG5BbzIbejtlZMpWUJHseBZkrH40yaN7IPx2Qv6EhFkyZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3390
X-Proofpoint-GUID: Kr75HjdOEk-8g4v-lmDMfsNvMTiac6Uw
X-Proofpoint-ORIG-GUID: Kr75HjdOEk-8g4v-lmDMfsNvMTiac6Uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=887 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080060

DQoNCk9uIDA4LjAyLjIyIDEyOjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAwNywgMjAyMiBhdCAwNTozNzo0OVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
IE9uIDA3LjAyLjIwMjIgMTc6MjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
DQo+Pj4gT24gMDcuMDIuMjIgMTg6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNy4w
Mi4yMDIyIDE3OjA3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IE9uIDA3
LjAyLjIyIDE3OjI2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiAxYi4gTWFrZSB2cGNpX3dy
aXRlIHVzZSB3cml0ZSBsb2NrIGZvciB3cml0ZXMgdG8gY29tbWFuZCByZWdpc3RlciBhbmQgQkFS
cw0KPj4+Pj4+IG9ubHk7IGtlZXAgdXNpbmcgdGhlIHJlYWQgbG9jayBmb3IgYWxsIG90aGVyIHdy
aXRlcy4NCj4+Pj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgaG93IHRvIGRvIHRoYXQuIERvIHlvdSBt
ZWFuIHNvbWV0aGluZyBsaWtlOg0KPj4+Pj4gdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2Jk
ZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsDQo+Pj4+PiAgICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgZGF0YSkNCj4+Pj4+IFtzbmlwXQ0KPj4+
Pj4gICAgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCByLCAmcGRldi0+dnBjaS0+aGFuZGxl
cnMsIG5vZGUgKQ0KPj4+Pj4gew0KPj4+Pj4gW3NuaXBdDQo+Pj4+PiAgICDCoMKgwqAgaWYgKCBy
LT5uZWVkc193cml0ZV9sb2NrKQ0KPj4+Pj4gICAgwqDCoMKgIMKgwqDCoCB3cml0ZV9sb2NrKGQt
PnZwY2lfbG9jaykNCj4+Pj4+ICAgIMKgwqDCoCBlbHNlDQo+Pj4+PiAgICDCoMKgwqAgwqDCoMKg
IHJlYWRfbG9jayhkLT52cGNpX2xvY2spDQo+Pj4+PiAuLi4uDQo+Pj4+Pg0KPj4+Pj4gQW5kIHBy
b3ZpZGUgcncgYXMgYW4gYXJndW1lbnQgdG86DQo+Pj4+Pg0KPj4+Pj4gaW50IHZwY2lfYWRkX3Jl
Z2lzdGVyKHN0cnVjdCB2cGNpICp2cGNpLCB2cGNpX3JlYWRfdCAqcmVhZF9oYW5kbGVyLA0KPj4+
Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZwY2lfd3Jp
dGVfdCAqd3JpdGVfaGFuZGxlciwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4+Pj4+ICAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2l6ZSwg
dm9pZCAqZGF0YSwgLS0tPj4+IGJvb2wgd3JpdGVfcGF0aCA8PDwtLS0tLSkNCj4+Pj4+DQo+Pj4+
PiBJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+Pj4+IFRoaXMgc291bmRzIG92ZXJseSBjb21wbGlj
YXRlZC4gWW91IGNhbiBkZXJpdmUgbG9jYWxseSBpbiB2cGNpX3dyaXRlKCksDQo+Pj4+IGZyb20g
anVzdCBpdHMgInJlZyIgYW5kICJzaXplIiBwYXJhbWV0ZXJzLCB3aGV0aGVyIHRoZSBsb2NrIG5l
ZWRzIHRha2luZw0KPj4+PiBpbiB3cml0ZSBtb2RlLg0KPj4+IFllcywgSSBzdGFydGVkIHdyaXRp
bmcgYSByZXBseSB3aXRoIHRoYXQuIFNvLCB0aGUgc3VtbWFyeSAoUk9NDQo+Pj4gcG9zaXRpb24g
ZGVwZW5kcyBvbiBoZWFkZXIgdHlwZSk6DQo+Pj4gaWYgKCAocmVnID09IFBDSV9DT01NQU5EKSB8
fCAocmVnID09IFJPTSkgKQ0KPj4+IHsNCj4+PiAgIMKgwqDCoCByZWFkIFBDSV9DT01NQU5EIGFu
ZCBzZWUgaWYgbWVtb3J5IG9yIElPIGRlY29kaW5nIGFyZSBlbmFibGVkLg0KPj4+ICAgwqDCoMKg
IGlmICggZW5hYmxlZCApDQo+Pj4gICDCoMKgwqAgwqDCoMKgIHdyaXRlX2xvY2soZC0+dnBjaV9s
b2NrKQ0KPj4+ICAgwqDCoMKgIGVsc2UNCj4+PiAgIMKgwqDCoCDCoMKgwqAgcmVhZF9sb2NrKGQt
PnZwY2lfbG9jaykNCj4+PiB9DQo+PiBIbW0sIHllcywgeW91IGNhbiBhY3R1YWxseSBnZXQgYXdh
eSB3aXRob3V0IHVzaW5nICJzaXplIiwgc2luY2UgYm90aA0KPj4gY29tbWFuZCByZWdpc3RlciBh
bmQgUk9NIEJBUiBhcmUgMzItYml0IGFsaWduZWQgcmVnaXN0ZXJzLCBhbmQgNjQtYml0DQo+PiBh
Y2Nlc3NlcyBnZXQgc3BsaXQgaW4gdnBjaV9lY2FtX3dyaXRlKCkuDQo+Pg0KPj4gRm9yIHRoZSBj
b21tYW5kIHJlZ2lzdGVyIHRoZSBtZW1vcnktIC8gSU8tZGVjb2RpbmctZW5hYmxlZCBjaGVjayBt
YXkNCj4+IGVuZCB1cCBhIGxpdHRsZSBtb3JlIGNvbXBsaWNhdGVkLCBhcyB0aGUgdmFsdWUgdG8g
YmUgd3JpdHRlbiBhbHNvDQo+PiBtYXR0ZXJzLiBNYXliZSByZWFkIHRoZSBjb21tYW5kIHJlZ2lz
dGVyIG9ubHkgZm9yIHRoZSBST00gQkFSIHdyaXRlLA0KPj4gdXNpbmcgdGhlIHdyaXRlIGxvY2sg
dW5pZm9ybWx5IGZvciBhbGwgY29tbWFuZCByZWdpc3RlciB3cml0ZXM/DQo+Pg0KPj4+IERvIHlv
dSBhbHNvIHRoaW5rIHdlIGNhbiBkcm9wIHBkZXYtPnZwY2kgKG9yIGN1cnJlbnRseSBwZGV2LT52
cGNpLT5sb2NrKQ0KPj4+IGF0IGFsbCB0aGVuPw0KPj4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGlz
IGluIGFueSBkZXRhaWwsIHNvcnJ5LiBJdCBzb3VuZHMgcG9zc2libGUsDQo+PiB5ZXMuDQo+IEFG
QUlDVCB5b3Ugc2hvdWxkIGF2b2lkIHRha2luZyB0aGUgcGVyLWRldmljZSB2cGNpIGxvY2sgd2hl
biB5b3UgdGFrZQ0KPiB0aGUgcGVyLWRvbWFpbiBsb2NrIGluIHdyaXRlIG1vZGUuIE90aGVyd2lz
ZSB5b3Ugc3RpbGwgbmVlZCB0aGUNCj4gcGVyLWRldmljZSB2cGNpIGxvY2sgaW4gb3JkZXIgdG8g
a2VlcCBjb25zaXN0ZW5jeSBiZXR3ZWVuIGNvbmN1cnJlbnQNCj4gYWNjZXNzZXMgdG8gdGhlIGRl
dmljZSByZWdpc3RlcnMuDQpJIGhhdmUgc2VudCBhbiBlLW1haWwgdGhpcyBtb3JuaW5nIGRlc2Ny
aWJpbmcgcG9zc2libGUgbG9ja2luZyBzY2hlbWVzLg0KQ291bGQgd2UgcGxlYXNlIG1vdmUgdGhl
cmUgYW5kIGNvbnRpbnVlIGlmIHlvdSBkb24ndCBtaW5kPw0KPg0KPiBUaGFua3MsIFJvZ2VyLg0K
VGhhbmsgeW91IGluIGFkdmFuY2UsDQpPbGVrc2FuZHI=

