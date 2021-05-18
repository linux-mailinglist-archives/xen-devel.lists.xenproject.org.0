Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A6387529
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 11:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128985.242122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liw3x-000696-Pd; Tue, 18 May 2021 09:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128985.242122; Tue, 18 May 2021 09:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liw3x-000667-LO; Tue, 18 May 2021 09:30:53 +0000
Received: by outflank-mailman (input) for mailman id 128985;
 Tue, 18 May 2021 09:30:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1liw3w-000661-4e
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 09:30:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 275d0a9a-e116-4e79-82ce-b912dbe153ba;
 Tue, 18 May 2021 09:30:49 +0000 (UTC)
Received: from AS8PR04CA0177.eurprd04.prod.outlook.com (2603:10a6:20b:331::32)
 by AM6PR08MB3701.eurprd08.prod.outlook.com (2603:10a6:20b:8b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 09:30:47 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::cf) by AS8PR04CA0177.outlook.office365.com
 (2603:10a6:20b:331::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 09:30:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 09:30:47 +0000
Received: ("Tessian outbound 0f1e4509c199:v92");
 Tue, 18 May 2021 09:30:46 +0000
Received: from c3fab964e81d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E85E35FE-896D-454C-8150-A5C204B8ECAC.1; 
 Tue, 18 May 2021 09:30:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3fab964e81d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 09:30:36 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4368.eurprd08.prod.outlook.com (2603:10a6:803:fe::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 09:30:33 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 09:30:33 +0000
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
X-Inumbo-ID: 275d0a9a-e116-4e79-82ce-b912dbe153ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fu3GR2rcCmIzIx/09j5PZZGbEugwR4xo996xg3Au1g=;
 b=dd1GglZ1BpENjNIBOCDj6aOqaPm9gvvgWtIQfCnoR3vPzrJ+P38Y0kO945+5OWbPEovKbSzavXEtMkTYzkUwoQ4rwozVC+ieWCWep2uK3K8/ZpfMQmfbySPIEzUYmnHnYH5M3D+Q0gAn3H2qiMIdRV3k192P/6NVNAj5nWxQUCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVj5X9oX+Mrme4GwiFl8Hfbf6no0Uat+PcQYhWzNEghWt+ELtglXSn8lrFjk9WF/X4/b9jzagRQ6KuvXsGM226fncK+l/yLFci20m4M+cHj8G0oKdYXoxukk8/Kr+0lqKJXf9+t0hRLGi3ZXFgo+CqTyZVRlmNDf2zAkkhn2EM6APrHa2nvG+KdtcmZRxqhfaOOAtYwRx9Ah3FxXkO088134KuEVNZrrXffWv70CVxsJMf4/FoTSHv1ik3CKzeU+E7aClzxSRJsOLQaR3bVSHVVwy/4b3U75sjJ3eVKV7Mx03460a0pEwjWlolJRV9BaqO67bPdvY2uQCXszr4QDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fu3GR2rcCmIzIx/09j5PZZGbEugwR4xo996xg3Au1g=;
 b=Vn1kWWOW+c+ab0o3XkckR4nwPy+znEBQC2kjqu+UX95tj+zHr0kcX3NQ4u/bYBfb7D0PiFeEG7ZRcNOCzu+vM3gqiJ7AF3ypOVAC8xQtUzAib8m2tpzn3czD0GK/ihhVLBwGh35/WIQw2HsWmO7UYyo0dwBU7V1Xnx6PLxt3jysvnwiFZlD+GcZa15GbZfm495qftLRYyoBz8+xSO3Puc+vL4ABLsR2wNo6BkbtKquOHXmx3+NVFGdTKD/VR8et7dx34oUIrUcqY2uqwM/LQuHUIPzpfcZCPCpTghRANWuLtwSd07JgEF7oHhKskqHB5f255YLr/9FzJtTAfTb6GKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fu3GR2rcCmIzIx/09j5PZZGbEugwR4xo996xg3Au1g=;
 b=dd1GglZ1BpENjNIBOCDj6aOqaPm9gvvgWtIQfCnoR3vPzrJ+P38Y0kO945+5OWbPEovKbSzavXEtMkTYzkUwoQ4rwozVC+ieWCWep2uK3K8/ZpfMQmfbySPIEzUYmnHnYH5M3D+Q0gAn3H2qiMIdRV3k192P/6NVNAj5nWxQUCg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Thread-Topic: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Thread-Index: AQHXS6W1I2rvO8FRzkm++uFejE9ZNKro1k+AgAAeO2A=
Date: Tue, 18 May 2021 09:30:33 +0000
Message-ID:
 <VE1PR08MB5215F5A28F5B08A2F4950DB9F72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
 <a890200d-b75b-dd59-5d13-b0b211a58da5@suse.com>
In-Reply-To: <a890200d-b75b-dd59-5d13-b0b211a58da5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1BC433EC98280248BAFDECA55250C11F.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bfc92ea8-1a1c-47f0-de14-08d919df9e4d
x-ms-traffictypediagnostic: VI1PR08MB4368:|AM6PR08MB3701:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB37015CB99BC12B1CF6BA557CF72C9@AM6PR08MB3701.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:551;OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hophMEGw//RMXptKnrEnZC5CcjxqZ0APwrXcM2ewKqnfh8SZqqITlVxzbVkh1ZRanqAYWTXJYCcd3NAjJ13za9NjAUNyOL9qnnohXU8LBFsGD5BsrDJj4M2NOA69l7gQ8IijU+C7RWQ5G8QbntWSRivzKZyvOJTDP20Z4DjQ/ROlZkjhnruufgtOCoTJbhYBOWAiFQ54lqTpHdFsXmwM410pXNny6PBzaFT7yqfO/LUPes5F0/98sb6hupdig21ku/i8GByeCSarQHthFG5WZpijZuSTbHuUogL6AwmJJVkZRXe/L0r9Nq3dgYCqubkrRS2lGQ5zYrwcVhLJn8F2WecgV1sCccC8Ml7imtvoC9FSKYHyV1GA6OxTYORx9FC8c4LdubjiSqwCn72P5utFS5mn2HdafKO1AVgcdMHdPLRvyIm76yDhKzu2r4RkPwXHOVtf9oHxKAQ/T07DG/oSwtjCc77wglh+xyh5pV8aeLgJAyyACFnNwlFfXYPSGruMJscfiod3luPzDWuJPUiDQjXrnqsof8zZy5HKoeHJkSzbAmMu2TbXJ1Tc45Af85kI9qjPQ5LVDLeeTxZhVX78FhcQNESEntFMexaseU3Iqto=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(33656002)(8676002)(9686003)(66476007)(478600001)(64756008)(66446008)(52536014)(6506007)(5660300002)(55016002)(66946007)(66556008)(26005)(316002)(53546011)(2906002)(6916009)(54906003)(38100700002)(86362001)(122000001)(8936002)(7696005)(83380400001)(76116006)(4326008)(186003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UW84T0pNRHVibXRKM0FZaXRzZkM5dEZTd3Rvb3VmMEJKcktlclBoU1c5TkRM?=
 =?utf-8?B?NXpCUkNFRVVnTGE3MUJMVldROXFVMVZOZWFsZnNER3RzSTBxdVl0bUlqZzVC?=
 =?utf-8?B?cDF0OFlPb1lJRXcwTGZVQitSMFBGT3o2ZWFWR0JpRWlPNllMck5mc1RxUWhO?=
 =?utf-8?B?cG9zd2dtMTlWTFhDTjJxdnYyZ09LT3BkUFl1WlozZU5IRTR4Z1BPQlRRejR4?=
 =?utf-8?B?WFJ3clJ1aTZ6WCtNZUZCUk81bkFLSWRMME1QWXduQ0tJWmtCZWpsejhxUDA4?=
 =?utf-8?B?Yys1VnlLWkdraVE2YWQrUnpQbUMzeU9sTG5FTThPa0hSaEl4Wk1VcFlubDdy?=
 =?utf-8?B?aTc0YytPQXhVTWtpTytrd25JamdiMk5tUndaVTNtK3hHWFFMZzZXTEM5Rlpj?=
 =?utf-8?B?cE4vQTVKcGNFeTVrN2xsT3ZSdDViR0Q5YkNCci8rNDczZVk2YTdOY2REYzEw?=
 =?utf-8?B?ZEVGSVFrOVZKM3VxNmU5RldXZ3Z5MlhpblRuWGFOMjlzNHlIZFhqamRDNktQ?=
 =?utf-8?B?dU5GdE0reEI0RkFjQzdGcjQvdmF2V3YrdHdwbng0OWR2MFBlVitVN2dsYXNH?=
 =?utf-8?B?dXBpUkRXV2FxRFprd0xLNk5LR05pSW5Nb1hWV1BwdVdGOTRsbTVSa1VjWDZp?=
 =?utf-8?B?eHFhU25jd014SDhyampvWGx3anVPa3kzekV3cDVGek9OYVVoRTA0bDllMW95?=
 =?utf-8?B?cmd1Mzg1bXp5RUZCZHkyam9EYWtzbjZycllRS3JlL3BkMWk4Q0dXallLNFlY?=
 =?utf-8?B?MllIdzNGRFpmRnpIeENEbXEwYmpTdG9WMGwycTI1RnB3ckpDOXNMd0NMUFdC?=
 =?utf-8?B?T0VzYS9wZG1naDVTU05VQXkrMUZpejd6WmVpQnhEZU1hQkNwdmNCNkFuaG11?=
 =?utf-8?B?eDNnQW9VVXZDOEowSHFYZkc0cUtvc0xCd2dQcEM0Q1owVmhrVHdwNUFJTEh1?=
 =?utf-8?B?RjRoWGozZGZWYnJoejNqVkh2cG0yNG15OGc0eTlTMmUrQVdWQmtWRVhVclF4?=
 =?utf-8?B?QXhqdkhIazN5SnhxbmVJcSt5eE5IT0FlWkcxeVZFdkI5Q0JCbU55SE5rMHNs?=
 =?utf-8?B?bXlLNnBESTFTRjFNdVc0S3lwTGc0US84UVFlT1c3YjZyRTdtSUVGTDRtVDd1?=
 =?utf-8?B?eWFWRXJuc0lLVkJVZ1h2ZWZGL1llWEFwWExpNE9wNXZ1N0ZOS0lKSGhoN3cv?=
 =?utf-8?B?eUpmNCs2bk9LT2dPdjR3TTY4cytiRnRRSUFjb0oxOW5nUVdlejg0Y0ZwV0Zm?=
 =?utf-8?B?V0xpTEhxSkdQTGs0VUI0UEhSVTJvWndRUWVOUlFMcWp3b2tuS3NVL2pBNUdm?=
 =?utf-8?B?RUphaTNPOW1GNnR3YjNGWTY1N2Y4cWZrb0hyb21CRFVLYTEva0l2VDRpUWFR?=
 =?utf-8?B?MnNKVS8rRHZyYkZNQ0xMZXBybmdGSHAwWStKaFFEQWgzT1duV3BvNWVhSlg2?=
 =?utf-8?B?ZDFHRjBFa2tNNklNc3JFdzdndzNweFdXNnRhQmdlOFcweU9tRTIyUDNaeUJH?=
 =?utf-8?B?YWI2N3ZIbjJHL2prMlhGeUIveC8vQVJDTzFxSGhWWDEwRFJqVUNUVUcrU3Vh?=
 =?utf-8?B?Z1JtS2lMc2RWQU5ZZXphcjIxVU0zc01xUTlUcDJUaFdwWncxVEVEYUo1ZHBT?=
 =?utf-8?B?V25Xc3FCbHlKQkl5VzhYS2VuVG5uNnRWNVNsR0VENEdHMlFKKzBuUWd2K0dz?=
 =?utf-8?B?ZVNZTUFaYm16MFpMKzBGQzRuU3NrV0JCYkpWOFBXL2VCOUxUclBlWjFVMmVz?=
 =?utf-8?Q?r17tdJpeA134MP7qPg9m14sqhMSE3jj171hT2kZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4368
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	310d69b7-df74-40fd-287c-08d919df9611
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3+82L/8U32Ld0YF3CJqoXDHPRBu4NvExXfBJHCwg9+eMyC15V3K20+DMM5V1iHlcfsTxq4H1WfmWgj8f24+Bfis5LIwK78OS3unyRK9wslqxMnH4cgG4n8mYBlKmegMbcfJJ+QoPtcIj4+13e2SRovfI1AyY7u85Q43E8eijudnWgd/RAWYyPknsltG5PyJiMXu+1/MwduWrkZfPtp9W403YSJO8vjFVwNVkRAiG6pxcsazrhnaaKqUVE0Om/eg91GUzlo5fY2RvhqH2HvKyr/uA7pk/Htzm7TMkyppY9jkROm3n+tK+jvfYn7ol7Vxk3fkxM6+pqv8ower8AER+d2mdPGsPQzVfOHB4fx3ztZXZDlWUK/SNCll9ulTmm0EW9xOHxHPsDNSTvZ9sJO17bt6SvxaaNktFZA1bmiNu03ehaXQztJOQ+n0adzUsJqm4nytjrbk2UAtDXcLC+RJj7/bx/8kKPI/Kbpby9tzJyxL6BPEmKUIz5ehYjvUmj/hJGoHri3CxHnRVWk3N8CECgEg4uGIY3xCaIRnc1Sq1zo5boEvIkVCUv1qKicQqlkaZ4EehPPzEd0cTaMNvUlz3q8k5ZPVwMbeO/C4FN/vVtyezkSvyANv6oZVzxyrujGOTGS/V3/VtcQVWKVmAlPKIrjIsuyfUBhu0xr4OlB3xBLk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(46966006)(52536014)(478600001)(47076005)(7696005)(70206006)(8676002)(5660300002)(4326008)(86362001)(54906003)(8936002)(55016002)(6862004)(70586007)(186003)(316002)(9686003)(6506007)(36860700001)(336012)(26005)(2906002)(53546011)(356005)(82740400003)(81166007)(33656002)(82310400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:30:47.3130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc92ea8-1a1c-47f0-de14-08d919df9e4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3701

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgMzoy
NCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA1LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWxsb2Nfc3RhdGljbWVt
X3BhZ2VzDQo+IA0KPiBPbiAxOC4wNS4yMDIxIDA3OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
PiBhbGxvY19zdGF0aWNtZW1fcGFnZXMgaXMgZGVzaWduYXRlZCB0byBhbGxvY2F0ZSBucl9wZm5z
IGNvbnRpZ3VvdXMNCj4gPiBwYWdlcyBvZiBzdGF0aWMgbWVtb3J5LiBBbmQgaXQgaXMgdGhlIGVx
dWl2YWxlbnQgb2YgYWxsb2NfaGVhcF9wYWdlcw0KPiA+IGZvciBzdGF0aWMgbWVtb3J5Lg0KPiA+
IFRoaXMgY29tbWl0IG9ubHkgY292ZXJzIGFsbG9jYXRpbmcgYXQgc3BlY2lmaWVkIHN0YXJ0aW5n
IGFkZHJlc3MuDQo+ID4NCj4gPiBGb3IgZWFjaCBwYWdlLCBpdCBzaGFsbCBjaGVjayBpZiB0aGUg
cGFnZSBpcyByZXNlcnZlZA0KPiA+IChQR0NfcmVzZXJ2ZWQpIGFuZCBmcmVlLiBJdCBzaGFsbCBh
bHNvIGRvIGEgc2V0IG9mIG5lY2Vzc2FyeQ0KPiA+IGluaXRpYWxpemF0aW9uLCB3aGljaCBhcmUg
bW9zdGx5IHRoZSBzYW1lIG9uZXMgaW4gYWxsb2NfaGVhcF9wYWdlcywNCj4gPiBsaWtlLCBmb2xs
b3dpbmcgdGhlIHNhbWUgY2FjaGUtY29oZXJlbmN5IHBvbGljeSBhbmQgdHVybmluZyBwYWdlDQo+
ID4gc3RhdHVzIGludG8gUEdDX3N0YXRlX3VzZWQsIGV0Yy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICB4ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYyB8IDY0DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jIGluZGV4DQo+ID4gNThiNTNjNmFjMi4uYWRmMjg4OWU3NiAxMDA2NDQNCj4g
PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jDQo+ID4gQEAgLTEwNjgsNiArMTA2OCw3MCBAQCBzdGF0aWMgc3RydWN0IHBhZ2Vf
aW5mbyAqYWxsb2NfaGVhcF9wYWdlcygNCj4gPiAgICAgIHJldHVybiBwZzsNCj4gPiAgfQ0KPiA+
DQo+ID4gKy8qDQo+ID4gKyAqIEFsbG9jYXRlIG5yX3BmbnMgY29udGlndW91cyBwYWdlcywgc3Rh
cnRpbmcgYXQgI3N0YXJ0LCBvZiBzdGF0aWMgbWVtb3J5Lg0KPiA+ICsgKiBJdCBpcyB0aGUgZXF1
aXZhbGVudCBvZiBhbGxvY19oZWFwX3BhZ2VzIGZvciBzdGF0aWMgbWVtb3J5ICAqLw0KPiA+ICtz
dGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2Nfc3RhdGljbWVtX3BhZ2VzKHVuc2lnbmVkIGxv
bmcgbnJfcGZucywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFkZHJfdCBzdGFydCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50DQo+ID4gK21lbWZsYWdzKQ0KPiANCj4g
VGhpcyBpcyBzdXJlbHkgYnJlYWtpbmcgdGhlIGJ1aWxkIChhdCB0aGlzIHBvaW50IGluIHRoZSBz
ZXJpZXMgLSByZWNhbGwgdGhhdCBhIHNlcmllcw0KPiBzaG91bGQgYnVpbGQgZmluZSBhdCBldmVy
eSBwYXRjaCBib3VuZGFyeSksIGZvciBpbnRyb2R1Y2luZyBhbiB1bnVzZWQgc3RhdGljDQo+IGZ1
bmN0aW9uLCB3aGljaCBtb3N0IGNvbXBpbGVycyB3aWxsIHdhcm4gYWJvdXQuDQo+DQoNClN1cmUs
IEknbGwgY29tYmluZSBpdCB3aXRoIG90aGVyIGNvbW1pdHMNCg0KPiBBbHNvIGFnYWluIC0gcGxl
YXNlIGF2b2lkIGludHJvZHVjaW5nIGNvZGUgdGhhdCdzIGFsd2F5cyBkZWFkIGZvciBjZXJ0YWlu
DQo+IGFyY2hpdGVjdHVyZXMuIFF1aXRlIGxpa2VseSB5b3Ugd2FudCBhIEtjb25maWcgb3B0aW9u
IHRvIHB1dCBhIHN1aXRhYmxlICNpZmRlZg0KPiBhcm91bmQgc3VjaCBmdW5jdGlvbnMuDQo+IA0K
DQpTdXJlLCBzb3JyeSBmb3IgYWxsIHRoZSBtaXNzaW5nICNpZmRlZnMuDQoNCj4gQW5kIGEgbml0
OiBQbGVhc2UgY29ycmVjdCB0aGUgYXBwYXJlbnRseSBvZmYtYnktb25lIGluZGVudGF0aW9uLg0K
Pg0KDQpTdXJlLCBJJ2xsIGNoZWNrIHRocm91Z2ggdGhlIGNvZGUgbW9yZSBjYXJlZnVsbHkuDQoN
Cj4gPiArew0KPiA+ICsgICAgYm9vbCBuZWVkX3RsYmZsdXNoID0gZmFsc2U7DQo+ID4gKyAgICB1
aW50MzJfdCB0bGJmbHVzaF90aW1lc3RhbXAgPSAwOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IGk7
DQo+IA0KPiBUaGlzIHZhcmlhYmxlJ3MgdHlwZSBzaG91bGQgKGFnYWluKSBtYXRjaCBucl9wZm5z
J2VzIChhbGJlaXQgSSB0aGluayB0aGF0DQo+IHBhcmFtZXRlciByZWFsbHkgd2FudHMgdG8gYmUg
bnJfbWZucykuDQo+IA0KDQpDb3JyZWN0IGlmIEkgdW5kZXJzdGFuZCB5b3Ugd3JvbmdseSwgeW91
IG1lYW4gdGhhdCBwYXJhbWV0ZXJzIGluIGFsbG9jX3N0YXRpY21lbV9wYWdlcw0KYXJlIGJldHRl
ciBiZSBuYW1lZCBhZnRlciB1bnNpZ25lZCBsb25nIG5yX21mbnMsIHJpZ2h0Pw0KDQo+ID4gKyAg
ICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsNCj4gPiArICAgIG1mbl90IHNfbWZuOw0KPiA+ICsNCj4g
PiArICAgIC8qIEZvciBub3csIGl0IG9ubHkgc3VwcG9ydHMgYWxsb2NhdGluZyBhdCBzcGVjaWZp
ZWQgYWRkcmVzcy4gKi8NCj4gPiArICAgIHNfbWZuID0gbWFkZHJfdG9fbWZuKHN0YXJ0KTsNCj4g
PiArICAgIHBnID0gbWZuX3RvX3BhZ2Uoc19tZm4pOw0KPiA+ICsgICAgaWYgKCAhcGcgKQ0KPiA+
ICsgICAgICAgIHJldHVybiBOVUxMOw0KPiANCj4gVW5kZXIgd2hhdCBjb25kaXRpb25zIHdvdWxk
IG1mbl90b19wYWdlKCkgcmV0dXJuIE5VTEw/DQoNClJpZ2h0LCBteSBtaXN0YWtlLg0KDQo+DQo+
ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3BmbnM7IGkrKykNCj4gPiArICAgIHsNCj4gPiAr
ICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIFJlZmVyZW5jZSBjb3VudCBtdXN0IGNvbnRpbnVv
dXNseSBiZSB6ZXJvIGZvciBmcmVlIHBhZ2VzDQo+ID4gKyAgICAgICAgICogb2Ygc3RhdGljIG1l
bW9yeShQR0NfcmVzZXJ2ZWQpLg0KPiA+ICsgICAgICAgICAqLw0KPiA+ICsgICAgICAgIEFTU0VS
VChwZ1tpXS5jb3VudF9pbmZvICYgUEdDX3Jlc2VydmVkKTsNCj4gPiArICAgICAgICBpZiAoIChw
Z1tpXS5jb3VudF9pbmZvICYgflBHQ19yZXNlcnZlZCkgIT0gUEdDX3N0YXRlX2ZyZWUgKQ0KPiA+
ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4gPiArICAg
ICAgICAgICAgICAgICAgICAiUmVmZXJlbmNlIGNvdW50IG11c3QgY29udGludW91c2x5IGJlIHpl
cm8gZm9yIGZyZWUgcGFnZXMiDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgInBnWyV1XSBNRk4g
JSJQUklfbWZuIiBjPSUjbHggdD0lI3hcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaSwg
bWZuX3gocGFnZV90b19tZm4ocGcgKyBpKSksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcGdb
aV0uY291bnRfaW5mbywgcGdbaV0udGxiZmx1c2hfdGltZXN0YW1wKTsNCj4gDQo+IE5pdDogSW5k
ZW50YXRpb24gYWdhaW4uDQo+DQogDQpUaHgNCg0KPiA+ICsgICAgICAgICAgICBCVUcoKTsNCj4g
PiArICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICggIShtZW1mbGFncyAmIE1FTUZf
bm9fdGxiZmx1c2gpICkNCj4gPiArICAgICAgICAgICAgYWNjdW11bGF0ZV90bGJmbHVzaCgmbmVl
ZF90bGJmbHVzaCwgJnBnW2ldLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZ0bGJmbHVzaF90aW1lc3RhbXApOw0KPiA+ICsNCj4gPiArICAgICAgICAvKg0KPiA+ICsgICAg
ICAgICAqIFJlc2VydmUgZmxhZyBQR0NfcmVzZXJ2ZWQgYW5kIGNoYW5nZSBwYWdlIHN0YXRlDQo+
IA0KPiBEWU0gIlByZXNlcnZlIC4uLiI/DQo+IA0KDQpTdXJlLCB0aHgNCg0KPiA+ICsgICAgICAg
ICAqIHRvIFBHQ19zdGF0ZV9pbnVzZS4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBw
Z1tpXS5jb3VudF9pbmZvID0gKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQpIHwNCj4g
UEdDX3N0YXRlX2ludXNlOw0KPiA+ICsgICAgICAgIC8qIEluaXRpYWxpc2UgZmllbGRzIHdoaWNo
IGhhdmUgb3RoZXIgdXNlcyBmb3IgZnJlZSBwYWdlcy4gKi8NCj4gPiArICAgICAgICBwZ1tpXS51
LmludXNlLnR5cGVfaW5mbyA9IDA7DQo+ID4gKyAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ld
LCBOVUxMKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBFbnN1cmUg
Y2FjaGUgYW5kIFJBTSBhcmUgY29uc2lzdGVudCBmb3IgcGxhdGZvcm1zIHdoZXJlIHRoZQ0KPiA+
ICsgICAgICAgICAqIGd1ZXN0IGNhbiBjb250cm9sIGl0cyBvd24gdmlzaWJpbGl0eSBvZi90aHJv
dWdoIHRoZSBjYWNoZS4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBmbHVzaF9wYWdl
X3RvX3JhbShtZm5feChwYWdlX3RvX21mbigmcGdbaV0pKSwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICEobWVtZmxhZ3MgJiBNRU1GX25vX2ljYWNoZV9mbHVzaCkpOw0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggbmVlZF90bGJmbHVzaCApDQo+ID4gKyAgICAgICAg
ZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sodGxiZmx1c2hfdGltZXN0YW1wKTsNCj4gDQo+IFdpdGgg
cmVzZXJ2ZWQgcGFnZXMgZGVkaWNhdGVkIHRvIGEgc3BlY2lmaWMgZG9tYWluLCBpbiBob3cgZmFy
IGlzIGl0IHBvc3NpYmxlDQo+IHRoYXQgc3RhbGUgbWFwcGluZ3MgZnJvbSBhIHByaW9yIHVzZSBj
YW4gc3RpbGwgYmUgYXJvdW5kLCBtYWtpbmcgc3VjaCBUTEINCj4gZmx1c2hpbmcgbmVjZXNzYXJ5
Pw0KPiANCg0KWWVzLCB5b3UncmUgcmlnaHQuDQoNCj4gSmFuDQo=

