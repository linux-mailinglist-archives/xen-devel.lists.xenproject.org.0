Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BE457049
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227977.394453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Xn-0005JB-7w; Fri, 19 Nov 2021 14:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227977.394453; Fri, 19 Nov 2021 14:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Xn-0005Gx-4f; Fri, 19 Nov 2021 14:07:11 +0000
Received: by outflank-mailman (input) for mailman id 227977;
 Fri, 19 Nov 2021 14:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo4Xl-0005Dm-Ce
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:07:09 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa80b219-4941-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 15:07:08 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJDDsnQ031037;
 Fri, 19 Nov 2021 14:07:05 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cebkv8eqb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 14:07:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 14:06:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 14:06:43 +0000
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
X-Inumbo-ID: fa80b219-4941-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7Ej0Iu0xrMn/KKNV+G435yaoB65zqxgRBxPSupIoNPRrgcjcLtOl7a1UgITPSy5BQTKdWBKwif87FsMIpgwPBtkWSunehjWh2kIYA4I+trFOWK3waUtItD+7AoZv4k25GHewV8T9T0uvz2u0DKezCuYBnFlkSSiB8C9qLWA41XovueVMENTlg2L6MqoIoTRz1bn8jePFK15RGx3uybdFwXdhXwCMW7b0qp8DQhvZWIu7HxsMTB4p645HgGd67ON+7t9h7GSJD3I84ETXq51UF//GO7/kUQf7ETdrpmqki89Jp0L8MNRWrfqYDDqxz7AQO3iY+jv60fK33GmR/63MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqIqsv1hEdIi/oXm2Y6f/3oyFSbARIkx5SOzI53L21U=;
 b=KM/LtRkVzx6XJGdflfGcQoc57lmIrgOEJRyDt5kv8S6DnJ3+uoYeGR4D9SabBNPS//8CAvorw6tgjSUqQdyiu91p0fcJbBSQjNAxbkVLk7iF33g6Jbehwhb0z2doBEFY7iYALrIQ16NW9+0WCwnsVr5OazESJiEDqZta0duLr8hrOEldrBh/O3xjPXpnqb0LXCF0GYFMaU/ZjXiYJZ8ZbGun3rClgoQ5yP9hf/+tANfWfwvVXpCaDE8TQsrnCZaZXDZ+hLMuEW9HSl0lLuFBhKs7TLcRFXXEtkr+icsOtFqXe0TrE7mXx0qmUswLe6VgWmn+aSPBAVaSZKfAncdvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqIqsv1hEdIi/oXm2Y6f/3oyFSbARIkx5SOzI53L21U=;
 b=Hdty/iJkLoVB/hLwFZeGDwALo14SJy8CD1oyk90A2/NyxvTSTA0NL07doxUgPUSS/kYCSoQ/3PczqPZ0+sNXzgj3qcqHjwW/XnX7KDweSWSFEwJDBCI7yRbQiWxa+c6mPNU9netF3FxS8IA5c3b4HQDdbXqqaRqPAFqoQv8A2h3SzwmCmi8pVMS1JQ/DuM6w/mJaBdoyF1WpRAUqama86E1coZKeeSWdrBvnYkeKwp1JhJgzf8X5+17pdZ8K9fQ1YWz8bhdp5V2Lw/W1R/M9e79bRRKRYimh7MjFy1wftzmJOPJ5ma1kRChq4ol4WAxZ9jVlwghoxKocvS3J0J7wJQ==
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
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Thread-Index: AQHX0hJHqVSXqEokpUi6WhDjT3q/RqwK9kcAgAAC7wA=
Date: Fri, 19 Nov 2021 14:06:43 +0000
Message-ID: <41803c92-2b41-76ea-7352-4c433e9d9766@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
In-Reply-To: <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82abe51b-2df5-4552-aef4-08d9ab65d116
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB606864E7262911D64B56CA0EE79C9@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DFjoM6oqPzZRjZlgtwpaaa0xwUrZ3xuAL7fhghNZNf3HaG4qm62zuSa5ZCMTlrrCD40mrzpF+5YH3P2nATJiknwhbRHq01A35zAgQZfKszHQ26Z60WODku9UTVQYURI30uvOqb5SHZcFIkailW9RVoBW/jZUYwf42LQ/08lldWZOTMlf0/rG4nodQBMW/ahl9mKhQfeZGYTojxvbTZuJ7Qys5dpYHs7V160vaTSvH4q6G66j2XecO432wJRDTdRtCCDlqAN4y+vldzZuo3D3rZv+we86qDsonvBKQLXlhu670CdonwJBnxBrPelYtH2f5IW1RosZ0YW8oOmZjllecAELPsBOv5pO+/NWmGg7f5RFYPesy71uOO6sFNLfkiEUbwYPHdwKsOfCMQQYW9Lw8neVczoCT+/4Tkn/MLurIdI7TorXDtoqVOwFCCcyNp8BJ4MhZnRPt/aR6UHeT2eN2JfEANaTdXunp0ELkGMsIRslXoX7Dztkmgb/+sbspHDSDyXy0nZ9aQFQJLiOgTUjipoYxuWuAf3/XxCbNKIM/exyefRK14qh/cebV/vWLNDc6Gf1evBKlffzi8bfH3iMfXj7CQIytC853usAyhByI+JiIBemkzd/vuqVudfls1bhMcS2feYynB6ds3FxxF4jLvAuNDTyHR2OYXcEzrSDAQNjAg03H55D6JkSgtveaFxO6PTlQE/R2TYFx26OT0ELb6FAfhPuEvkR+xnOAri/+m15zEjtBJQh1bPTmjhyG0zh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(83380400001)(8936002)(86362001)(36756003)(66946007)(31686004)(8676002)(66556008)(66446008)(4326008)(71200400001)(316002)(64756008)(38070700005)(53546011)(76116006)(2906002)(6506007)(66476007)(2616005)(107886003)(31696002)(38100700002)(186003)(6916009)(5660300002)(122000001)(54906003)(6512007)(508600001)(7416002)(6486002)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TDdHVFBNNW9LdnBiMTJkN3BleitsQ05oRjIwQ3Aza21CbjJNUThiUmJVRlV3?=
 =?utf-8?B?LzJlbWlhTmNtOVAyY2RQdEJIM0dleExvZDdBWWJkS3JjRHV4ejRNSWM1RDUx?=
 =?utf-8?B?aDV1Y1IvamE2bm1wbXF0YWlRZ3RPcmtyMDJteHB6czhWM0hqMGhjSndEa3Ra?=
 =?utf-8?B?WFIzOGxsdzNmNXhsNEJ6eWFzOGRyVmxKZFBjVGVEMVBSQjd4QnBSbUtFWkdh?=
 =?utf-8?B?dDhFVEw5WHF3M1ZCdFd5T3pzd1ZDR0QvU0ZkR0dRVlN4dzJlNGZLNWxtdzZx?=
 =?utf-8?B?M2UvVld2WXE1N2E2RHpybVZuTS9McktKd3pDa08wSW9RMXVML01JeW1pcjZy?=
 =?utf-8?B?WTZVWE5YMVY4TUpTUVFqQWxmOHpPRFFUck1tYVFoaUdpOGptMjkwZENXTlRH?=
 =?utf-8?B?OTZKSzdwK09aQ2g2dWFwRHlvVEJwcSs0eG5wdFRYa0Z6TWhoVFVKTitiUnAy?=
 =?utf-8?B?MzVLL05xRkVYazkvODY1OGpIZ2wvVUV0RVlKOTFJa3lMTVZOVTBtaWU0TFh4?=
 =?utf-8?B?bUdCYmttVmlOczQvU05vWkhsNjNjL0wxMlFlbE1Gd2xqNEtrc1RSa0xvZDg0?=
 =?utf-8?B?R3hteUlubk1mK2NCUDB3WmZaZ1NKanc0K0s5QjBTdVowREJNVzZaMWJIYlpZ?=
 =?utf-8?B?UXFYckorQTJ1RDhZTmY4REhnTGlGaUYrc3pORHltOWdPWVVxTlJjNlNLUkgx?=
 =?utf-8?B?b2toZ3o1SldaNGRPSDRUaGIxc1VZeVdNT1J6ejBOSmxFS0tmVyt5bVdqUE1F?=
 =?utf-8?B?bzJEMDFoQk5wdXJSUVhzY2FLTFhwRVgyd0lpcnNZNk05L3FmOVc2MEVuL2Qz?=
 =?utf-8?B?MGM2NStpK1VFWm5zWFdVRU54d2FhOEIxL0dFeFFzMGZHNFBQTVRwZ3lKTTFz?=
 =?utf-8?B?WXdXcmFIaHFZUC9PWlEzRkpkM2VvejFjZlRDVE9xWlFwVC9ON0RabWxMYVpo?=
 =?utf-8?B?LzhTZ2pEa2xpZFpneDhkUisyT3Q1Nit4UllrQTl6dGkxKzFseG82MXp0QkNi?=
 =?utf-8?B?bzczOVdBb0o2NjJXYzJsSE94bGg5MllwQStYalB5UDJrSG5HNFBaS29lYlRr?=
 =?utf-8?B?UERlcCtPSnpJYnIzWUxuZjgwaWNuZUZrWDlqY2FHMTJndEt5bm9WOGlGUGho?=
 =?utf-8?B?c0ZQZWdVNnZHOEFRZEErRjhiYllQd3hsTW9mMHErc0VDeVhmd2MvMUt1TEZm?=
 =?utf-8?B?NVlkaFBZaTBGRUQvNWdYOXFlaTFWWUlHSHlsSUVIQnp5Y01JSlhwSTlzL2pM?=
 =?utf-8?B?M1lDTzlJU1B0QVU3ZVN0YkIxOVg1QlN1YnZZVUdLMEVpV2Y1Q3hTVTduSmdt?=
 =?utf-8?B?Y0lDWm41SmxMM2huUnBscmkvTE8wL1lieVZrUHkrdWJJSlYyOXlrNG9KTVNl?=
 =?utf-8?B?NGZHcTFiU1pOUWNkb3RMTnF0WExHSWFzcElZVWZDZWloRTF3WEMvVDJwOGJM?=
 =?utf-8?B?YzQxNzNENUd2ampPWXdTZ1FJV09qM3I4S1hZdys0Y29oblpvd2ZsMFM4eUdw?=
 =?utf-8?B?U25WcTBKVko5YmlqOHB3cUtUbDA4RUpKK1VKYlNxQ0dYVmFoSzZmNjhVTjNx?=
 =?utf-8?B?SzRTTVlGR24wcGcweXVWYklHa2k5NTBhcTJ6OXhMSEIySlRmNHh3MHFFdzJu?=
 =?utf-8?B?RDVRbjAvcEZiQ2JzOTdnY1NxWjc4ZDB5cHo2c3pLQ24zRnBJT0VzQ0tqWkMz?=
 =?utf-8?B?NXhvbTNXcUlTR3h4WWNjR0xvMVVKMUtwUHhMNzRYWXFPOVdtSXVuRk9zN29u?=
 =?utf-8?B?R0pHWHNENXNKRUlkVHhSQXBlMUVOMitRRCtydDFWQllXKzZsZFkwdXFMVHhL?=
 =?utf-8?B?SWdDK3lTajl0MFJ6S1J1Y2hrSDlGUHUycjRLYWdnQm95eVQzL1BYQnZNcG9s?=
 =?utf-8?B?SXFVd21EWWdzbzgwQno0cHFGOXJXemdoMmgvYzhDN3BKNzhlQVFQRFlZektn?=
 =?utf-8?B?eHdQYkszbVQrYmdYbnZkYVI5S3A4Q0JOaGtxV3lUQzJUaE9qSkdMSTFqeE5P?=
 =?utf-8?B?V1RRUCtPOUVhd2k0NGhJRkVUclA1TTc3bklia3oya2xnMTkvNEZOWk12ekcy?=
 =?utf-8?B?TGN6dWRvRWJQSzFpektleHFlb0dEOWNONUU0OEFyc2Rmb0haSzJHei91amow?=
 =?utf-8?B?RiswbHJuRE4ydW1SY3dBeUpwQi9YU0NSVHJWUS9SUmJ1anhScVNVaENha0lw?=
 =?utf-8?B?VnJ6UFhsdnFBRDNkTmI2RVEyNHNBK2dsZTFSczN3VUpURDNrU25mNDY4KzFM?=
 =?utf-8?B?MWZ5b2trdUc1NmNuUzhtbSttUlNBSTVIUlBuNTd1NWI3MERTcFgvRTVtRU52?=
 =?utf-8?B?ZGVvQ0FneU1HUTVaYUdZRTFoMkdMRlZpR3haNnl3R0ZvV1VqL1crdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EFEB08E3BC653438184170DC62712A7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82abe51b-2df5-4552-aef4-08d9ab65d116
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 14:06:43.6422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+OvxnZXD3lu6fJdfJlfYNp3jkn/qR3o/aXe/Lcq9Fj6donZwN0hI0S+wB1BEjvezfjoF5hcYkYJuSuYzV0+08GJQHXd8Y+CTYsOxcRC9V8Qgu/MBhRjyoKFgLktfkj6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-GUID: c_5bAq8lvzaHFo3WERzA5Oly7IESUZPU
X-Proofpoint-ORIG-GUID: c_5bAq8lvzaHFo3WERzA5Oly7IESUZPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=735 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190079

