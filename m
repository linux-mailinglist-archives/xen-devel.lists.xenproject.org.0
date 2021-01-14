Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B22F59AD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 04:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66840.118895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kztmX-0005t9-37; Thu, 14 Jan 2021 03:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66840.118895; Thu, 14 Jan 2021 03:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kztmW-0005sk-WE; Thu, 14 Jan 2021 03:58:45 +0000
Received: by outflank-mailman (input) for mailman id 66840;
 Thu, 14 Jan 2021 03:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NBCl=GR=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kztmW-0005sf-4J
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 03:58:44 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72481c02-fd70-49c8-b199-d6d322686e0b;
 Thu, 14 Jan 2021 03:58:41 +0000 (UTC)
Received: from AM9P193CA0006.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::11)
 by DB6PR0801MB1925.eurprd08.prod.outlook.com (2603:10a6:4:74::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Thu, 14 Jan
 2021 03:58:38 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21e:cafe::d0) by AM9P193CA0006.outlook.office365.com
 (2603:10a6:20b:21e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 03:58:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 03:58:37 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Thu, 14 Jan 2021 03:58:37 +0000
Received: from 99d368d706a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F298FB1C-C168-4126-ABAD-B686A56ED25E.1; 
 Thu, 14 Jan 2021 03:58:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99d368d706a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jan 2021 03:58:32 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM4PR0802MB2194.eurprd08.prod.outlook.com (2603:10a6:200:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 03:58:31 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::158a:5405:59b6:e0a8]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::158a:5405:59b6:e0a8%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 03:58:31 +0000
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
X-Inumbo-ID: 72481c02-fd70-49c8-b199-d6d322686e0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6fNtCVgDxDtSn9VHsMXzFab5ijJomSYtb5EJyJeSU=;
 b=vydKMdfCAqs0wEtvd580U6p/hfOAe+xwbJSfnzBKx6od8zPpcwbchRZ78d0VSXQLKo8UnjTZhcrFKsF/Iz5MpNQADftyj4mZUlMVutwkQ5mw7uvR9uBnikQ8nwXv3vGJ9Jfsv0QcMeNRQlXUdpdQ8OqOXbapm0ZU28q8cVfZPeY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNVhTPyRV7ZcvQMjNAyyBsAhfdPizZxvo0PUxaD6+wGM4EgAhqgsi8Km8g7WbN2E5sSP+/JA+npQ85mXvITlGLkrakt2hptLMIAEIQN7ts/jztK6FAyWPEKLBWaCHuuS7BiT9fzr0Nb6tJuF4gHb3wr6DfiAKbOd2nQ24ggr/r89HALdzyOr81BIvBRolW1wPI6QFESxgGCbKDkefzJdntZDP6vm+/ic0bWV1p4onMUx77uJOMdM3hWVW1vr4sWSCmqKvzglixQ5UBpfxUUMyLyqoA936Ddvv20uq5XPWLGSYCvmiviwXIpvSTIijZ9VOH2NC/APd/aXhx3SScrNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6fNtCVgDxDtSn9VHsMXzFab5ijJomSYtb5EJyJeSU=;
 b=HNXzhCS+CjA0X+kU3orUaA+kQOm6StGIJvvHmSXpnCdeL6bmGTFIVhva/0765iXXusxZ3py1MNPLrXxfbIyTRwgpVoieoEgyLbX7OukDeNfLnhk3ei1C5Kaci7sYEfXDgpNMVI8lW44lSKGP8xSQMc7GRBf6iG2WVWh+w9sFXKW0Av9mgXSJGy5l2dpYcILamen4xrhLcVdZq+5did7O1+E+C4FiRbVYF3HHiLdlYLO1W5ZdhoFDpbCYV0Ys8sZX1uQ+ftLI3y0m654J65y6qNGxmzoIB3cQqd8ZIRomcDCSng0qKGnvrQ3MUWcUSCya40DvPzfP+/C3b1UQWKyLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6fNtCVgDxDtSn9VHsMXzFab5ijJomSYtb5EJyJeSU=;
 b=vydKMdfCAqs0wEtvd580U6p/hfOAe+xwbJSfnzBKx6od8zPpcwbchRZ78d0VSXQLKo8UnjTZhcrFKsF/Iz5MpNQADftyj4mZUlMVutwkQ5mw7uvR9uBnikQ8nwXv3vGJ9Jfsv0QcMeNRQlXUdpdQ8OqOXbapm0ZU28q8cVfZPeY=
From: Wei Chen <Wei.Chen@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <Julien.Grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?gb2312?B?Um9nZXIgUGF1IE1vbm6opg==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: RE: [PATCH V4 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
Thread-Topic: [PATCH V4 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
Thread-Index: AQHW6S5PYn/dT/QyWEKw3hmUpwFP3KomgF8A
Date: Thu, 14 Jan 2021 03:58:30 +0000
Message-ID:
 <AM0PR08MB3747ECA6E3CB200C0D606F809EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D0902C740F2D124C82BD8AA04916B244.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [218.82.34.89]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1251c53e-004e-40f1-7f19-08d8b840ac47
x-ms-traffictypediagnostic: AM4PR0802MB2194:|DB6PR0801MB1925:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1925168C8BEF75C3556911179EA80@DB6PR0801MB1925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CP3RS9NGv0BgZIHhkAbpmRaXCRG/0/ILbcFtXaSfQeZNdnxZ8JWL1l0kfA1a+TM9C/iuY0WkNIA4YSgn2KCNR+uhyCQGaYccV0YTTyyldHVpVJ4rr0pCPjFTVdG0EYMavXBc/OkqBerUDJdcr3GKN2GWTyokntkEUIwsBzhMwwJt7xcN33QHpqUtvaEM+w0wkMQrNL2cttztWcsYigjgDLDePb7Wdi/OSuGnTI10jdyVrZ90SA2XJjKPiatuben6UwB7B8zokC0CJkq0HuPrtjifVXbmGZwIrB4IBPFWgnnK8ix/YZsgVzOfFQQzE5OchL8wv5vrIhWnJg5YkxuHITYBi+1D7CHqXmD4LD3pqAypX7nINkBQXcND+eiDVoVw/NdeLDJNp6yvV07cU4QA8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(366004)(376002)(396003)(9686003)(55016002)(66946007)(478600001)(66446008)(64756008)(66476007)(66556008)(76116006)(8936002)(316002)(8676002)(33656002)(26005)(54906003)(186003)(7416002)(4326008)(83380400001)(6506007)(53546011)(5660300002)(86362001)(110136005)(71200400001)(2906002)(7696005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?gb2312?B?YStTZ0I3VXduOVBNN3hEb3RET29lUzVnQms3OWhkRitQK0ZhN1ZvSEVBeEd2?=
 =?gb2312?B?TThNcXZoNHZ0NHM3YnBkKzEwV2ZLY01uTkFMNThtWWhNQ2wybzdRNVVtcVN1?=
 =?gb2312?B?bkU4REJlWFRpSy80a0owWlkrMkl1M0FGdTBpMU94cDZHSVBkOGc0Zm1TNldD?=
 =?gb2312?B?eCtiVWhLSk55UklSc1gwdnFlbUJINEtYUjh2d3QzTFZhSDBDTHd2WWpPV29h?=
 =?gb2312?B?QU1JRnV3STZjNENrR2JPbHQ2VlhQUTNhNHJkQlFjWnlkZEpZd3RVVlJtbHJh?=
 =?gb2312?B?WEVwVE9uZXByRE5lUXpIUlhIT25pS1RVa212U25nOGZuM2o2M0d3YjZLUERO?=
 =?gb2312?B?dGRKQ2ZzRXFmclAzRXZhUU1oeVBkRkc1Vmw2ODYrMUhFbEEvYlhITXNvTGtD?=
 =?gb2312?B?UFUvUExCWDExeDFDYk8wM2tUOG9TcmdVa05jVkFNdUtTdVFUUzltWmNQR2Fh?=
 =?gb2312?B?UWhtQ0RaV3FJSXFKenV0NWxRQkg0V2g0MTVGNVI4bGtXN0xOTVRDYnhKT3p1?=
 =?gb2312?B?UldOT2NKejJkanowTEFUNTBGNE8rcXV2NGNvSFg4RW5ub1FDMGtTd1VrdW1F?=
 =?gb2312?B?QWYvUzdLNEpoQXFXcXNLY0w0NTQ4Qm1WaDAyeFN6VjNXcDVoZ29oSE40ajEz?=
 =?gb2312?B?SUhKS1M0MUNIeER6a2JSVXk2TGVUeTVwTk04ZjI0NGlweHNMaUVYY0tMbGZo?=
 =?gb2312?B?bEluWlFQaGdxYk1ER1ZnQVZVYWVLSld0cFBMTlJ4dlRCMWY1cTNlOWluVzJi?=
 =?gb2312?B?enBhVjQ1bi9aRkdFaEMwalRkNGxFUkNaMkVQSmpQdWw5QXVwUU9YZktjeisz?=
 =?gb2312?B?L00wOXN3Q3A5N201d0hhbFY2WlVLMHNHd2xIc3FIbW43NzBtalpRSmRSSXlW?=
 =?gb2312?B?Yi9WaUp2WWJPWFl1QzhSN3JMMGpWdlhQcHhpR1U4d2pQa0JmNTQ5NVgxSFJM?=
 =?gb2312?B?WDJBOXVmUmZkVXRGUVZEckowNmRsTENqUGMvazUwdXBCTGF5L0dqLzJadlpX?=
 =?gb2312?B?d3Q1OU10VzVORm96MDg5Y1hpZEF5ZkF5TGhYUDJBQUJuSGVKbjhyakdvYU9m?=
 =?gb2312?B?MGFrYkVJZ0RXaUplNDFlWHFCUDY2Q0FRalA5TERRY1dpMG5GdmxabHJwSEQ4?=
 =?gb2312?B?YkRETUdvdUV4OURvbXVmeGNwbGJRNlM3WllJQnZtek1kZ0VKaW5BQXhqZmRa?=
 =?gb2312?B?QmpxcUdPS3l1cjlKU0dKQ1ZLTkM3dE53NHgraE91L0ljTGVwUGszY0FGOFZi?=
 =?gb2312?B?YUJQRUFVeUt2VXZpTmFSQm12MHNyN0dwdTN4N3hhYmE0czJHbFZxbHhGaVI1?=
 =?gb2312?Q?+MFIaaJBegn34=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2194
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd7ba575-b3a3-4a9a-c761-08d8b840a816
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BI1Q4O7/LASSXGHSZ+tipsr3z+WSSVbKIXwTnMNSICCSXVy4jmjPE4guonRAlzYvQIUGeFVqeXtiOszSF2vJsYq/cGF20y4i3kQByNHKQ9uIJjZ3uFDbB3JE/oE/lOiWGeiDZnrDxArpNPt8/9VTo1t35QRzu/V0EdQhkNMT5MizWc43dwk8cxrv++SVMFHGs9QWocQwuRDF9pAbAUgp8MdTBgiIYjk6rOs1G3vXqOK8cIGF19J9XWqmLfhAtYZUkeuAd6dJPofIA368C8xtnDXhr00H4CrvQ6YKyoNxFZycVrBhY6/25fVyBxegugbUGLSDVo7CnrLXGaaQtcuZs53YPv1wxBRK+2GCnUcnscH/HY7f9OL/wUJtXcyOUs4Sfi6vfBqLrIbMlFjzKhN2uqjpih/iXJlrQwUR6Tg9za4AUBby0M4q13dpM2++RaQ+v7b9WMElWQsSfo4dlFLmLwb9GAYXn4hm23U13zTk809HQ69WreWOcQdds8MZi8ng
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(107886003)(8936002)(9686003)(83380400001)(81166007)(52536014)(55016002)(54906003)(2906002)(70206006)(316002)(7696005)(478600001)(70586007)(47076005)(33656002)(4326008)(82740400003)(53546011)(336012)(356005)(86362001)(26005)(186003)(8676002)(82310400003)(110136005)(5660300002)(34020700004)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 03:58:37.9420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1251c53e-004e-40f1-7f19-08d8b840ac47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1925

SGkgT2xla3NhbmRyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhl
bi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFs
ZiBPZg0KPiBPbGVrc2FuZHIgVHlzaGNoZW5rbw0KPiBTZW50OiAyMDIxxOox1MIxM8jVIDU6NTIN
Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSnVsaWVuIEdyYWxs
IDxKdWxpZW4uR3JhbGxAYXJtLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47
DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUg
TW9ubqimDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBH
ZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8
aXdqQHhlbnByb2plY3Qub3JnPjsgSnVsaWVuIEdyYWxsDQo+IDxqdWxpZW5AeGVuLm9yZz47IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFZvbG9keW15cg0KPiBC
YWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IE9sZWtzYW5kciBUeXNoY2hlbmtv
DQo+IDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIFY0
IDExLzI0XSB4ZW4vbW06IE1ha2UgeDg2J3MNCj4gWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZl
ciBoYW5kbGluZyBjb21tb24NCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+DQo+IA0KPiBBcyB4ODYgaW1wbGVtZW50YXRpb24gb2YgWEVOTUVNX3Jlc291cmNl
X2lvcmVxX3NlcnZlciBjYW4gYmUNCj4gcmUtdXNlZCBvbiBBcm0gbGF0ZXIgb24sIHRoaXMgcGF0
Y2ggbWFrZXMgaXQgY29tbW9uIGFuZCByZW1vdmVzDQo+IGFyY2hfYWNxdWlyZV9yZXNvdXJjZSBh
cyB1bm5lZWRlZC4NCj4gDQo+IEFsc28gcmUtb3JkZXIgI2luY2x1ZGUtcyBhbHBoYWJldGljYWxs
eS4NCj4gDQo+IFRoaXMgc3VwcG9ydCBpcyBnb2luZyB0byBiZSB1c2VkIG9uIEFybSB0byBiZSBh
YmxlIHJ1biBkZXZpY2UNCj4gZW11bGF0b3Igb3V0c2lkZSBvZiBYZW4gaHlwZXJ2aXNvci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gW09uIEFybSBvbmx5XQ0KPiBUZXN0ZWQtYnk6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0u
Y29tPg0KPiANCj4gLS0tDQo+IFBsZWFzZSBub3RlLCB0aGlzIGlzIGEgc3BsaXQvY2xlYW51cC9o
YXJkZW5pbmcgb2YgSnVsaWVuJ3MgUG9DOg0KPiAiQWRkIHN1cHBvcnQgZm9yIEd1ZXN0IElPIGZv
cndhcmRpbmcgdG8gYSBkZXZpY2UgZW11bGF0b3IiDQo+IA0KPiBDaGFuZ2VzIFJGQyAtPiBWMToN
Cj4gICAgLSBubyBjaGFuZ2VzDQo+IA0KPiBDaGFuZ2VzIFYxIC0+IFYyOg0KPiAgICAtIHVwZGF0
ZSB0aGUgYXV0aG9yIG9mIGEgcGF0Y2gNCj4gDQo+IENoYW5nZXMgVjIgLT4gVjM6DQo+ICAgIC0g
ZG9uJ3Qgd3JhcCAjaW5jbHVkZSA8eGVuL2lvcmVxLmg+DQo+ICAgIC0gbGltaXQgdGhlIG51bWJl
ciBvZiAjaWZkZWYtcw0KPiAgICAtIHJlLW9yZGVyICNpbmNsdWRlLXMgYWxwaGFiZXRpY2FsbHkN
Cj4gDQo+IENoYW5nZXMgVjMgLT4gVjQ6DQo+ICAgIC0gcmViYXNlDQo+ICAgIC0gQWRkIEphbidz
IFItYg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICB8IDQ0IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgIHwgNjMN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICB4
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggfCAgOCAtLS0tLS0NCj4gIHhlbi9pbmNsdWRlL2FzbS14
ODYvbW0uaCB8ICA0IC0tLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCA2
OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hl
bi9hcmNoL3g4Ni9tbS5jDQo+IGluZGV4IGY2ZTEyOGUuLjU0YWMzOTggMTAwNjQ0DQo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+IEBAIC00NTg3
LDUwICs0NTg3LDYgQEAgc3RhdGljIGludCBoYW5kbGVfaW9tZW1fcmFuZ2UodW5zaWduZWQgbG9u
ZyBzLA0KPiB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKnApDQo+ICAgICAgcmV0dXJuIGVyciB8fCBz
ID4gZSA/IGVyciA6IF9oYW5kbGVfaW9tZW1fcmFuZ2UocywgZSwgcCk7DQo+ICB9DQo+IA0KPiAt
aW50IGFyY2hfYWNxdWlyZV9yZXNvdXJjZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQg
dHlwZSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGlkLCB1bnNp
Z25lZCBsb25nIGZyYW1lLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgbnJfZnJhbWVzLCB4ZW5fcGZuX3QgbWZuX2xpc3RbXSkNCj4gLXsNCj4gLSAgICBpbnQgcmM7
DQo+IC0NCj4gLSAgICBzd2l0Y2ggKCB0eXBlICkNCj4gLSAgICB7DQo+IC0jaWZkZWYgQ09ORklH
X0hWTQ0KPiAtICAgIGNhc2UgWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZlcjoNCj4gLSAgICB7
DQo+IC0gICAgICAgIGlvc2VydmlkX3QgaW9zZXJ2aWQgPSBpZDsNCj4gLSAgICAgICAgdW5zaWdu
ZWQgaW50IGk7DQo+IC0NCj4gLSAgICAgICAgcmMgPSAtRUlOVkFMOw0KPiAtICAgICAgICBpZiAo
ICFpc19odm1fZG9tYWluKGQpICkNCj4gLSAgICAgICAgICAgIGJyZWFrOw0KPiAtDQo+IC0gICAg
ICAgIGlmICggaWQgIT0gKHVuc2lnbmVkIGludClpb3NlcnZpZCApDQo+IC0gICAgICAgICAgICBi
cmVhazsNCj4gLQ0KPiAtICAgICAgICByYyA9IDA7DQo+IC0gICAgICAgIGZvciAoIGkgPSAwOyBp
IDwgbnJfZnJhbWVzOyBpKysgKQ0KPiAtICAgICAgICB7DQo+IC0gICAgICAgICAgICBtZm5fdCBt
Zm47DQo+IC0NCj4gLSAgICAgICAgICAgIHJjID0gaHZtX2dldF9pb3JlcV9zZXJ2ZXJfZnJhbWUo
ZCwgaWQsIGZyYW1lICsgaSwgJm1mbik7DQo+IC0gICAgICAgICAgICBpZiAoIHJjICkNCj4gLSAg
ICAgICAgICAgICAgICBicmVhazsNCj4gLQ0KPiAtICAgICAgICAgICAgbWZuX2xpc3RbaV0gPSBt
Zm5feChtZm4pOw0KPiAtICAgICAgICB9DQo+IC0gICAgICAgIGJyZWFrOw0KPiAtICAgIH0NCj4g
LSNlbmRpZg0KPiAtDQo+IC0gICAgZGVmYXVsdDoNCj4gLSAgICAgICAgcmMgPSAtRU9QTk9UU1VQ
UDsNCj4gLSAgICAgICAgYnJlYWs7DQo+IC0gICAgfQ0KPiAtDQo+IC0gICAgcmV0dXJuIHJjOw0K
PiAtfQ0KPiAtDQo+ICBsb25nIGFyY2hfbWVtb3J5X29wKHVuc2lnbmVkIGxvbmcgY21kLCBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpDQo+IGFyZykNCj4gIHsNCj4gICAgICBpbnQgcmM7DQo+
IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL21lbW9yeS5jIGIveGVuL2NvbW1vbi9tZW1vcnkuYw0K
PiBpbmRleCBiMjFiNmM0Li43ZTU2MGI1IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL21lbW9y
eS5jDQo+ICsrKyBiL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gQEAgLTgsMjIgKzgsMjMgQEANCj4g
ICAqLw0KPiANCj4gICNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4NCj4gLSNpbmNsdWRlIDx4
ZW4vdHlwZXMuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4gKyNpbmNsdWRlIDx4ZW4v
ZXZlbnQuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4NCj4gKyNpbmNsdWRlIDx4
ZW4vZ3Vlc3RfYWNjZXNzLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPg0KPiArI2lu
Y2x1ZGUgPHhlbi9pb2NhcC5oPg0KPiArI2luY2x1ZGUgPHhlbi9pb3JlcS5oPg0KPiAgI2luY2x1
ZGUgPHhlbi9saWIuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vbWVtX2FjY2Vzcy5oPg0KPiAgI2luY2x1
ZGUgPHhlbi9tbS5oPg0KPiArI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ICsjaW5jbHVkZSA8eGVu
L3BhZ2luZy5oPg0KPiAgI2luY2x1ZGUgPHhlbi9wYXJhbS5oPg0KPiAgI2luY2x1ZGUgPHhlbi9w
ZXJmYy5oPg0KPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiAtI2luY2x1ZGUgPHhlbi9ldmVu
dC5oPg0KPiAtI2luY2x1ZGUgPHhlbi9wYWdpbmcuaD4NCj4gLSNpbmNsdWRlIDx4ZW4vaW9jYXAu
aD4NCj4gLSNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+DQo+IC0jaW5jbHVkZSA8eGVuL2h5
cGVyY2FsbC5oPg0KPiAtI2luY2x1ZGUgPHhlbi9lcnJuby5oPg0KPiAtI2luY2x1ZGUgPHhlbi9u
dW1hLmg+DQo+IC0jaW5jbHVkZSA8eGVuL21lbV9hY2Nlc3MuaD4NCj4gICNpbmNsdWRlIDx4ZW4v
dHJhY2UuaD4NCj4gLSNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4NCj4gKyNpbmNsdWRlIDx4
ZW4vdHlwZXMuaD4NCj4gICNpbmNsdWRlIDxhc20vY3VycmVudC5oPg0KPiAgI2luY2x1ZGUgPGFz
bS9oYXJkaXJxLmg+DQo+ICAjaW5jbHVkZSA8YXNtL3AybS5oPg0KPiBAQCAtMTA5MCw2ICsxMDkx
LDQwIEBAIHN0YXRpYyBpbnQgYWNxdWlyZV9ncmFudF90YWJsZShzdHJ1Y3QgZG9tYWluICpkLA0K
PiB1bnNpZ25lZCBpbnQgaWQsDQo+ICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiArc3RhdGlj
IGludCBhY3F1aXJlX2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaWQsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnJhbWUsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mcmFtZXMsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHhlbl9wZm5fdCBtZm5fbGlzdFtdKQ0KPiArew0KPiArI2lm
ZGVmIENPTkZJR19JT1JFUV9TRVJWRVINCj4gKyAgICBpb3NlcnZpZF90IGlvc2VydmlkID0gaWQ7
DQo+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ICsgICAgaW50IHJjOw0KPiArDQo+ICsgICAgaWYg
KCAhaXNfaHZtX2RvbWFpbihkKSApDQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+
ICsgICAgaWYgKCBpZCAhPSAodW5zaWduZWQgaW50KWlvc2VydmlkICkNCj4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ICsNCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG5yX2ZyYW1lczsgaSsr
ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIG1mbl90IG1mbjsNCj4gKw0KPiArICAgICAgICByYyA9
IGh2bV9nZXRfaW9yZXFfc2VydmVyX2ZyYW1lKGQsIGlkLCBmcmFtZSArIGksICZtZm4pOw0KPiAr
ICAgICAgICBpZiAoIHJjICkNCj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4gKw0KPiArICAg
ICAgICBtZm5fbGlzdFtpXSA9IG1mbl94KG1mbik7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0
dXJuIDA7DQo+ICsjZWxzZQ0KPiArICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gKyNlbmRpZg0K
PiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGFjcXVpcmVfcmVzb3VyY2UoDQo+ICAgICAgWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh4ZW5fbWVtX2FjcXVpcmVfcmVzb3VyY2VfdCkgYXJnKQ0KPiAgew0K
PiBAQCAtMTE0OCw5ICsxMTgzLDEzIEBAIHN0YXRpYyBpbnQgYWNxdWlyZV9yZXNvdXJjZSgNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl9saXN0KTsNCj4gICAgICAgICAg
YnJlYWs7DQo+IA0KPiArICAgIGNhc2UgWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZlcjoNCj4g
KyAgICAgICAgcmMgPSBhY3F1aXJlX2lvcmVxX3NlcnZlcihkLCB4bWFyLmlkLCB4bWFyLmZyYW1l
LCB4bWFyLm5yX2ZyYW1lcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
Zm5fbGlzdCk7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICAgICAgZGVmYXVsdDoNCj4gLSAg
ICAgICAgcmMgPSBhcmNoX2FjcXVpcmVfcmVzb3VyY2UoZCwgeG1hci50eXBlLCB4bWFyLmlkLCB4
bWFyLmZyYW1lLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4bWFyLm5y
X2ZyYW1lcywgbWZuX2xpc3QpOw0KPiArICAgICAgICByYyA9IC1FT1BOT1RTVVBQOw0KPiAgICAg
ICAgICBicmVhazsNCj4gICAgICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oDQo+IGluZGV4IGY4YmE0OWIuLjBi
N2RlMzEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgNCj4gQEAgLTM1OCwxNCArMzU4LDYgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHB1dF9wYWdlX2FuZF90eXBlKHN0cnVjdCBwYWdlX2luZm8NCj4gKnBhZ2UpDQo+
IA0KPiAgdm9pZCBjbGVhcl9hbmRfY2xlYW5fcGFnZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKTsN
Cj4gDQo+IC1zdGF0aWMgaW5saW5lDQo+IC1pbnQgYXJjaF9hY3F1aXJlX3Jlc291cmNlKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB0eXBlLCB1bnNpZ25lZCBpbnQgaWQsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnJhbWUsIHVuc2lnbmVkIGludCBu
cl9mcmFtZXMsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9wZm5fdCBtZm5fbGlz
dFtdKQ0KPiAtew0KPiAtICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gLX0NCj4gLQ0KPiAgdW5z
aWduZWQgaW50IGFyY2hfZ2V0X2RtYV9iaXRzaXplKHZvaWQpOw0KPiANCg0KVGhpcyBjaGFuZ2Ug
Y291bGQgbm90IGJlIGFwcGxpZWQgdG8gdGhlIGxhdGVzdCBzdGFnaW5nIGJyYW5jaC4NCg0KPiAg
I2VuZGlmIC8qICBfX0FSQ0hfQVJNX01NX18gKi8NCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaA0KPiBpbmRleCBkZWViYTc1
Li44NTkyMTRlIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgNCj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oDQo+IEBAIC02MzksOCArNjM5LDQgQEAgc3RhdGlj
IGlubGluZSBib29sIGFyY2hfbWZuX2luX2RpcmVjdG1hcCh1bnNpZ25lZCBsb25nDQo+IG1mbikN
Cj4gICAgICByZXR1cm4gbWZuIDw9ICh2aXJ0X3RvX21mbihldmEgLSAxKSArIDEpOw0KPiAgfQ0K
PiANCj4gLWludCBhcmNoX2FjcXVpcmVfcmVzb3VyY2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IHR5cGUsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBp
ZCwgdW5zaWduZWQgbG9uZyBmcmFtZSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IG5yX2ZyYW1lcywgeGVuX3Bmbl90IG1mbl9saXN0W10pOw0KPiAtDQo+ICAjZW5k
aWYgLyogX19BU01fWDg2X01NX0hfXyAqLw0KPiAtLQ0KPiAyLjcuNA0KPiANCg0K

