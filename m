Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08D3D6F3E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 08:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161046.295703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8GR0-0000Dn-KG; Tue, 27 Jul 2021 06:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161046.295703; Tue, 27 Jul 2021 06:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8GR0-0000Bw-Fk; Tue, 27 Jul 2021 06:19:22 +0000
Received: by outflank-mailman (input) for mailman id 161046;
 Tue, 27 Jul 2021 06:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=99OC=MT=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8GQz-0000Bq-Oh
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 06:19:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e08610-eea2-11eb-96d3-12813bfff9fa;
 Tue, 27 Jul 2021 06:19:17 +0000 (UTC)
Received: from AM6P194CA0030.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::43)
 by DB8PR08MB3962.eurprd08.prod.outlook.com (2603:10a6:10:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Tue, 27 Jul
 2021 06:19:14 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::ec) by AM6P194CA0030.outlook.office365.com
 (2603:10a6:209:90::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Tue, 27 Jul 2021 06:19:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 06:19:13 +0000
Received: ("Tessian outbound 4c02392472aa:v100");
 Tue, 27 Jul 2021 06:19:13 +0000
Received: from a79d77c52026.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93191F27-BD72-42F6-89B7-FA40ACED4A9D.1; 
 Tue, 27 Jul 2021 06:19:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a79d77c52026.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Jul 2021 06:19:03 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3422.eurprd08.prod.outlook.com (2603:10a6:803:7d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 06:18:59 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 06:18:59 +0000
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
X-Inumbo-ID: 91e08610-eea2-11eb-96d3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aVk0L9Lc99ISAQL2D8AVYd8QOafm2utpuw65UXPqLA=;
 b=UVaO3bWht2KyixN8gWZ46zQNkFlr8Ww3VgvcyoaerYd3/pQbRzV7iunqVIAdVqs0YFYX3meuFWbxHHqd7wDcty0eFDZCZ7RXmb2AskXBQQPLu3E3SswipIDM/PA8SDraACMaX0L7ErQ+g061H9PaR407rJTC1aTsBttPy8rWoKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJMhaehwztxdTS9I5Up4V3+GckLZKGJa41qGlbbPQo4e3eIEH/rWMsjMdOF78RVRlisDN9+A6Kwkkzme0kCgcb9vPohNzVLPnNyttv1e3rohXyYfftwvbsuMjEt7xzs8JC+XMK8NJ+D2RnZIzU8n51FQ0i+esyszUT/SzCKCuab/Mf2tid18hyR2Easziy2jRY3S/qA+8armyiIlQ6PRT9HHquWGyHpnVBrAc1pHWBUOBTx9DPBmD30G/JYNm9+sDhf1kAUMG/9kulmEIP11wB+RFvEvPpwwDuXW0HaJP/FU+WNsjJDb7xhF53Ef3WO8OH5g37XOmtXBJZ9z6d1KwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aVk0L9Lc99ISAQL2D8AVYd8QOafm2utpuw65UXPqLA=;
 b=RGwX+aTeK1RXGZmWH9mJOUx00SoH+iqBtwSoG6eZPn7VRr7j4XDkQorpeErAmQFdr/9W3UbmadbUI0hR80gm8Dr3eJ9klN0i0lnXYNRnouM/ql2x/DuPr/H1M6+i+PgUNic6Qf4OQnKxmyLUhf0Xo1Q1/2JSgiiEzPQuiu0hBITdXzwQDUn9qLEd0R8W1tGeQLOEqzKJJbkwrVJ5weZdeMBF0GSd5PUr6aeShv2IktizfJWmtfPVp4ee5nYmLvTLH2FJnLvcCUhqCqI/c+/+g+pjKSvD4wT7h8/DpplY4QA7J8Lq47h+UV506yS5TOWsTqTCMsciT5Yv5Jy4DmVjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aVk0L9Lc99ISAQL2D8AVYd8QOafm2utpuw65UXPqLA=;
 b=UVaO3bWht2KyixN8gWZ46zQNkFlr8Ww3VgvcyoaerYd3/pQbRzV7iunqVIAdVqs0YFYX3meuFWbxHHqd7wDcty0eFDZCZ7RXmb2AskXBQQPLu3E3SswipIDM/PA8SDraACMaX0L7ErQ+g061H9PaR407rJTC1aTsBttPy8rWoKo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: "julien@xen.org" <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
Thread-Topic: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
Thread-Index: AQHXeTjsii93P3Jir0yV0AuWxQR1FqtWPVlQgAAeEYA=
Date: Tue, 27 Jul 2021 06:18:59 +0000
Message-ID:
 <VE1PR08MB521549D59EE56EFA23DBAB2FF7E99@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-11-penny.zheng@arm.com>
 <VE1PR08MB52153A258DE5E33D11C337CDF7E99@VE1PR08MB5215.eurprd08.prod.outlook.com>
In-Reply-To:
 <VE1PR08MB52153A258DE5E33D11C337CDF7E99@VE1PR08MB5215.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9FC8154142504D47A155487BAA58C24E.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eaf06644-ef24-456e-cd30-08d950c674aa
x-ms-traffictypediagnostic: VI1PR08MB3422:|DB8PR08MB3962:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB39629CBD14C9CB3EA28E7678F7E99@DB8PR08MB3962.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 b21KsCj9LA4Bbpps+lSviW32iVgs18VWbyGrqHFW5sxe8TUHubUwdZlSNMFLstPnO5XtS/jx1HYoWb/j5Eex16RqH+fliOwlLEZgXunKiitT5W/kOUgW8R8tVyEZbx0tvSTpSpNYn8obdTTUHoO/+aW6/1IMWbetwsluPMAy0se2S2EApN2Y9LfKL8mumwD8iWutsN7ESmSt5ZI2hjxxdS2NnB5w2DLWPxjTPZGo2stGwPpOweBFRUBLpMEX2uERN4rhBcAkilG/DeAm3Y6ZWnH1efvq3z/ilkARmhrXw8tynfWtheRNzM2EVaVkXe5LEPdW/IC+Q5tYYsOeFK6OM5MsA63O7tSMcDjqoTRPNDZiaYjqQGO2lsIBIPtKZBV4AsNZjeqFDToGQBkMsZGpaLfqJIn5XInqMnv4lxR7+B4+yS+I70D5fI4ko5b5Bnk3EMbyNEGKS1SrDtdcF8Sw9dR56Wzvx/aOyML0BJ6WEuH0iccg0/5nVMePmfg4wSwhT6zwufyFn1ZbDTV9nOxrN0o2m1nB6FfuLETnbjvqj/YhD4gwKWeYifx+PY9jtKrQLt4a8/t1LwrZYNL9FNT9tzEOWY8gQ2V96hr+3kJVze2T8YHwA5SM2ZPbJEEPzxFFcbFlbiLShKOa1e1OovAGwQNhBJS0RJLUY9roF0W34jiJ+bTiqrnJBepGuyjwUeLtEtF2TNM32mAw3DvnPYU+fQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(71200400001)(64756008)(316002)(66476007)(4326008)(86362001)(6506007)(478600001)(8676002)(8936002)(33656002)(9686003)(5660300002)(53546011)(54906003)(83380400001)(26005)(76116006)(2906002)(55016002)(7696005)(66446008)(66946007)(122000001)(6916009)(2940100002)(186003)(52536014)(38100700002)(66556008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FQRkCe17uq4F61jzhvF92X+5i6eULVXTpKBWiql7zcggOIY+crC2PnGi0QMB?=
 =?us-ascii?Q?VA8SBCGIQEJQpPbXIyESSHA3Kyyo3QI2ZcCb67jVeNTgK2tBFI7MuhLiW65S?=
 =?us-ascii?Q?BIb/O4xwQIcNxkMYvNfXuMIQZC6NNmik9AGIVLxnLR8HTSC91ZyShQxGVmfk?=
 =?us-ascii?Q?Ew7FbzdB0J3R2ccd4ekiNIMyWnNKMlkC/UO2PIA1NHk/Ogdoth7ZuXY8i44S?=
 =?us-ascii?Q?n1hhKQJNW4Lr1HoOu71Q8LtcIpOy/E0B9COBGPS7wHncyXZwQ5cfEID0j+pl?=
 =?us-ascii?Q?umZ4C9s9UZd/Td02KIB6+XONxkGDAKQPZJKdIMx6Wec/gUMnEZPXd6i76RGQ?=
 =?us-ascii?Q?0MbGcn4e99dX2WE2LlwzvfRpgJ1LRg4wHRO4vRcKObj6H1qMzzeUS5hjy+dd?=
 =?us-ascii?Q?A8ZNv5j62AKqg77PD8aY/9783poZoZSJYyyHRDzefjK0WjB6MKihcUVXuJzZ?=
 =?us-ascii?Q?TEVWQ/54MZRT6eC0ptGB5fUiyvqJnr4nEIIiqj3WtLjtBQFH8HzgDXQv5ZLs?=
 =?us-ascii?Q?1W7r/DjMNhrTXvPdxnXSADLam9+wtrpD4o3gnYnm1HV+S1SYj0IH4nFUnPNL?=
 =?us-ascii?Q?47I2Xzhz/hh4sbNC6ggUM5xYe68WCrhH3tHJ3I4p5+bR09z80QGJFQYby6Dj?=
 =?us-ascii?Q?26Tf4HnGYMeHpTJVF3oZ/xoIBO3QpmiHlhFGf2jR41GmhX8JcHJvvo2qB7a4?=
 =?us-ascii?Q?tOOUB6IwvscGpm09H+ecnE9I4Pfa8qsOOTcyA1t26NfaKyWLTvGAml9U3ec/?=
 =?us-ascii?Q?sZZL/e755MIHz80fE3FkwswZGV9jmhddQ/StIY542D8gXNQWLWMCoKRPu4ix?=
 =?us-ascii?Q?KF7NMRO+mHfOqwAQX8sIL6ZGm9xmM1rNJK5aUq5aaaSklzPSKmZmjB8i7qhV?=
 =?us-ascii?Q?fCt6cG7S37DhTLqNyt3JEPfevbixyr/glb091reCHPHjBafqRE6Yqe2VDhOx?=
 =?us-ascii?Q?yPKy3ABncpYcnkd4d97NqM8LpYlImQifi/t+EcExZitaa32Z7Rebp9WOXdYR?=
 =?us-ascii?Q?20cdIItCrEt4uw7hxxL+mZGcL9hLeqUp2nMyxEIvqkFTWA/2CDfnGGy0Hv3p?=
 =?us-ascii?Q?6k+vsmPA8T8PAg9vZVQZvzWWm4z9Pl1NJDivr/55s6RBaAorhYv57zOVfCck?=
 =?us-ascii?Q?RFfB5NFrounzguXTIiTjzdTXBukYpcxGi3/tFwrODT8kD+5c3UJvfCpQSwKZ?=
 =?us-ascii?Q?PsBHO/uXvV+oNPAo+NjkjbtyMcXvY3v5U+2q4ZNOwDGxh44+axcR/E5zyB6d?=
 =?us-ascii?Q?QiiMCe3B0jDQ3HgviGcDUR/oGlyl69/kSU4Lv1ChM2twbDLSj6Tl0XDNvzhL?=
 =?us-ascii?Q?2vb3U6YnQ51k/xRhQ0rdXtZx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3422
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba2c7988-0888-4c6c-6c3c-08d950c66bf4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U73Yntpn9pzs+Oc9hnQWt4LVWmEsrCaCCUhag05lttZ/OqSwZaRWTba10stBtO0xqNPC2Rw9inIRWAn2TYDVtAds5N/Uw/91Dr8GzSTiOO9tsiz59SICCQvWiN1QmiLKlg7mFjG31r4QVDcc8dlSz1Z7JxigvjmwOj6P8LT1E1Syq/rH7yWYFIzZ9tVKUI5ZvwIJzX1GYqqMmnPYcI3TTnYXkuB8BYDKVdN2tToOsAzZbcJbZPRiw5hT/v8eyL140ikXpGc7cYTUyFU5HaCVyT1zZ4D1rwOwI7TtBPHsXk9vpY24+gwg2rmopru4n+LoBGxpu8mH2b9uyRRjd9rDtJoyIfd0WJe3ZdZQR1S9/VORv49WMy6R2Hr/VFue3iEi/XvknScohelJAULrsH6ImkJOhN3bDciwTzkSDByeRGidG4lXqdyfKC14wyoBn6ujrT+ciUhfs/3AlmaRD5cdefq12Toz/+4D2BKXzg764E3obd3h8K3aJTAcFHkGW7hFx1eUSBaIhqGF/7uiu48NxtFw5l4AkR7H0KtReZrfB/OQbZpd+xsSQ1ZABXyzRs1foe8yCCG/B3ew4DX4H3Eu0+J2o3PtpCGQego5S9fKxIyT9/3XaBZOiI0d3ABXvG0JIxkFAjpQVTQBAfepvQDtJmMQsNFabPoXwaIn2hb+PpNHYbErwevT3CaFvWX97BmDsVqrzwEzebq9rK1INCSqY85YKAZrg2LZFTnJHIOuYZU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(39840400004)(136003)(346002)(376002)(36840700001)(46966006)(83380400001)(33656002)(82310400003)(5660300002)(8936002)(8676002)(52536014)(107886003)(70586007)(336012)(6862004)(2906002)(70206006)(4326008)(186003)(53546011)(6506007)(9686003)(478600001)(86362001)(316002)(54906003)(81166007)(55016002)(26005)(356005)(7696005)(36860700001)(47076005)(2940100002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 06:19:13.9973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf06644-ef24-456e-cd30-08d950c674aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3962

Hi Julien=20

> -----Original Message-----
> From: Penny Zheng
> Sent: Tuesday, July 27, 2021 11:45 AM
> To: julien@xen.org
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
> <Wei.Chen@arm.com>; jbeulich@suse.com; xen-devel@lists.xenproject.org;
> sstabellini@kernel.org
> Subject: RE: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
>=20
> Hi Julien
>=20
> > -----Original Message-----
> > From: Penny Zheng <penny.zheng@arm.com>
> > Sent: Thursday, July 15, 2021 1:18 PM
> > To: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > julien@xen.org
> > Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Penny Zheng
> > <Penny.Zheng@arm.com>; Wei Chen <Wei.Chen@arm.com>;
> jbeulich@suse.com;
> > nd <nd@arm.com>
> > Subject: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
> >
> > This commit introduces allocate_static_memory to allocate static
> > memory as guest RAM for Domain on Static Allocation.
> >
> > It uses acquire_domstatic_pages to acquire pre-configured static
> > memory for this domain, and uses guest_physmap_add_page to set up P2M
> table.
> > These pre-defined static memory banks shall be firstly mapped to the
> > fixed guest RAM address `GUEST_RAM0_BASE`. And until it exhausts the
> > `GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`, and so on.
> > `GUEST_RAM0` may take up several pre-defined physical RAM regions.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> > v3 changes:
> > - parse "xen,static-mem" in way of phandle back to property.
> > - use unsigned int for index
> > - rename allocate_static_bank_memory to append_static_memory_to_bank
> > - infer the next GFN from the bank information
> > - simplify the code in double loop.
> > ---
> >  xen/arch/arm/domain_build.c | 137
> > +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 135 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index cdb16f2086..ed290ee31b 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -480,6 +480,139 @@ fail:
> >            (unsigned long)kinfo->unassigned_mem >> 10);  }
> >
> > +static bool __init append_static_memory_to_bank(struct domain *d,
> > +                                                struct membank *bank,
> > +                                                mfn_t smfn,
> > +                                                paddr_t size) {
> > +    int res;
> > +    paddr_t tot_size =3D size;
> > +    /* Infer next GFN. */
> > +    gfn_t sgfn =3D gaddr_to_gfn(bank->start + bank->size);
> > +
> > +    while ( tot_size > 0 )
> > +    {
> > +        unsigned int order =3D get_allocation_size(tot_size);
> > +
> > +        res =3D guest_physmap_add_page(d, sgfn, smfn, order);
>=20
> When constructing Patch v4, and second thought on this commit:
>=20
> Do you think that here we shall define a new function
> guest_physmap_add_pages for adding nr pages p2m mapping, just like what
> we did for assign_pages(...).
>=20
> Since right now guest_physmap_add_page is also limited to taking care of
> page with a single order, We had trouble of count-to-order conversion whe=
n
> page number is not in a power-of-two here too.

Extra info on second thought:

If doing above changes, draft diff is as follows.=20

Interface of guest_physmap_add_entry is also needing changes, parameter
from "unsigned long page_order " to "unsigned long nr_pages".=20
From the point view of ARM, page_order is always taken as 1 << page_order, =
so
IMO the transfer is seamless.

However, to be compatible, we shared the same interface "guest_physmap_add_=
entry" with x86,
sharing the same name and parameters but with different implementation.

Even now, we didn't using this interface on any common codes, so we could k=
eep
above changes only on ARM. But it definitely is a hidden trouble in the fut=
ure...

So hmmmm, Wdyt?=20

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index d414c4feb9..07c9f73809 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1376,10 +1376,10 @@ int map_dev_mmio_region(struct domain *d,
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
-                            unsigned long page_order,
+                            unsigned long nr_pages,
                             p2m_type_t t)
 {
-    return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
+    return p2m_insert_mapping(d, gfn, nr_pages, mfn, t);
 }

 int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,

diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 4f8b3b0ec7..a869639fb7 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -301,7 +301,7 @@ int map_dev_mmio_region(struct domain *d,
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
-                            unsigned long page_order,
+                            unsigned long nr_pages,
                             p2m_type_t t);

 /* Untyped version for RAM only, for compatibility */
@@ -310,7 +310,15 @@ static inline int guest_physmap_add_page(struct domain=
 *d,
                                          mfn_t mfn,
                                          unsigned int page_order)
 {
-    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
+    return guest_physmap_add_entry(d, gfn, mfn, (1UL << page_order), p2m_r=
am_rw);
+}
+
+static inline int guest_physmap_add_pages(struct domain *d,
+                                          gfn_t gfn,
+                                          mfn_t mfn,
+                                          unsigned long nr_pages)
+{
+    return guest_physmap_add_entry(d, gfn, mfn, nr_pages, p2m_ram_rw);
 }

 mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);


> > +        if ( res )
> > +        {
> > +            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> > +            return false;
> > +        }
> > +
> > +        smfn =3D mfn_add(smfn, 1UL << order);
> > +        tot_size -=3D (1UL << (PAGE_SHIFT + order));
> > +    }
> > +
> > +    bank->size =3D bank->size + size;
> > +    return true;
> > +}
> > +
> > +/* Allocate memory from static memory as RAM for one specific domain d=
.
> > +*/ static void __init allocate_static_memory(struct domain *d,
> > +                                          struct kernel_info *kinfo,
> > +                                          const struct dt_property *pr=
op,
> > +                                          u32 addr_cells, u32
> > +size_cells) {
> > +    unsigned int nr_banks, gbank, bank =3D 0;
> > +    const uint64_t rambase[] =3D GUEST_RAM_BANK_BASES;
> > +    const uint64_t ramsize[] =3D GUEST_RAM_BANK_SIZES;
> > +    const __be32 *cell;
> > +    u32 reg_cells =3D addr_cells + size_cells;
> > +    u64 tot_size =3D 0;
> > +    paddr_t pbase, psize, gsize;
> > +    mfn_t smfn;
> > +
> > +    /* Start with GUEST_RAM0. */
> > +    kinfo->mem.nr_banks =3D 0;
> > +    gbank =3D 0;
> > +    gsize =3D ramsize[gbank];
> > +    kinfo->mem.bank[gbank].start =3D rambase[gbank];
> > +
> > +    cell =3D (const __be32 *)prop->value;
> > +    nr_banks =3D (prop->length) / (reg_cells * sizeof (u32));
> > +    BUG_ON(nr_banks > NR_MEM_BANKS);
> > +
> > +    while ( bank < nr_banks )
> > +    {
> > +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &ps=
ize);
> > +        tot_size +=3D psize;
> > +        smfn =3D maddr_to_mfn(pbase);
> > +
> > +        if ( !acquire_domstatic_pages(d, psize >> PAGE_SHIFT, smfn, 0)=
 )
> > +        {
> > +            printk(XENLOG_ERR
> > +                    "%pd: cannot acquire static memory "
> > +                    "(0x%"PRIpaddr" - 0x%"PRIpaddr").\n",
> > +                    d, pbase, pbase + psize);
> > +            goto fail;
> > +        }
> > +
> > +        printk(XENLOG_INFO "%pd: STATIC BANK[%d] %#"PRIpaddr"-
> > %#"PRIpaddr"\n",
> > +               d, bank, pbase, pbase + psize);
> > +
> > +        /*
> > +         * It shall be mapped to the fixed guest RAM address rambase[i=
],
> > +         * And until it exhausts the ramsize[i], it will seek to the n=
ext
> > +         * rambase[i+1].
> > +         */
> > +        while ( 1 )
> > +        {
> > +            /*
> > +             * The current physical bank is fully mapped.
> > +             * Handle the next physical bank.
> > +             */
> > +            if ( gsize >=3D psize )
> > +            {
> > +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank=
[gbank],
> > +                                                   smfn, psize) )
> > +                    goto fail;
> > +
> > +                gsize =3D gsize - psize;
> > +                bank++;
> > +                break;
> > +            }
> > +            /*
> > +             * Current guest bank memory is not enough to map.
> > +             * Check if we have another guest bank available.
> > +             * gbank refers guest memory bank index.
> > +             */
> > +            else if ( (gbank + 2) > GUEST_RAM_BANKS ) {
> > +                printk("Exhausted the number of guest bank\n");
> > +                goto fail;
> > +            }
> > +            else
> > +            {
> > +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank=
[gbank],
> > +                                                   smfn, gsize) )
> > +                    goto fail;
> > +
> > +                psize =3D psize - gsize;
> > +                smfn =3D mfn_add(smfn, gsize >> PAGE_SHIFT);
> > +                /* Update to the next guest bank. */
> > +                gbank++;
> > +                gsize =3D ramsize[gbank];
> > +                kinfo->mem.bank[gbank].start =3D rambase[gbank];
> > +            }
> > +        }
> > +    }
> > +
> > +    kinfo->mem.nr_banks =3D ++gbank;
> > +    kinfo->unassigned_mem -=3D tot_size;
> > +    if ( kinfo->unassigned_mem )
> > +        printk(XENLOG_ERR
> > +               "Size of \"memory\" property doesn't match up with the =
ones "
> > +               "defined in \"xen,static-mem\".\n");
> > +
> > +    return;
> > +
> > +fail:
> > +    panic("Failed to allocate requested static memory for domain %pd."
> > +          "Fix the VMs configurations.\n",
> > +          d);
> > +}
> > +
> >  static int __init write_properties(struct domain *d, struct kernel_inf=
o *kinfo,
> >                                     const struct dt_device_node *node)
> > { @@ -2486,8 +2619,8 @@ static int __init construct_domU(struct domain
> *d,
> >      if ( !static_mem )
> >          allocate_memory(d, &kinfo);
> >      else
> > -        /* TODO: allocate_static_memory(...). */
> > -        BUG();
> > +        allocate_static_memory(d, &kinfo, static_mem_prop,
> > +                               static_mem_addr_cells,
> > + static_mem_size_cells);
> >
> >      rc =3D prepare_dtb_domU(d, &kinfo);
> >      if ( rc < 0 )
> > --
> > 2.25.1
>=20
> A lot thanks
>=20
> Penny