DQoNCk9uIDE5LjExLjIxIDE1OjU2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gSGksIGFsbCENCj4+DQo+PiBUaGlzIHBhdGNoIHNlcmllcyBpcyBmb2N1c2luZyBvbiB2UENJ
IGFuZCBhZGRzIHN1cHBvcnQgZm9yIG5vbi1pZGVudGl0eQ0KPj4gUENJIEJBUiBtYXBwaW5ncyB3
aGljaCBpcyByZXF1aXJlZCB3aGlsZSBwYXNzaW5nIHRocm91Z2ggYSBQQ0kgZGV2aWNlIHRvDQo+
PiBhIGd1ZXN0LiBUaGUgaGlnaGxpZ2h0cyBhcmU6DQo+Pg0KPj4gLSBBZGQgcmVsZXZhbnQgdnBj
aSByZWdpc3RlciBoYW5kbGVycyB3aGVuIGFzc2lnbmluZyBQQ0kgZGV2aWNlIHRvIGEgZG9tYWlu
DQo+PiAgICBhbmQgcmVtb3ZlIHRob3NlIHdoZW4gZGUtYXNzaWduaW5nLiBUaGlzIGFsbG93cyBo
YXZpbmcgZGlmZmVyZW50DQo+PiAgICBoYW5kbGVycyBmb3IgZGlmZmVyZW50IGRvbWFpbnMsIGUu
Zy4gaHdkb20gYW5kIG90aGVyIGd1ZXN0cy4NCj4+DQo+PiAtIEVtdWxhdGUgZ3Vlc3QgQkFSIHJl
Z2lzdGVyIHZhbHVlcyBiYXNlZCBvbiBwaHlzaWNhbCBCQVIgdmFsdWVzLg0KPj4gICAgVGhpcyBh
bGxvd3MgY3JlYXRpbmcgYSBndWVzdCB2aWV3IG9mIHRoZSByZWdpc3RlcnMgYW5kIGVtdWxhdGVz
DQo+PiAgICBzaXplIGFuZCBwcm9wZXJ0aWVzIHByb2JlIGFzIGl0IGlzIGRvbmUgZHVyaW5nIFBD
SSBkZXZpY2UgZW51bWVyYXRpb24gYnkNCj4+ICAgIHRoZSBndWVzdC4NCj4+DQo+PiAtIEluc3Rl
YWQgb2YgaGFuZGxpbmcgYSBzaW5nbGUgcmFuZ2Ugc2V0LCB0aGF0IGNvbnRhaW5zIGFsbCB0aGUg
bWVtb3J5DQo+PiAgICByZWdpb25zIG9mIGFsbCB0aGUgQkFScyBhbmQgUk9NLCBoYXZlIHRoZW0g
cGVyIEJBUi4NCj4+DQo+PiAtIFRha2UgaW50byBhY2NvdW50IGd1ZXN0J3MgQkFSIHZpZXcgYW5k
IHByb2dyYW0gaXRzIHAybSBhY2NvcmRpbmdseToNCj4+ICAgIGdmbiBpcyBndWVzdCdzIHZpZXcg
b2YgdGhlIEJBUiBhbmQgbWZuIGlzIHRoZSBwaHlzaWNhbCBCQVIgdmFsdWUgYXMgc2V0DQo+PiAg
ICB1cCBieSB0aGUgaG9zdCBicmlkZ2UgaW4gdGhlIGhhcmR3YXJlIGRvbWFpbi4NCj4+ICAgIFRo
aXMgd2F5IGhhcmR3YXJlIGRvYW1pbiBzZWVzIHBoeXNpY2FsIEJBUiB2YWx1ZXMgYW5kIGd1ZXN0
IHNlZXMNCj4+ICAgIGVtdWxhdGVkIG9uZXMuDQo+Pg0KPj4gVGhlIHNlcmllcyBhbHNvIGFkZHMg
c3VwcG9ydCBmb3IgdmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5IGZvciBndWVzdHM6DQo+PiAgIC0g
V2UgZW11bGF0ZSBhIHNpbmdsZSBob3N0IGJyaWRnZSBmb3IgdGhlIGd1ZXN0LCBzbyBzZWdtZW50
IGlzIGFsd2F5cyAwLg0KPj4gICAtIFRoZSBpbXBsZW1lbnRhdGlvbiBpcyBsaW1pdGVkIHRvIDMy
IGRldmljZXMgd2hpY2ggYXJlIGFsbG93ZWQgb24NCj4+ICAgICBhIHNpbmdsZSBQQ0kgYnVzLg0K
Pj4gICAtIFRoZSB2aXJ0dWFsIGJ1cyBudW1iZXIgaXMgc2V0IHRvIDAsIHNvIHZpcnR1YWwgZGV2
aWNlcyBhcmUgc2Vlbg0KPj4gICAgIGFzIGVtYmVkZGVkIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJv
b3QgY29tcGxleC4NCj4+DQo+PiBUaGUgc2VyaWVzIHdhcyBhbHNvIHRlc3RlZCBvbjoNCj4+ICAg
LSB4ODYgUFZIIERvbTAgYW5kIGRvZXNuJ3QgYnJlYWsgaXQuDQo+PiAgIC0geDg2IEhWTSB3aXRo
IFBDSSBwYXNzdGhyb3VnaCB0byBEb21VIGFuZCBkb2Vzbid0IGJyZWFrIGl0Lg0KPj4NCj4+IFRo
YW5rIHlvdSwNCj4+IE9sZWtzYW5kcg0KPj4NCj4+IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvICgx
MSk6DQo+PiAgICB2cGNpOiBmaXggZnVuY3Rpb24gYXR0cmlidXRlcyBmb3IgdnBjaV9wcm9jZXNz
X3BlbmRpbmcNCj4+ICAgIHZwY2k6IGNhbmNlbCBwZW5kaW5nIG1hcC91bm1hcCBvbiB2cGNpIHJl
bW92YWwNCj4+ICAgIHZwY2k6IG1ha2UgdnBjaSByZWdpc3RlcnMgcmVtb3ZhbCBhIGRlZGljYXRl
ZCBmdW5jdGlvbg0KPj4gICAgdnBjaTogYWRkIGhvb2tzIGZvciBQQ0kgZGV2aWNlIGFzc2lnbi9k
ZS1hc3NpZ24NCj4+ICAgIHZwY2kvaGVhZGVyOiBpbXBsZW1lbnQgZ3Vlc3QgQkFSIHJlZ2lzdGVy
IGhhbmRsZXJzDQo+PiAgICB2cGNpL2hlYWRlcjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBlciBC
QVINCj4+ICAgIHZwY2kvaGVhZGVyOiBwcm9ncmFtIHAybSB3aXRoIGd1ZXN0IEJBUiB2aWV3DQo+
PiAgICB2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lfQ09NTUFORCByZWdpc3RlciBmb3IgZ3Vlc3Rz
DQo+PiAgICB2cGNpL2hlYWRlcjogcmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhZGRp
bmcgZGV2aWNlcw0KPj4gICAgdnBjaTogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdmlydHVhbCBQ
Q0kgYnVzIHRvcG9sb2d5DQo+PiAgICB4ZW4vYXJtOiB0cmFuc2xhdGUgdmlydHVhbCBQQ0kgYnVz
IHRvcG9sb2d5IGZvciBndWVzdHMNCj4gSWYgSSdtIG5vdCBtaXN0YWtlbiBieSB0aGUgZW5kIG9m
IHRoaXMgc2VyaWVzIGEgZ3Vlc3QgY2FuIGFjY2VzcyBhDQo+IGRldmljZSBoYW5kZWQgdG8gaXQu
IEkgY291bGRuJ3QgZmluZCBhbnl0aGluZyBkZWFsaW5nIHdpdGggdGhlDQo+IHVzZXMgb2YgdnBj
aV97cmVhZCx3cml0ZX1faHcoKSBhbmQgdnBjaV9od197cmVhZCx3cml0ZX0qKCkgdG8gY292ZXIN
Cj4gY29uZmlnIHJlZ2lzdGVycyBub3QgY292ZXJlZCBieSByZWdpc3RlcmVkIGhhbmRsZXJzLiBJ
TU8gdGhpcyBzaG91bGQNCj4gaGFwcGVuIGJlZm9yZSBwYXRjaCA1OiBCZWZvcmUgYW55IGhhbmRs
ZXJzIGdldCByZWdpc3RlcmVkIHRoZSB2aWV3IGENCj4gZ3Vlc3Qgd291bGQgaGF2ZSB3b3VsZCBi
ZSBhbGwgb25lcyBubyBtYXR0ZXIgd2hpY2ggcmVnaXN0ZXIgaXQNCj4gYWNjZXNzZXMuIEhhbmRs
ZXIgcmVnaXN0cmF0aW9uIHdvdWxkIHRoZW4gInB1bmNoIGhvbGVzIiBpbnRvIHRoaXMNCj4gImN1
cnRhaW4iLCBhcyBvcHBvc2VkIHRvIERvbTAsIHdoZXJlIGhhbmRsZXIgcmVnaXN0cmF0aW9uIGhp
ZGVzDQo+IHByZXZpb3VzbHkgdmlzaWJsZSByYXcgaGFyZHdhcmUgcmVnaXN0ZXJzLg0KVGhpcyBp
cyAiYnkgZGVzaWduIiBub3cgd2hpY2ggaXMgbm90IGdvb2QsIEkga25vdy4gV2Ugb25seSBoYXZl
IHNvbWUNCnJlZ2lzdGVyIGhhbmRsZXJzIHNldCwgYnV0IHRoZSByZXN0IG9mIHRoZSBjb25maWd1
cmF0aW9uIHNwYWNlIGlzDQpzdGlsbCB2aXNpYmxlIHJhdyB0byB0aGUgZ3Vlc3Qgd2l0aG91dCBy
ZXN0cmljdGlvbnMuIE5vdCBsZXR0aW5nIHRoZQ0KZ3Vlc3QgYWNjZXNzIHRob3NlIGFuZCByZXR1
cm5pbmcgYWxsIG9uZXMgd2lsbCByZW5kZXIgdGhlIGRldmljZQ0KdW51c2FibGUgZm9yIHRoZSBn
dWVzdCBhcyBpdCBkb2VzIG5lZWQgYWNjZXNzIHRvIGFsbCBpdHMgY29uZmlndXJhdGlvbg0Kc3Bh
Y2UuIFRoaXMgbWVhbnMgdGhhdCB3ZSB3b3VsZCBuZWVkIHRvIGVtdWxhdGUgZXZlcnkgcG9zc2li
bGUNCnJlZ2lzdGVyIGZvciB0aGUgZ3Vlc3Qgd2hpY2ggc2VlbXMgdG8gYmUgb3V0IG9mIHRoZSBz
Y29wZSBvZiB0aGlzIHNlcmllcy4NCg0KQnV0IGRlZmluaXRlbHkgeW91IGFyZSByaWdodCB0aGF0
IHRoaXMgbmVlZHMgdG8gYmUgc29sdmVkIHNvbWVob3cuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91
LA0KT2xla3NhbmRy

