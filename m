Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA624E7563
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294812.501479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXlEh-0000Ro-SD; Fri, 25 Mar 2022 14:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294812.501479; Fri, 25 Mar 2022 14:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXlEh-0000Pp-P0; Fri, 25 Mar 2022 14:48:19 +0000
Received: by outflank-mailman (input) for mailman id 294812;
 Fri, 25 Mar 2022 14:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXlEg-0000Pj-QD
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:48:19 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe05::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b3287fd-ac4a-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 15:48:17 +0100 (CET)
Received: from AM7PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:20b:130::20)
 by VI1PR08MB4077.eurprd08.prod.outlook.com (2603:10a6:803:e0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 25 Mar
 2022 14:48:14 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::6b) by AM7PR03CA0010.outlook.office365.com
 (2603:10a6:20b:130::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 14:48:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 14:48:13 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 25 Mar 2022 14:48:13 +0000
Received: from 9a90ddfca9e3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2FCF7F24-C89C-4D46-BCB7-F363EDE459F1.1; 
 Fri, 25 Mar 2022 14:48:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a90ddfca9e3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 14:48:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB5885.eurprd08.prod.outlook.com (2603:10a6:102:e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 14:48:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:48:03 +0000
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
X-Inumbo-ID: 9b3287fd-ac4a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0U5h84ezaMZ6fuwF6LeDe+OV1NZEjkrjr9phZt8bWw=;
 b=WbiNsMWIf+YmrzwO1IZn8/bEjDIK0yz+soQvKXCr/dASpVcLgHMslVt0Csvbn2+n869+6iOiKkOvkQuapuyeJ16mb+ljnVv6BuoE5vCnC/AB1PJ+VTNEIul6J0mfRjumoCRQKnnrHqufg3XvMbr6tvXmbz6Dhp+in4ga3Bj+//E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99953b8a7dc6ee10
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E24VVJJ2NmwuChi83/nU+2hMwu/1FNMUJ+k2tggj1OEwwKo5paLJDzoPFiNZtzCyivAzrAUnVp+hITA+Zul9qobJHH2G48GorUXh1Min9vf3JwhTwZxLXHSFalu6uzBUfnDqM457X7QQQgSepsXT/r/rA7i22mXl13ePpj8Hh4q9AXVqR6zuhD5XAztXNyzx4S5Owdlkh2FefX7dU2L03jumitPr5H+A72TcEvJDVJ2EjV6jA6+2CTWoZk/r/trsZbIww9Vtcs+8BiIzJwqoGcY4xa8rh9cus5cuq6fiGJN0Jm+oZdQTdjHLbfJ073pmxreT81tUw/Y6wzCIwqn0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0U5h84ezaMZ6fuwF6LeDe+OV1NZEjkrjr9phZt8bWw=;
 b=Mht6IoOgHhvLq0q2H5swsye1HaQIIvxQCu7hUSedNjCV6pEW8TUVPii/VF6g8ufDNUutZKS1/citXqgACkvBUqsFLb1hsqJKXmsuWZXXLLdJ0UUhoRJrSaTAQFRIQ2UuITiWyzCBIaBRuv5Camw48/LcQPmkTDaia2SjPpqH/ITG29Sue4cOh2AXL16LyV+2XpzSx3coIUlEaw3ffUfjQNNjS2Mq2YgNtK2XtVZDdQZ8ELkXmz/Z70+lNSRNabe9NkttT4YtuWOcPkqG31U5TmSEL4RCkNYLvOlbvDfPip8DXS/CLj8wMM/G+8WNjPSe/Rgsm2B0ONM/efvSyawsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0U5h84ezaMZ6fuwF6LeDe+OV1NZEjkrjr9phZt8bWw=;
 b=WbiNsMWIf+YmrzwO1IZn8/bEjDIK0yz+soQvKXCr/dASpVcLgHMslVt0Csvbn2+n869+6iOiKkOvkQuapuyeJ16mb+ljnVv6BuoE5vCnC/AB1PJ+VTNEIul6J0mfRjumoCRQKnnrHqufg3XvMbr6tvXmbz6Dhp+in4ga3Bj+//E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Topic: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Index: AQHYM6fbReeSkSu3okSScrrMlkjRu6zQNoyAgAAKUgCAAAMDAIAAAf4AgAABeAA=
Date: Fri, 25 Mar 2022 14:48:03 +0000
Message-ID: <099CD8F1-C92A-4402-897F-538821AD66EE@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
 <9673f201-080b-8800-65a2-144d21b030fd@xen.org>
 <7069C935-A275-4D1A-80EF-C20DE1D3103C@arm.com>
 <284b300e-d400-4bd7-0b0e-aa53983d6ee8@xen.org>
In-Reply-To: <284b300e-d400-4bd7-0b0e-aa53983d6ee8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b1d634f0-e5b1-400c-266d-08da0e6e7d6d
x-ms-traffictypediagnostic:
	PA4PR08MB5885:EE_|AM5EUR03FT005:EE_|VI1PR08MB4077:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB407781B40540E1B80D3EC3FE9D1A9@VI1PR08MB4077.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gEdhE5g7JRHBqlKchbNQUKF7cQr28N+wjiQIivhAOw1tyxwMJ5ZCfZOA5c3K7rJrCKjTrm/alC+vwkIJOQdi+h8/miUO2bVsl4BXIwzfHaIhrBPJzeQvgDOowpO7vX7pQaE1XKQo5k0BqAhzFVWacn85zg6eDP58MpdqX97Dq4atnhE6PdJfm9eh7WutoadKfeIz6rS//NFCWPB6ctHXjPGb+SZem3279P8SEK/rMVQQLae0IUllNfiMIs5NGnkQwMd6YM9si0gqXZ59kvRPFHHJdAwV/NsqwXaT/2SyW6VCLBKCTnrocLk2+jlu9MFdw9/jfnwAsyUy5MS9UmbE27mSB88114dwnsLMeV7FsJLmlsHr+AtFaGZfXRLZ5saD6sDS4vjM4hGCDLxoHEzytRrtXWeu8TH8bS/QX4rj21f+N6HUmlAFBkYILffYOhTmzNH8BrZoQ7fjNDIYMXkMhtbFrALnjfmf9R35XQ4ah0oEZ8WHEUVFfmSrQLXu7exGCR4KZdm/HSM/Vi0aLo2d6qSi3abFc+aH9pRHLgiyF8B8Nl35Lpm6zYMQR0t/nhROCpn5zxupQ6vkRFpGR4kt5nab3wlh59peGEUyhFlLrIwDNq+6DQp/2qASPDCjdoaBA1xZVlnc/9J85naR7u7lNihM0vL+18vzeu3QoA531DG+35e/S50mx0gxz4pu8z93aDEk5gNFuf7Cifh806tP21T7QzC/V0aeFlszX01sKMIs9Bm7QSmoAzCiB0HQe9VX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(33656002)(4326008)(76116006)(122000001)(38100700002)(83380400001)(38070700005)(316002)(53546011)(6506007)(508600001)(71200400001)(6486002)(54906003)(2906002)(91956017)(6916009)(186003)(26005)(66556008)(64756008)(2616005)(66946007)(66446008)(8676002)(66476007)(5660300002)(8936002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5216C75BE4F36B45876079DF716B99AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5885
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c827b60-e693-40a8-a135-08da0e6e7749
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qov3VNGeAVkAot/otMyMQgX1lY/mQE4uNn+qkst0XOf3Ce9bd5JRM1u0bG49TJ+5TDH75twSIABVqnhddqholxIcjRJKtjE5qgq+8te1j7mt9M+27obuAZONfjiAaUpADrbTqgpFwmfTAlR++ScbzyTMDygKO+BqZwlLMjTf60VKoTo/qTfVad20phqUU9DsCZd7GGfQ9XfKP+cNuUeHLneWy13/RjnAcy7sRV+24LbNtEz/X0iUIm9NrG4eHU4AN3Jx6Cmtim7xb+y6xCHD3KDIhN5ClyzEeAYws4TbdBeAHFYeNOTWhiqbW6rYBtU3r9TnKBmjILzQ7bV16iiTAWTuPrSxOxTOx73sd8xov140zJq3zmCg0bX+usbjkl5yOIpZPAxXgg9UkNoitNhc4JooPjHCfSjc/ZoG4ADN89YykdxeRA47p2J+Mev8URim3C5b8j5+NdJGS0gQs1jAsVDMneatvPuVKAE3G5bE5FAyvdnp5E4x56DuA+CzgcvL/vfnYR5fRTNAer69LVEWNYx5M4518X9PFh95JlqE05NIYL/AApiOBBg2o1tLKnL/w75gHb4CGjXEvCoN2Vntpc3xOJHkr6Tv1tYbL0vEMud4tWXOilQzUemxirx2Py/dA1ZS/bHK9WRYH/WVAlhi9GeYgopB1X1J5pWvTLIJPOD3tI3vTffFNLXj4aKDFDpc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(186003)(2906002)(70206006)(336012)(53546011)(70586007)(36860700001)(6512007)(40460700003)(33656002)(4326008)(6506007)(54906003)(6862004)(47076005)(2616005)(8676002)(82310400004)(5660300002)(83380400001)(508600001)(26005)(8936002)(316002)(86362001)(356005)(6486002)(107886003)(81166007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:48:13.9218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d634f0-e5b1-400c-266d-08da0e6e7d6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4077

SGkgSnVsaWVuLA0KDQo+IE9uIDI1IE1hciAyMDIyLCBhdCAxNTo0MiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDI1LzAz
LzIwMjIgMTQ6MzUsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMjUgTWFyIDIwMjIs
IGF0IDE1OjI0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiBPbiAy
NS8wMy8yMDIyIDEzOjQ3LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBIaSBKdWxpZW4s
DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4+PiBPbiA5IE1hciAyMDIyLCBhdCAx
MjoyMCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+
IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4+PiANCj4+Pj4+IEF0
IHRoZSBtb21lbnQsIHN3aXRjaF90dGJyKCkgaXMgc3dpdGNoaW5nIHRoZSBUVEJSIHdoaWxzdCB0
aGUgTU1VIGlzDQo+Pj4+PiBzdGlsbCBvbi4NCj4+Pj4+IA0KPj4+Pj4gU3dpdGNoaW5nIFRUQlIg
aXMgbGlrZSByZXBsYWNpbmcgZXhpc3RpbmcgbWFwcGluZ3Mgd2l0aCBuZXcgb25lcy4gU28NCj4+
Pj4+IHdlIG5lZWQgdG8gZm9sbG93IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4NCj4+
Pj4+IA0KPj4+Pj4gSW4gdGhpcyBjYXNlLCBpdCBtZWFucyB0aGUgTU1VIG5lZWRzIHRvIGJlIHN3
aXRjaGVkIG9mZiB3aGlsZSB0aGUNCj4+Pj4+IFRUQlIgaXMgdXBkYXRlZC4gSW4gb3JkZXIgdG8g
ZGlzYWJsZSB0aGUgTU1VLCB3ZSBuZWVkIHRvIGZpcnN0DQo+Pj4+PiBqdW1wIHRvIGFuIGlkZW50
aXR5IG1hcHBpbmcuDQo+Pj4+PiANCj4+Pj4+IFJlbmFtZSBzd2l0Y2hfdHRicigpIHRvIHN3aXRj
aF90dGJyX2lkKCkgYW5kIGNyZWF0ZSBhbiBoZWxwZXIgb24NCj4+Pj4+IHRvcCB0byB0ZW1wb3Jh
cnkgbWFwIHRoZSBpZGVudGl0eSBtYXBwaW5nIGFuZCBjYWxsIHN3aXRjaF90dGJyKCkNCj4+Pj4+
IHZpYSB0aGUgaWRlbnRpdHkgYWRkcmVzcy4NCj4+Pj4+IA0KPj4+Pj4gc3dpdGNoX3R0YnJfaWQo
KSBpcyBub3cgcmV3b3JrZWQgdG8gdGVtcG9yYXJpbHkgdHVybiBvZmYgdGhlIE1NVQ0KPj4+Pj4g
YmVmb3JlIHVwZGF0aW5nIHRoZSBUVEJSLg0KPj4+Pj4gDQo+Pj4+PiBXZSBhbHNvIG5lZWQgdG8g
bWFrZSBzdXJlIHRoZSBoZWxwZXIgc3dpdGNoX3R0YnIoKSBpcyBwYXJ0IG9mIHRoZQ0KPj4+Pj4g
aWRlbnRpdHkgbWFwcGluZy4gU28gbW92ZSBfZW5kX2Jvb3QgcGFzdCBpdC4NCj4+Pj4+IA0KPj4+
Pj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gaW5zdHJ1Y3Rpb24gY2FjaGUgZmx1c2ggYXMgdGhl
IG9wZXJhdGlvbiBpcw0KPj4+Pj4gb25seSBuZWNlc3Nhcnkgd2hlbiB0aGUgbWVtb3J5IGlzIHVw
ZGF0ZWQuDQo+Pj4+IFlvdXIgY29kZSBpcyBhY3R1YWxseSByZW1vdmUgdGhlIGluc3RydWN0aW9u
IGNhY2hlIGludmFsaWRhdGlvbiBzbw0KPj4+PiB0aGlzIHNlbnRlbmNlIGlzIGEgYml0IG1pc2xl
YWRpbmcuDQo+Pj4gDQo+Pj4gSSBmb3Jnb3QgdG8gYWRkIHRoZSB3b3JkICJyZW1vdmUiIGluIHRo
ZSBzZW50ZW5jZS4NCj4+IE9rIChteSBzZW50ZW5jZSB3YXMgYWxzbyB3cm9uZyBieSB0aGUgd2F5
KQ0KPj4+IA0KPj4+PiBBbHNvIGFuIG9wZW4gcXVlc3Rpb246IHNob3VsZG7igJl0IHdlIGZsdXNo
IHRoZSBkYXRhIGNhY2hlID8NCj4+PiBEbyB5b3UgbWVhbiBjbGVhbi9pbnZhbGlkYXRlIHRvIFBv
Qy9Qb1U/IFNvbWV0aGluZyBlbHNlPw0KPj4gWWVzLCBwcm9iYWJseSB0byBQb1UuDQo+Pj4gDQo+
Pj4+IEFzIHdlIHN3aXRjaCBmcm9tIG9uZSBUVEJSIHRvIGFuIG90aGVyLCB0aGVyZSBtaWdodCBi
ZSBzb21lIGRhdGENCj4+Pj4gaW4gdGhlIGNhY2hlIGRlcGVuZGVudCB0aGF0IGNvdWxkIGJlIGZs
dXNoZWQgd2hpbGUgdGhlIE1NVSBpcyBvZmYNCj4+PiANCj4+PiBJIGFtIGEgYml0IGNvbmZ1c2Vk
LiBUaG9zZSBmbHVzaCBjb3VsZCBhbHNvIGhhcHBlbiB3aXRoIHRoZSBNTVUgb24uIFNvIGhvdyB0
dXJuaW5nIG9mZiB0aGUgTU1VIHdvdWxkIHJlc3VsdCB0byBhIHByb2JsZW0/IE5vdGUgdGhhdCB0
aGUgZGF0YSBjYWNoZSBpcyBzdGlsbCBlbmFibGVkIGR1cmluZyB0aGUgc3dpdGNoLg0KPj4gSWYg
dGhlIGZpcnN0IGxldmVsIG9mIGNhY2hlIGlzIFZJUFQgYW5kIHdlIHR1cm4gb2ZmIHRoZSBNTVUs
IEkgYW0gd29uZGVyaW5nIGlmIHRoaXMgY291bGQgbm90IGNyZWF0ZSB0cm91YmxlcyBhbmQgY291
bGQgcmVxdWlyZSB0aGUgY2FjaGUgdG8gYmUgZmx1c2hlZCBiZWZvcmUgdHVybmluZyB0aGUgTU1V
IG9mZi4NCj4gTXkgcmVhZGluZyBvZiB0aGUgQXJtIEFybSAoRDUuMTEuMSAiRGF0YSBhbmQgdW5p
ZmllZCBjYWNoZXMiIEFSTSBEREkgMDQ4N0YuYykgc3VnZ2VzdHMgdGhlIGRhdGEgY2FjaGUgaXMg
YWx3YXlzIFBJUFQuDQoNCllvdSBhcmUgcmlnaHQsIG9ubHkgdGhlIGluc3RydWN0aW9uIGNhY2hl
IGlzIFZJUFQuDQpTbyB0aGUgcHJvYmxlbSBtb3N0IHByb2JhYmx5IGRvZXMgbm90IGV4aXN0Lg0K
DQo+IA0KPj4gSSBoYXZlIG5vIGlkZWEgaWYgdGhpcyBpcyBhIHByb2JsZW0gb3Igbm90LCBqdXN0
IHJhaXNpbmcgdGhlIHF1ZXN0aW9uLg0KPj4gSSBjYW4gdHJ5IHRvIGRpZyBvbiB0aGF0IGF0IEFy
bSB3aGVuIEkgYW0gYmFjayBpbiAxMCBkYXlzLg0KPiANCj4gRW5qb3kgaXQhDQoNClRoYW5rcw0K
QmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

