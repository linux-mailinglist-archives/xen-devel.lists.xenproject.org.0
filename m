Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE945B917
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230364.398241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqUz-0008Bt-8S; Wed, 24 Nov 2021 11:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230364.398241; Wed, 24 Nov 2021 11:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqUz-000899-5S; Wed, 24 Nov 2021 11:31:37 +0000
Received: by outflank-mailman (input) for mailman id 230364;
 Wed, 24 Nov 2021 11:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGpx=QL=epam.com=prvs=1962e93d75=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpqUx-00088M-81
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:31:35 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1315675d-4d1a-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 12:31:33 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOBSg7f005323;
 Wed, 24 Nov 2021 11:31:31 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3chjq98gmy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 11:31:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2657.eurprd03.prod.outlook.com (2603:10a6:200:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 11:31:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 11:31:27 +0000
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
X-Inumbo-ID: 1315675d-4d1a-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzJ6FfXaj7CR46+v3fMnG6+gu6gCfz7F1BO9Hy0Pf2ySC5rmDlG/Evgj0nQaYPEzPtRduV9Zefa6besEgcv1MBWMjJCpUs6BFsgZkR/VcUnVnfH5qhexyWIAe4erC8iaEIScuqxha1pp7lWvjFmjUSiLn7crue7tsDx5Ssl8fvJZIMo5th1qENcDOHxhL4WgzZPrnET46KDthZo61M0bnNtCfMy+3bEhbD4/kJigkBYrTd0+5iB6M0Cuz8b6aeeWhuTWNzya4LopvKHvaynIgXFcDY44aAP+0Ke0vxjt7MSVFn66omJOcYMLsBfhFy58G74Oe3rEoaZ8TtS1Q+QCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5uMs6GCdNNkPlVD5LpM0ZDDauleikCEj8IUXuw5cNc=;
 b=AYAy5WS69meph165q5iLo6d+D52Scj6pszMpoRch3SjoF2p22+Y0gM8+oRT876YOWMQLjUIDTguAo1Q7g8kxqi57uRLdcD9IaYYC8o7egO1i2BG+JF1jKNCACrHU9ShVvw9cBjX9J+RAY4y6AMFdvr/oCnl8opHvr82Xlx+CtgLi6Ywn2Kky0/GmtKBtvMQFWryG16AJT+1tcRTtEtsB/aqcwDNXg/QLS4dFl785kDZX+Gn5nad9je0GbT/qeKAetIr9xh9wFbQnezYPOZyLs13U5cBx4W6mBWIUeJPaIf7gdYCnj7XRPYKmmLoDPTWjBBGTxLdhECAPXQxADC/Ybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5uMs6GCdNNkPlVD5LpM0ZDDauleikCEj8IUXuw5cNc=;
 b=gsseJOr+ITK1hcoGJ76zmtWkZQagJIpnBN5bHsU9vUmYr4DXFm4NGgywcasBasPW4Sm1aqKjsLcdgsOlgYxSI15YbuhLc7MZ+5vBotk8EPqTrLtHDJXANHqWRqAy2IcuhUrQyuXTaG5Im7H0u4zP1/SNkhbajqEAZrutsz0NvMfGvPp0XM7OLPyENlgyV8Ui4YJb7x/F9rJCrckQHg+qE6wmE86drYCIar082wDj1OvbNcAGAf/ACdB/5hBv8kquM4UJwBHvQ9vQUmSHgr6/dwcBbd3iYp3imXotFagHGuedt8Wl4G6Jw6QDKMpOLCoLu5SG6OELCZ056f052rxd8w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHX0hJP4tGfmNyDbEa0m8z5ITSeMav5fmGAgAABr4CAADRIAIAAEgeAgBjjHgA=
Date: Wed, 24 Nov 2021 11:31:27 +0000
Message-ID: <da75f278-59b3-bc98-0512-fa6efcf9ac54@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-12-andr2000@gmail.com>
 <da36ee68-3162-0a32-f033-98af34f9c94e@suse.com>
 <c05b3e98-772c-a8c7-d8f8-841289683a02@epam.com>
 <YYky9JSe9oMh5azh@Air-de-Roger>
 <4260ad1e-0225-20c0-8208-f8e239f551a0@epam.com>
In-Reply-To: <4260ad1e-0225-20c0-8208-f8e239f551a0@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bdbe9a3-8828-4d95-0db8-08d9af3df47e
x-ms-traffictypediagnostic: AM4PR0302MB2657:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB265781134D0C8F294E8BC6E5E7619@AM4PR0302MB2657.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 81sehRZnjnKJX0hmlpllMLQUrKAdOdlYyvnFMSxqeXnzpm4znusWjysEq5cpN8N4FTTnc06DCEHaM+7h7v2DTJos1gsIrKLlYRe90ChtvXa9geD2MZ7FFbGaDERlzv8S62iq80z1NJuP3+X02M+cSOTlaF5rLSexEgCNJKyopbUGiMjD06IsQu89XhpB3sureB1qEc3sQrKM60bVU49L39y0t/aYfsXGXKkigOkj7hQGv6Gvs/tUxIIrhF43OUHdFTjmMb6+WPNC7GTmg1eCH9KhwLTZ/uWDXbbWsZTuosQFTcnwXXbKD+7CyQHJuC2EVlVw6siYXmctaVnlymV5fN1ivyKtdUEctSYAwjr5EUffjeJvp/HycbRjVs1mvv7ne6DqRdl9TUaoL4bZjokjsfAoQs55XfQ3Q3YxDltBG3yicEYZTuGiUSA5l8Kh0KRHSrqtXKO7UL7ZKNBngXy6eoj9q9QqOjdRUrC+Y1l2cpTYCfndekLpsuCoGjE9eFEAWDXU/8qWz8SsFtUSB+TG/XIb+ejvW1k9DaUxrWSQRrfBxx2mJam7R0R5vDtWkj2VSI3bTOg2Fz7F6laQ3QnT9o0gRxfHwBFuaA73NweaT6jSRJXFjRW5lNnLr9bILhvg77WP4k2ULHbTN9a3ZjOHe24It0JpbjNekuer/BdefTgUPXM27fb4DZ7l2MR/qQqP2LiSW26yUQsC9VPv4f9n56m0saj/qRfsOkDqjbtL0xg0TagVmO07vCcmiIRS1wvaOE8B4H6eIox8W+P+NuDBFY5JIqWXr9opDcn6a6vSnD4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(36756003)(71200400001)(7416002)(31696002)(122000001)(2906002)(4326008)(6506007)(6916009)(6512007)(5660300002)(53546011)(66556008)(38100700002)(31686004)(54906003)(508600001)(91956017)(83380400001)(6486002)(38070700005)(86362001)(66446008)(186003)(2616005)(66476007)(76116006)(66946007)(316002)(64756008)(8936002)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RUovV2JydTVLWS9SYU15Y1lBWGliYWxKQmN6aHV3QjNPTVFwaEN1WVZpZHpx?=
 =?utf-8?B?cWNyY3ZQd3lWYnVwM1QyRkNmNGhTTFVFblRQdEcwdm9Xd2xMSUFJT2xHSWVh?=
 =?utf-8?B?SlR5U2N6c3VMaTE1cEpUYlIza2NpY3ZtdXc1K2dLQXlWNVJoRGd4dmRKbEJC?=
 =?utf-8?B?eW0yS0s0anhaOG1kaTlDTnB4NnR3M2NtcjZMRHdkTUwxVXlvNEhDQXh2cHVM?=
 =?utf-8?B?L2ZoY0VySGJodU1vc25OdGtQa3UzdHBwSmxWZElXVWJnSzZQYnAwUjNUTkFH?=
 =?utf-8?B?ZFhjQmQ0eW5vM0dFcWpuNExVM2lWbUMrQjQ4UnpoUFZUQWZlcU9lL05HSStw?=
 =?utf-8?B?VnZyanlWS3N1WUo5ZkxNSjFtSFhneEVFd2hWaSs2WXV6RHBib3FKNCtBTkxs?=
 =?utf-8?B?a1lra2tTcjBlWW0xdzdyQ1RZWXlNUnUyR0kyWlRCMTNEN2hoZmJQNG5lcmV2?=
 =?utf-8?B?V1R3cEhqUUJKUWVyN01aUnhNTEQwaWc3akkzM3hxZVFqVlVTallOMVVRK0ZB?=
 =?utf-8?B?RUhoRUlDbjVPY2ZRMlVHUFJBQzNJbmlRL08rTVdPc3lhTFNVREE3Si9aYzlD?=
 =?utf-8?B?VWxNYVRqcmNwUUkwSCtIZVRMRWlTQitZcDhJM3I1cHhqRDZYQzViUE5heFBK?=
 =?utf-8?B?ZkZwdG5Kb1BENFFQRXV5Z1U1R1VDVnV6aFdBem5jbXlTcExwTlVxb1kyUmJx?=
 =?utf-8?B?N1hQNkhRR0FJeXlUbWFnSm9IeFJPQU5xbFVRM3RHN3J6SHlVK2laWVg1RFJU?=
 =?utf-8?B?Y1ZwUU41WDhtamR3R0RaVDIwN2g4QW96ZGdxN0xuSG1VNHMyYmRrM3BpdW5h?=
 =?utf-8?B?Y3BDWGJXY3lwb2RweUd4WmtkeTRyUStLRDhocGFpbkdqNzVBdnR4K0ZiTjkw?=
 =?utf-8?B?dXoxaFB6aDloc3BTRlZtbDlIQzhEcGRxaDFSMzlEQWhmL3k0VTdlTVk0azAw?=
 =?utf-8?B?bHhaOWo1TitFajU2ZFNjdWdZcFhYZVEvZnpKYUYvTkJXUjFoZkZQd20zUitk?=
 =?utf-8?B?bnJOMnloV0NsOFRSclRHWE5YcGY4cU5ZbVRJU2dLM0xKVysyZ0M2RlBkWTVE?=
 =?utf-8?B?WHpJMGpreVhxcVd1M3JEZkZJQVNwUnEybmlCd3RYci9UempCYTRsRWw1SWRn?=
 =?utf-8?B?Vi9CWmU0ZzRwL1B5alpJSHdjRkdmYkRYZFFwaGlvblM3SXh6elhCVTlyYndi?=
 =?utf-8?B?UFhOSmR5dUFGS1R1a1hjN1RoOTJLcVJZZXlJK0N1K1pSREEwbkFxajUxdmZE?=
 =?utf-8?B?STFjVWpQM094eG55OTNyM0JzVTRCUHZLandZV3l0YzJXYzVROEYwMlQzKzNE?=
 =?utf-8?B?NGU2bDhuRHF1eGlkVStERk5yTHIvWHpFazlneU9yN1hScVMvWTh2MHFRMGRo?=
 =?utf-8?B?Y0c3WUhNVk5oMW1YREZwYVhzR0JZbms3ekxhb2pLM2V5NU5wWlJaaTFXRTBM?=
 =?utf-8?B?bDNnWlcrSkpFNEhkMjFRVDE0KzFxZGdpcDZYQ2dtTEhwdE4ra3ZRYllXdG5i?=
 =?utf-8?B?anFnOVNDdGs4eDB5VUt4dVByUjFTNXlOaXFTWW9SalFxUU9ZVjZqUkpsRzZO?=
 =?utf-8?B?emRUeHFxMkF2djZOMzJMTTl3eWh4dUVwblBTWWZYYjdtRmNCV3pzTmxYUWRW?=
 =?utf-8?B?bldXdUYwb1E0SnpJMnpocEFzOVJHSE9ua08xNUE2M2lUOEJYNSthaXo1UXNi?=
 =?utf-8?B?Y0pxRVVnVVFnbFMrWXAxWno0SkdZOGFVQ1FDdkFERjZtSEY2M210ZVhDYUx0?=
 =?utf-8?B?c0RudklWakN4SHJ1L01FeWtma2lWVzZLTUUzMDkyNTFWZUMxMjREaVNWVEV4?=
 =?utf-8?B?bXJ1SzFnSmxtTHc2d2psa1RWOVZGZHJoRFJEdFNuMXpFdmxGcmVwREd3aE41?=
 =?utf-8?B?Q3BzcytiZXB1bTFIT2FaekovOTRGRWhBM1g4RHNrcElyQXl2dXlJdGQwNTFs?=
 =?utf-8?B?RktDQ0F3M0RVTXdEamdROUVtZ1A3b2l5UWZxc3MwMldUUk9RUzhFWUt4Qi9t?=
 =?utf-8?B?ZUVvU2dyQ2FzeTd3Vm1DT2kwaUUvcUc2Z3RTM2NZUm5Vai94T3NMbVFKRnYr?=
 =?utf-8?B?MVIrdVBnSThYR0hXWTlCbHlFMjRpZmVPREQxUzRCaU5Gd2J4WXk1elErZUQ1?=
 =?utf-8?B?NSswUjdHWUhtWnRxN0JhTHgxLzZ5Wm9KNWRXK0Qza3pXZTZUWHZiSHBtK0FU?=
 =?utf-8?B?cldyVVBwUmtJbERQTzZoOUxiRWFkRUg1TEdwS0ZpcEZOM1N5Y1dPZmIwVUNx?=
 =?utf-8?B?dEl5L3hsbndSQWUzcnQxeWcxQnJhemQwUlZHbENzS0tmeU9TbUMwYWs1Y00y?=
 =?utf-8?B?K0luM3FkdWNPMHRWWTJEcmE1NWxTUDVST0c3N28wZmY1YWVxOFIyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F453184E1AF9E4A9C608E1BCF7C450C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdbe9a3-8828-4d95-0db8-08d9af3df47e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 11:31:27.7820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MlrXm1gjOhCjBpnucSjdm95SrZAg8IS5UtDVWrsHeuQGgwvl1yx9KfT7mMVEO7BB2Vj0eq9wIyqjxcnMG4YUW4iZtGVQOk1jxTt+QlFYK01hDfrQYbBJRCoQ2t+uDSvt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2657
X-Proofpoint-GUID: VEmQ0sMoY6b4B3DFvER-_pfOq6y6Wc7p
X-Proofpoint-ORIG-GUID: VEmQ0sMoY6b4B3DFvER-_pfOq6y6Wc7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240065

DQoNCk9uIDA4LjExLjIxIDE3OjI4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMDguMTEuMjEgMTY6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBNb24s
IE5vdiAwOCwgMjAyMSBhdCAxMToxNjo0MkFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+PiBPbiAwOC4xMS4yMSAxMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3Zw
Y2kuYw0KPj4+Pj4gQEAgLTQxLDYgKzQxLDE1IEBAIHN0YXRpYyBpbnQgdnBjaV9tbWlvX3JlYWQo
c3RydWN0IHZjcHUgKnYsIG1taW9faW5mb190ICppbmZvLA0KPj4+Pj4gICAgICAgICAvKiBkYXRh
IGlzIG5lZWRlZCB0byBwcmV2ZW50IGEgcG9pbnRlciBjYXN0IG9uIDMyYml0ICovDQo+Pj4+PiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZGF0YTsNCj4+Pj4+ICAgICANCj4+Pj4+ICsjaWZkZWYgQ09O
RklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4+ICsgICAgLyoNCj4+Pj4+ICsgICAgICog
Rm9yIHRoZSBwYXNzZWQgdGhyb3VnaCBkZXZpY2VzIHdlIG5lZWQgdG8gbWFwIHRoZWlyIHZpcnR1
YWwgU0JERg0KPj4+Pj4gKyAgICAgKiB0byB0aGUgcGh5c2ljYWwgUENJIGRldmljZSBiZWluZyBw
YXNzZWQgdGhyb3VnaC4NCj4+Pj4+ICsgICAgICovDQo+Pj4+PiArICAgIGlmICggIWJyaWRnZSAm
JiAhdnBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2Uodi0+ZG9tYWluLCAmc2JkZikgKQ0KPj4+
Pj4gKyAgICAgICAgICAgIHJldHVybiAxOw0KPj4+PiBOaXQ6IEluZGVudGF0aW9uLg0KPj4+IE91
Y2gsIHN1cmUNCj4+Pj4+IEBAIC01OSw2ICs2OCwxNSBAQCBzdGF0aWMgaW50IHZwY2lfbW1pb193
cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sDQo+Pj4+PiAgICAgICAgIHN0
cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSA9IHA7DQo+Pj4+PiAgICAgICAgIHBjaV9zYmRm
X3Qgc2JkZiA9IHZwY2lfc2JkZl9mcm9tX2dwYShicmlkZ2UsIGluZm8tPmdwYSk7DQo+Pj4+PiAg
ICAgDQo+Pj4+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+Pj4+PiAr
ICAgIC8qDQo+Pj4+PiArICAgICAqIEZvciB0aGUgcGFzc2VkIHRocm91Z2ggZGV2aWNlcyB3ZSBu
ZWVkIHRvIG1hcCB0aGVpciB2aXJ0dWFsIFNCREYNCj4+Pj4+ICsgICAgICogdG8gdGhlIHBoeXNp
Y2FsIFBDSSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRocm91Z2guDQo+Pj4+PiArICAgICAqLw0KPj4+
Pj4gKyAgICBpZiAoICFicmlkZ2UgJiYgIXZwY2lfdHJhbnNsYXRlX3ZpcnR1YWxfZGV2aWNlKHYt
PmRvbWFpbiwgJnNiZGYpICkNCj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gMTsNCj4+Pj4gQWdh
aW4uDQo+Pj4gV2lsbCBmaXgNCj4+Pj4+IEBAIC0xNzIsMTAgKzE3NSwzNyBAQCBSRUdJU1RFUl9W
UENJX0lOSVQodnBjaV9hZGRfdmlydHVhbF9kZXZpY2UsIFZQQ0lfUFJJT1JJVFlfTUlERExFKTsN
Cj4+Pj4+ICAgICBzdGF0aWMgdm9pZCB2cGNpX3JlbW92ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLA0KPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4gICAgIHsNCj4+Pj4+ICsgICAg
QVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOw0KPj4+Pj4gKw0KPj4+Pj4gICAgICAgICBjbGVhcl9i
aXQocGRldi0+dnBjaS0+Z3Vlc3Rfc2JkZi5kZXYsICZkLT52cGNpX2Rldl9hc3NpZ25lZF9tYXAp
Ow0KPj4+Pj4gICAgICAgICBwZGV2LT52cGNpLT5ndWVzdF9zYmRmLnNiZGYgPSB+MDsNCj4+Pj4+
ICAgICB9DQo+Pj4+PiAgICAgDQo+Pj4+PiArLyoNCj4+Pj4+ICsgKiBGaW5kIHRoZSBwaHlzaWNh
bCBkZXZpY2Ugd2hpY2ggaXMgbWFwcGVkIHRvIHRoZSB2aXJ0dWFsIGRldmljZQ0KPj4+Pj4gKyAq
IGFuZCB0cmFuc2xhdGUgdmlydHVhbCBTQkRGIHRvIHRoZSBwaHlzaWNhbCBvbmUuDQo+Pj4+PiAr
ICovDQo+Pj4+PiArYm9vbCB2cGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3QgZG9t
YWluICpkLCBwY2lfc2JkZl90ICpzYmRmKQ0KPj4+PiBjb25zdCBzdHJ1Y3QgZG9tYWluICpkID8N
Cj4+PiBXaWxsIGNoYW5nZQ0KPj4+Pj4gK3sNCj4+Pj4+ICsgICAgY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXY7DQo+Pj4+PiArICAgIGJvb2wgZm91bmQgPSBmYWxzZTsNCj4+Pj4+ICsNCj4+Pj4+
ICsgICAgcGNpZGV2c19sb2NrKCk7DQo+Pj4+PiArICAgIGZvcl9lYWNoX3BkZXYoIGQsIHBkZXYg
KQ0KPj4+Pj4gKyAgICB7DQo+Pj4+PiArICAgICAgICBpZiAoIHBkZXYtPnZwY2ktPmd1ZXN0X3Ni
ZGYuc2JkZiA9PSBzYmRmLT5zYmRmICkNCj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+ICsgICAgICAg
ICAgICAvKiBSZXBsYWNlIHZpcnR1YWwgU0JERiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+
Pj4+PiArICAgICAgICAgICAgKnNiZGYgPSBwZGV2LT5zYmRmOw0KPj4+Pj4gKyAgICAgICAgICAg
IGZvdW5kID0gdHJ1ZTsNCj4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4+ICsgICAgICAg
IH0NCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKyAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4+PiBJIHRo
aW5rIHRoZSBkZXNjcmlwdGlvbiB3YW50cyB0byBhdCBsZWFzdCBtZW50aW9uIHRoYXQgaW4gcHJp
bmNpcGxlDQo+Pj4+IHRoaXMgaXMgdG9vIGNvYXJzZSBncmFpbmVkIGEgbG9jaywgcHJvdmlkaW5n
IGp1c3RpZmljYXRpb24gZm9yIHdoeQ0KPj4+PiBpdCBpcyBkZWVtZWQgZ29vZCBlbm91Z2ggbmV2
ZXJ0aGVsZXNzLiAoUGVyc29uYWxseSwgYXMgZXhwcmVzc2VkDQo+Pj4+IGJlZm9yZSwgSSBkb24n
dCB0aGluayB0aGUgbG9jayBzaG91bGQgYmUgdXNlZCBoZXJlLCBidXQgYXMgbG9uZyBhcw0KPj4+
PiBSb2dlciBhZ3JlZXMgd2l0aCB5b3UsIHlvdSdyZSBmaW5lLikNCj4+PiBZZXMsIG1ha2VzIHNl
bnNlDQo+PiBTZWVpbmcgYXMgd2UgZG9uJ3QgdGFrZSB0aGUgbG9jayBpbiB2cGNpX3tyZWFkLHdy
aXRlfSBJJ20gbm90IHN1cmUgd2UNCj4+IG5lZWQgaXQgaGVyZSBlaXRoZXIgdGhlbi4NCj4gWWVz
LCBJIHdhcyBub3QgZmVlbGluZyBjb25maWRlbnQgd2hpbGUgYWRkaW5nIGxvY2tpbmcNCj4+IFNp
bmNlIG9uIEFybSB5b3Ugd2lsbCBhZGQgZGV2aWNlcyB0byB0aGUgZ3Vlc3QgYXQgcnVudGltZSAo
aWU6IHdoaWxlDQo+PiB0aGVyZSBjb3VsZCBhbHJlYWR5IGJlIFBDSSBhY2Nlc3NlcyksIGhhdmUg
eW91IHNlZW4gaXNzdWVzIHdpdGggbm90DQo+PiB0YWtpbmcgdGhlIGxvY2sgaGVyZT8NCj4gTm8s
IEkgZGlkbid0LiBOZWl0aGVyIEkgYW0gYXdhcmUgb2YgQXJtIGhhZCBwcm9ibGVtcw0KPiBCdXQg
dGhpcyBjb3VsZCBqdXN0IG1lYW4gdGhhdCB3ZSB3ZXJlIGx1Y2t5IG5vdCB0byBzdGVwIG9uIGl0
DQo+PiBJIHRoaW5rIHRoZSB3aG9sZSBwY2lkZXZzIGxvY2tpbmcgbmVlZHMgdG8gYmUgY2xhcmlm
aWVkLCBhcyBpdCdzDQo+PiBjdXJyZW50bHkgYSBtZXNzLg0KPiBBZ3JlZQ0KPj4gICAgSWYgeW91
IHdhbnQgdG8gdGFrZSBpdCBoZXJlIHRoYXQncyBmaW5lLCBidXQgb3ZlcmFsbA0KPj4gdGhlcmUg
YXJlIGlzc3VlcyBpbiBvdGhlciBwbGFjZXMgdGhhdCB3b3VsZCBtYWtlIHJlbW92aW5nIGEgZGV2
aWNlIGF0DQo+PiBydW50aW1lIG5vdCByZWxpYWJsZS4NCj4gU28sIHdoYXQncyB0aGUgZGVjaXNp
b24/IEkgd291bGQgbGVhdmUgdGhlIGxvY2tzIHdoZXJlIEkgcHV0IHRoZW0sDQo+IHNvIGF0IGxl
YXN0IHRoaXMgcGFydCB3b24ndCBuZWVkIGZpeGVzLg0KQXMgSSBhbSBhYm91dCB0byB1c2UgdGhl
IGxvY2sgb3V0c2lkZSB2cGNpIHN0cnVjdCBpbiB2NSBhbGwgdGhlc2UgZ28gYXdheQ0KPj4gVGhh
bmtzLCBSb2dlci4NCj4+DQo+IFRoYW5rIHlvdSwNCj4gT2xla3NhbmRyDQo=

