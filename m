Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6883456F74
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227902.394305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3lo-0000pR-SG; Fri, 19 Nov 2021 13:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227902.394305; Fri, 19 Nov 2021 13:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3lo-0000lH-N0; Fri, 19 Nov 2021 13:17:36 +0000
Received: by outflank-mailman (input) for mailman id 227902;
 Fri, 19 Nov 2021 13:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3ln-0000GL-4t
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:17:35 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d73a2ce-493b-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:17:33 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJBY9V8005703;
 Fri, 19 Nov 2021 13:17:30 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ceb5k8ckp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:17:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2766.eurprd03.prod.outlook.com (2603:10a6:800:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 13:17:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:17:23 +0000
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
X-Inumbo-ID: 0d73a2ce-493b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPuQFqbLo10LN8bWfUiVr/srTjHYnW0KQRQlADoD96GIYJNnVCcxYAnoppeuNCTgX9DiaKP0E/CaaSbWn62n7nJ4Qk8e8d7RCe58pASykSP0t20L0VPyTstYONt6b+vZrbBO2jsqkXENSCEpbuXAjWDDCpNV4cWb0bzJiLo97FcLcEn4yV7L4UzJw92OoZYLKHyXJ7YWeVLXJ4a/+ZUlzE344tEnJPX2OWRzrW+LF6ME4nu7K6fNn7h2g7PEoLSmpArSbBJlaUkXPcvwxA07r75h4ri6147lwuXnxdQndTgRrPWN6NeXXUpiWUM1AyB9Mi/YjO1vRg/rvlhKRorLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m87jVKHMXLDGK3A+/s5Qm0sbPdy2PT3lufBlDM6Xr4I=;
 b=ns89OowdoqMDvRuS8ICtUth+xV7H4sM/W/YMyaS2o7UssUi/YzYjSqDOFzldvu4S+uI9o1Sl2wV4oMu+aSO6pF/UPRUzX7Zy5oUJoSMYwjoktkAiKxl2CEmLw5+QoSXh0LwRCMJgS+Pwh1MEhuHdGV79bXdQWNZcjOTPtd3xgmqsApbomuxpbmtPxQgoD5ytp/oRMvObutB7iH0xyEopUjBU5j8Gvmw4EvXQs31TZeTh/XQQar719XksABnHGGbTwOi6Z+YniYtum4ag2AIXncPaOmN+NBMjdgMIl9N7E4hXowaeNlA5SXJYoE8HGV3DxHwZSXBEfMOsf6xqfi/IJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m87jVKHMXLDGK3A+/s5Qm0sbPdy2PT3lufBlDM6Xr4I=;
 b=isWWPZS1LwPkce+0CA5rugg3qLZGHszbGqG6XpXWEFIrXjyDFwygWd4T64Eg/hl3QEGgC7+o9kI7VNstsn9PJZLvy0RvgMz2djkO+NuCVETeMEF5TkRhMk2KbCIeSqlE+E5PPrcaxvyOiKfTp2vqh4gqlPYPyu/+kRE44s8eVd9YggzwuW2iKoyI3rX1aNVfJyaK39iPshJsnt2lxvL/1ehg5Uk4VPSeigXwddD9EFwittkSz9LjOir3hULCN13RfpcgiiD2WPUVlTqO3k2dGCJXbkoDfEPJEN55aX01VC4v8cH/WH3AKWhuXdVpDwVPwgAxbI0d+TUPi8s+X0Ei5g==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX0hJK3jTao+VT7Ua3mM5UrGfltKwK1UUAgAADYYCAAAeUgIAAApWAgAAAtgCAAAGSgIAAAk+AgAAEBwA=
Date: Fri, 19 Nov 2021 13:17:23 +0000
Message-ID: <b45969bb-4d44-4b01-bc40-e168c0391ab6@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
 <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
 <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
 <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
In-Reply-To: <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08981d46-6e17-4542-13d9-08d9ab5eec71
x-ms-traffictypediagnostic: VI1PR0302MB2766:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2766345E9B39975C63A3CBE4E79C9@VI1PR0302MB2766.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZL/rIGNmaSwX1L13gK2pl9JHNQNnCjbx/Qm6wkyE3Svf0nvle+VxMqNfBl65cJ/AeMvLbIxo/J8F62VgX2TPfOyY0256wVLJ42p3kVWc0bn41GuG0zsQoeZSuhGUBTgCJNOCQnclKvop2uVE5PMXSabQzZXdUm67jFGhwIMha2LuzrBcxBjwZZw8/V/r7iw76emXr6PbDD28Yr0pQtBVAPaiuIX9iAaOCKb6GuaUOmH6zD/7dexePjJh//Lwr77JYT7qg6+umYG4LVTzQF6jCaCCNhbyk5LKKZO7koFjJnlNqz4q3TLANTevjOxYWcBMAUGftD6RvoKSFEvoZtexzCvn73y9l+uwp+/kzDIIPlf5ptuExGCeUZ3kVinjPM1c+eOFJhp+eCnqz/ye7CV0B+R0n7KE1wLuP3kO4rWcR7DB5DfBcCQd9Os6m2/NaF+OpAJ5Wo/PuqHhkH7UYiJYvQzgkh+82Wjrka1gALzEucfEcZ2q0hSP3KnqFrdU/zO624ll4li4hnKLh0f5I6EVl7qZ3GCEa/bOp6Bxb5El0Zo/mjGQ6X1tRhE/h4U+LIuHd+lSNKSp7RMezwrm/G1+PcyZ/lgP0DIyK40jXDp8Kr8bpWlTyampOageH/waOjpZDVgoXyr6VBTpgTotVGSqhMhgjIoTHbcl3thHgENa0yIbo7Js8wTqQUM41gtJTb0UNARq6U+JahqIToMshLmU/DYI/m2tpx2B1vp25S23/7+372Mqs9GH+PJ01voo3jat
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(54906003)(2616005)(4326008)(66946007)(26005)(71200400001)(31696002)(38100700002)(6486002)(91956017)(31686004)(186003)(8936002)(66446008)(36756003)(66476007)(76116006)(2906002)(38070700005)(6916009)(6506007)(53546011)(86362001)(6512007)(122000001)(508600001)(64756008)(66556008)(7416002)(316002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?amQraWJHTFFNNEtpWTVTYkNCN2JmTWdjbDZIUGt1VGNidXpXNVdqY2dyaURj?=
 =?utf-8?B?Ni90ZzM4c0tqeFQ4N3huaXp2OFJWbGxJb3E5bHZuZWsxZVgzK09BL3dxV2dT?=
 =?utf-8?B?M1c2cUhaYXh6SkpJVTIyUGVIalRvU0FLdlJBNldKOU5lZExzSXJHUnc5UGZr?=
 =?utf-8?B?WktZaTNkNE02RGVCME1DcC92YWIwWDlweHUybzNHRDVjalBtMjJleGJYc3Yx?=
 =?utf-8?B?SmZnRjNTY3BrbWNrc1FTMXlBcWJtU3dkeXdyLzA0KzBLVTlaOUxGOG56TDJw?=
 =?utf-8?B?TUJ4ZzhESWk5QkpXMENUNUhMY1ZCY29DWDNRTEpWWlhlZmQvZ09CWmFYRy9K?=
 =?utf-8?B?QTgyQ3ZrY1NhU2ozUFgyUnR6V1ZHZ0xQRHFLamdaYWNvQTY4YnNmMW94U2Rt?=
 =?utf-8?B?R2Y0K3ZQTWY2b3VhVUdPVzdaZVA0WE5aalNLbUhFQ0t5VnRqS1RZU1dXTFUz?=
 =?utf-8?B?RGc0cnBGemJXYWxJd2MvSW1jZXhYOGRFUmg0NXlwaHg5dlFlcktzdW5qakNW?=
 =?utf-8?B?alVocGhMTFk0Y2FFeHMwbUkzYWRWVnYrQUdrcVd2WUVwdDdYcHpvVWZ6UnZB?=
 =?utf-8?B?MXdLLzNLY2wyUzE5R1FZTG13NjdyRXRaVEd2QjlxTzUydnRsdTRSdHdCalFQ?=
 =?utf-8?B?WEdyMmV4U0Z2Vzh4VXQvandMM0pXdEVPNVZSbjR4UjVicVNCYmJ6L1d3SlZi?=
 =?utf-8?B?NVVVS0xnNTBQRDdjY3lZK0poVDA1ZXpUcE9hazA0dzFyNUg2NTdkQmpodmgz?=
 =?utf-8?B?OGpLbzdYcUgwTXAraFRJMmx1Vk9BRkVrdTI0R2JkUzY1VE1CNlFjRkJuRlVN?=
 =?utf-8?B?YktRM3VyZFVZTFJWWnZDYkVBbjNQSzJWNng4NmgzbnFhUlFNdFF2YTdpTTMy?=
 =?utf-8?B?L25xMU8yZGllWEVESVJlS1lJaVJSaEUrRW84QVBqNFRZa3M2MHVUdzRzdklr?=
 =?utf-8?B?SE45VEY4UVZvd3NzUjhSbUZnUWtnaVJjTTBXWVdXZXlKVlIyWDZFN3dibFJ5?=
 =?utf-8?B?d0tQSHA1NUNrbDIyaXJNb045WnNEdS9RR3lFcmRwSm9ldi8zL3Q3LzdZdEt6?=
 =?utf-8?B?dU1wemZONVZpcVVMRFNGUExBSVlRclJNelduc3k5TWZsL1R5dmZVcWNTMnoz?=
 =?utf-8?B?QmFtM2RDTmdyb3pNZDZvNVRSemZSTmd1ZGU4eVVUVW5PdHFhaXlJb2czc3RO?=
 =?utf-8?B?bVZxSzNqZDRWMlZFMDhqUHdHVHRqWXNUWkl5ME53R1JVNFFsNXA1YytJQmg2?=
 =?utf-8?B?SkpDSFZ3djZYTmlsemJ3NzVHWTVKTURnRWhiRk1CQTNhdDZyTjB1NVhROGlk?=
 =?utf-8?B?VTlNY0VNdDhRS25RYURaNVljRzd3Q0xHemYwZWR1emFCc2ZJQTJ6RHBOTlU0?=
 =?utf-8?B?UHZsTzRwWWJENVZXNlJNTzk5eVAvOENhYWxxZHdKdTR2ZUxZaVIzdm00bmVU?=
 =?utf-8?B?MjVKNGZhcWtZVS9KV1NZVWwvcFJjK20zMlA5U09QWldtMzQ1WTRMTTBYZFQ3?=
 =?utf-8?B?ZnJJSzh3cVZ4bU9RQWpNQk5tcjRVSXgzSXJDYkVtQjl2S1p6ZDREVk93cGtX?=
 =?utf-8?B?Z3BKQlNhMS96ZFQyS2VrNkNNeklUOXRVYjB2eGVBeUxRS2FDUmo5WEtMclJU?=
 =?utf-8?B?Lys1VjhxQWZ6K3NNVnFFVkFzc1Y5aTM4NHJWRWEzRWIydXY1aFpCb3d1SzBD?=
 =?utf-8?B?TVhxTzVJalc2ZWc5UEhOcmt2Zk9WdUo4aUJVbzliamdLSk9ySjRIbWhEK3FY?=
 =?utf-8?B?QnJyWkVDQUZMWFlsR2RWNmx5WVBQclNoQ3R6b3V1b090Tit1QUNONXBocjUw?=
 =?utf-8?B?SDRoU1dWKy9SSE9vY1ZOL1JaVVpEODVRVjZsZWtoVkxPaVJxRjZIR3N2a2ZP?=
 =?utf-8?B?Vk0wbXdOd1htNk05ejNGMUZuSGRYQklpR1NOenVrTGRlU0pVc1c3UU51Qmhr?=
 =?utf-8?B?UU9FaUp3NHh2cEE3Z1o3R2JlNnhVRFYzOXkwNjN2bm9yUjh3YnRINWdqTXhC?=
 =?utf-8?B?SVZrRXJrdXZlQ29xQnZLU053UGpoSjY3Zll2TGpRdHNUNktmMlhWd1hlb1Rx?=
 =?utf-8?B?K0c0bmtEMVNkK09sbHU0VnlBaEZIZWRqbTU5TkhSVmdUV3o3ckN1OXQxK0RT?=
 =?utf-8?B?M1g4YXhrMEh3NllYb1hLSjUxRVdvTTRjeVpxQzVKL21mUDhRdGtxandybEh0?=
 =?utf-8?B?U01JczAzZEcwNC9xN3dwQlFTVHIxb2liQ2xmVFpndG4xc0VqZHNuQjVvYlQ0?=
 =?utf-8?B?cTNUTlBiK0tVbDVGUE1iSm93WHByUURkK3I1WVdBNjljUHNIREZiMHVTbXNX?=
 =?utf-8?B?T08vR3hlV0pxenIzVDhXZGJTZGhrMW5YVHlaaDBZSENOU2tBdEZ5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D6DA02F5A28C41AF1C1788C744B2F8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08981d46-6e17-4542-13d9-08d9ab5eec71
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 13:17:23.0361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fspY6R4Svb2sRiBqIx1T/MIDo8Hj3aA5k4ZgP+4I5aWxllB6n2LMfUpPPmZ+8cY6DpjBp5r7/Rli/hxwlEC5ZFR83LDw3y8vuAjwbw6CLVDe1JS9V6uXLydbGSISGR4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2766
X-Proofpoint-GUID: vzW5OvJlZlT0IqKDB2tie6lYNN9X3MDn
X-Proofpoint-ORIG-GUID: vzW5OvJlZlT0IqKDB2tie6lYNN9X3MDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190074

DQoNCk9uIDE5LjExLjIxIDE1OjAyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxMzo1NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjAyMSAxMzo0NiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDE5LjExLjIxIDE0OjM3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDE5LjExLjIwMjEgMTM6MTAsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDE5LjExLjIxIDEzOjU4LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+Pj4gT24gMDUuMTEuMjAyMSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+
PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+PiBAQCAtNDA4LDYgKzQw
OCw0OCBAQCBzdGF0aWMgdm9pZCBiYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYs
IHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4+PiAgICAgICAgICBwY2lfY29uZl93cml0ZTMyKHBk
ZXYtPnNiZGYsIHJlZywgdmFsKTsNCj4+Pj4+Pj4+ICAgICAgfQ0KPj4+Pj4+Pj4gICAgICANCj4+
Pj4+Pj4+ICtzdGF0aWMgdm9pZCBndWVzdF9iYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSkNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiAr
ICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsNCj4+Pj4+Pj4+ICsgICAgYm9vbCBoaSA9
IGZhbHNlOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICBpZiAoIGJhci0+dHlwZSA9PSBWUENJ
X0JBUl9NRU02NF9ISSApDQo+Pj4+Pj4+PiArICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgIEFTU0VS
VChyZWcgPiBQQ0lfQkFTRV9BRERSRVNTXzApOw0KPj4+Pj4+Pj4gKyAgICAgICAgYmFyLS07DQo+
Pj4+Pj4+PiArICAgICAgICBoaSA9IHRydWU7DQo+Pj4+Pj4+PiArICAgIH0NCj4+Pj4+Pj4+ICsg
ICAgZWxzZQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiArICAgICAgICB2YWwgJj0gUENJX0JB
U0VfQUREUkVTU19NRU1fTUFTSzsNCj4+Pj4+Pj4+ICsgICAgICAgIHZhbCB8PSBiYXItPnR5cGUg
PT0gVlBDSV9CQVJfTUVNMzIgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9UWVBFXzMyDQo+Pj4+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogUENJX0JBU0Vf
QUREUkVTU19NRU1fVFlQRV82NDsNCj4+Pj4+Pj4+ICsgICAgICAgIHZhbCB8PSBiYXItPnByZWZl
dGNoYWJsZSA/IFBDSV9CQVNFX0FERFJFU1NfTUVNX1BSRUZFVENIIDogMDsNCj4+Pj4+Pj4+ICsg
ICAgfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfigweGZm
ZmZmZmZmdWxsIDw8IChoaSA/IDMyIDogMCkpOw0KPj4+Pj4+Pj4gKyAgICBiYXItPmd1ZXN0X2Fk
ZHIgfD0gKHVpbnQ2NF90KXZhbCA8PCAoaGkgPyAzMiA6IDApOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+
Pj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfihiYXItPnNpemUgLSAxKSB8IH5QQ0lfQkFTRV9B
RERSRVNTX01FTV9NQVNLOw0KPj4+Pj4+Pj4gK30NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICtzdGF0
aWMgdWludDMyX3QgZ3Vlc3RfYmFyX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVu
c2lnbmVkIGludCByZWcsDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKmRhdGEpDQo+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgdnBj
aV9iYXIgKmJhciA9IGRhdGE7DQo+Pj4+Pj4+PiArICAgIGJvb2wgaGkgPSBmYWxzZTsNCj4+Pj4+
Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgaWYgKCBiYXItPnR5cGUgPT0gVlBDSV9CQVJfTUVNNjRfSEkg
KQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiArICAgICAgICBBU1NFUlQocmVnID4gUENJX0JB
U0VfQUREUkVTU18wKTsNCj4+Pj4+Pj4+ICsgICAgICAgIGJhci0tOw0KPj4+Pj4+Pj4gKyAgICAg
ICAgaGkgPSB0cnVlOw0KPj4+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAg
IHJldHVybiBiYXItPmd1ZXN0X2FkZHIgPj4gKGhpID8gMzIgOiAwKTsNCj4+Pj4+Pj4gSSdtIGFm
cmFpZCAiZ3Vlc3RfYWRkciIgdGhlbiBpc24ndCB0aGUgYmVzdCBuYW1lOyBtYXliZSAiZ3Vlc3Rf
dmFsIj8NCj4+Pj4+Pj4gVGhpcyB3b3VsZCBtYWtlIG1vcmUgb2J2aW91cyB0aGF0IHRoZXJlIGlz
IGEgbWVhbmluZ2Z1bCBkaWZmZXJlbmNlDQo+Pj4+Pj4+IGZyb20gImFkZHIiIGJlc2lkZXMgdGhl
IGd1ZXN0IHZzIGhvc3QgYXNwZWN0Lg0KPj4+Pj4+IEkgYW0gbm90IHN1cmUgSSBjYW4gYWdyZWUg
aGVyZToNCj4+Pj4+PiBiYXItPmFkZHIgYW5kIGJhci0+Z3Vlc3RfYWRkciBtYWtlIGl0IGNsZWFy
IHdoYXQgYXJlIHRoZXNlIHdoaWxlDQo+Pj4+Pj4gYmFyLT5hZGRyIGFuZCBiYXItPmd1ZXN0X3Zh
bCB3b3VsZCBtYWtlIHNvbWVvbmUgZ28gbG9vayBmb3INCj4+Pj4+PiBhZGRpdGlvbmFsIGluZm9y
bWF0aW9uIGFib3V0IHdoYXQgdGhhdCB2YWwgaXMgZm9yLg0KPj4+Pj4gRmVlbCBmcmVlIHRvIHJl
cGxhY2UgInZhbCIgd2l0aCBzb21ldGhpbmcgbW9yZSBzdWl0YWJsZS4gImd1ZXN0X2JhciINCj4+
Pj4+IG1heWJlPyBUaGUgdmFsdWUgZGVmaW5pdGVseSBpcyBub3QgYW4gYWRkcmVzcywgc28gImFk
ZHIiIHNlZW1zDQo+Pj4+PiBpbmFwcHJvcHJpYXRlIC8gbWlzbGVhZGluZyB0byBtZS4NCj4+Pj4g
VGhpcyBpcyBhIGd1ZXN0J3MgdmlldyBvbiB0aGUgQkFSJ3MgYWRkcmVzcy4gU28gdG8gbWUgaXQg
aXMgc3RpbGwgZ3Vlc3RfYWRkcg0KPj4+IEl0J3MgYSBndWVzdCdzIHZpZXcgb24gdGhlIEJBUiwg
bm90IGp1c3QgdGhlIGFkZHJlc3MuIE9yIGVsc2UgeW91IGNvdWxkbid0DQo+Pj4gc2ltcGx5IHJl
dHVybiB0aGUgdmFsdWUgaGVyZSB3aXRob3V0IGZvbGRpbmcgaW4gdGhlIGNvcnJlY3QgbG93IGJp
dHMuDQo+PiBJIGFncmVlIHdpdGggdGhpcyB0aGlzIHJlc3BlY3QgYXMgaXQgaXMgaW5kZWVkIGFk
ZHJlc3MgKyBsb3dlciBiaXRzLg0KPj4gSG93IGFib3V0IGd1ZXN0X2Jhcl92YWwgdGhlbj8gU28g
aXQgcmVmbGVjdHMgaXRzIG5hdHVyZSwgZS5nLiB0aGUgdmFsdWUNCj4+IG9mIHRoZSBCQVIgYXMg
c2VlbiBieSB0aGUgZ3Vlc3QuDQo+IEdldHMgYSBsaXR0bGUgbG9uZ2lzaCBmb3IgbXkgdGFzdGUu
IEkgZm9yIG9uZSB3b3VsZG4ndCBtaW5kIGl0IGJlIGp1c3QNCj4gImd1ZXN0Ii4gSW4gdGhlIGVu
ZCBSb2dlciBoYXMgdGhlIGZpbmFsIHNheSBoZXJlIGFueXdheS4NCk9rLCBzbyBsZXQgUm9nZXIg
Y2hvc2UgdGhlIG5hbWUgOykNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

