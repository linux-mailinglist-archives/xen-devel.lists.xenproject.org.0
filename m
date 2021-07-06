Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C523BDA19
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151479.279957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mvB-0007kK-QH; Tue, 06 Jul 2021 15:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151479.279957; Tue, 06 Jul 2021 15:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mvB-0007i8-MZ; Tue, 06 Jul 2021 15:23:37 +0000
Received: by outflank-mailman (input) for mailman id 151479;
 Tue, 06 Jul 2021 15:23:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0mvA-0007hw-LU
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:23:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8de371d-b492-4106-b064-0844d0919d40;
 Tue, 06 Jul 2021 15:23:35 +0000 (UTC)
Received: from FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::22)
 by DB9PR08MB7006.eurprd08.prod.outlook.com (2603:10a6:10:2c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 15:23:33 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::bc) by FR0P281CA0017.outlook.office365.com
 (2603:10a6:d10:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.7 via Frontend
 Transport; Tue, 6 Jul 2021 15:23:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 15:23:33 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Tue, 06 Jul 2021 15:23:32 +0000
Received: from 1fbf0dfafa09.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC29904B-CA63-4215-9595-E0D424C5B692.1; 
 Tue, 06 Jul 2021 15:23:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1fbf0dfafa09.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 15:23:19 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6687.eurprd08.prod.outlook.com (2603:10a6:102:132::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 15:23:10 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 15:23:08 +0000
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
X-Inumbo-ID: a8de371d-b492-4106-b064-0844d0919d40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdknrmO3W6/FX1t7jM2xHJ335gusEdFvtrfK6EXxgAE=;
 b=gTbAAAq4YhI4j2Q0ZT062iueddReiVT/KwlRY65xoNft7NPFzJi4rsPnxawpHCX7OMSb9pqrcEI9ahvE6HOQgSZOpdQ8AUoIaxxTKMHhueTPiiL1LnyuL5ymMYlRj8A6oh75CKSOgA3NIOHDz1Y9iku26V5Y8z82pAYNBzERwcA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7e65a023876d9a4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rqzhun0lfP0lpXtYFKuKrvt7J/WFg6CRGgWHg4msxaJsA3hCxtq61A/5nVZuJWtZMsrBBFsYgNNJ2vhMD0g+yyDWPZz2w/wHAk+c0H42/imxWO/j4AtZsML8GiuOG2NW/TuOGr6svfcVbRct0h0bzpdlTf5WqEG2yxxBXf4ddTigqF7PAaRhpTcMG4wUGqZJlo5O1ld85cWBPoJ5W875pOHQs10Mbds4DgPvZeylGaMEuQovsIAK6TRcyW6OX51eMtMIz6bI9OK2eaq3c20SUjE8EjMYICNMfyN0PD5SElMjoxU4xdf+EvyK0yrNvh+hLtpXu/mvtalDNBS2t+gBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdknrmO3W6/FX1t7jM2xHJ335gusEdFvtrfK6EXxgAE=;
 b=UPy6vGl1dKCTlgyVOcS98ocPaz8i974dJihYFKXVDnoIe/i/XGwgQpuamdWxLGi3esTKqJz5lgBLwnrJkxX1SPCLVph2u4OzZEAqgXPIye2xd0hCjGdv7tMsEybPcJAaAfmAwvGx67UpEBdOk/rFGLSPgTTIo+FyqrMPmTNwIUk3jnbTxArfa1Oq8WmXCEhzVIA+kqknXnAOvSVW4H4JBffebEBGf3b/DWoAPntcSZ1sO7nNyWclM2nWar2zJTeDTqkFwtdhG0ffHtYqtQbz7rjk+0Gk/FfsVrLvzT11N9+i6ZtGCdvHsLC9b6KuHBTnilaatR0YMqEO6bugCjcGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdknrmO3W6/FX1t7jM2xHJ335gusEdFvtrfK6EXxgAE=;
 b=gTbAAAq4YhI4j2Q0ZT062iueddReiVT/KwlRY65xoNft7NPFzJi4rsPnxawpHCX7OMSb9pqrcEI9ahvE6HOQgSZOpdQ8AUoIaxxTKMHhueTPiiL1LnyuL5ymMYlRj8A6oh75CKSOgA3NIOHDz1Y9iku26V5Y8z82pAYNBzERwcA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "jgrall@amazon.com"
	<jgrall@amazon.com>, Michal Orzel <Michal.Orzel@arm.com>, "olaf@aepfle.de"
	<olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] tools: Fix CPSR/SPSR print size
Thread-Topic: [PATCH] tools: Fix CPSR/SPSR print size
Thread-Index: AQHXcnkI0yrA0BW0E067MCMRzZDicKs2DqIAgAACDoA=
Date: Tue, 6 Jul 2021 15:23:08 +0000
Message-ID: <E8C7437D-575A-493F-B45E-570F2F23997A@arm.com>
References:
 <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
 <d79b4ff3-cc61-a1a7-ed5d-e0ea627bbab8@xen.org>
In-Reply-To: <d79b4ff3-cc61-a1a7-ed5d-e0ea627bbab8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ad33b26a-e32a-4a15-310d-08d940920484
x-ms-traffictypediagnostic: PAXPR08MB6687:|DB9PR08MB7006:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB700613E4AE5A710C798E088B9D1B9@DB9PR08MB7006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UBd1EmMrXK9em3Led0uLd+L7bn5U0TPpC5oN8EtAfU1ovvCA79sYFyLynNiez6YbgBWFSZt+vv9nVJSWMtIF3K9FWh3RY5cbd6SJG51N2sP93iu6DXESSjEs5AtLVGEQQdGllcOuzvMqc0GxXbpjSqDse/3N2+X5YjC4JYAekmE6D/WHk+ChKAswKLGn7wMxdjAxmLg7W3La7ImMONvxFFLmc1MFZFLg7xjPBZdwq+X0ONpErZGZD+RdWIgNO6rvPR5Dp9SgHTT+MfyaW7+QRVUr3rFr9xdhPcq5TFxqW9uGY8OSURacjENVg/MZk3kS849Ys4S4VknrEukeVlgffwBCAp2fsrDCQ0jBaDBSflcF8ssIsf61q9bpWLE05XlEdeyWaNPCooeZPj2QjjQ5/E/gZuLqGDOOz9nC7j+G5zzC0Oes/8DrteB9Nw6H1Vz1WEaQX5MbpGonkiOA3bXfbOQQMHmtZK0vcbaygtSGP5CSe3gkVPQc9a3xRXxIIhpfPtxxI7LGD5sD5IU70svnQ4wXhFzMSswurDT9XZ44dHsORMDQliUZ1dH0DqHBtKHOrK7Q6dCw5IYMX2I2AChGyuFR/WUepnLaGZfud283Iv8b30vYDkErsXNR3ZJ7BtkyzhYrYgPo7HOK//RajWji+5zotkwJgJaaeykqKNbE3b2NChhosIJVAgmPzUuChPxfNj9AI0NVRxNZ+kh8dXp6sg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(83380400001)(122000001)(6486002)(91956017)(64756008)(38100700002)(6512007)(66476007)(54906003)(26005)(66946007)(66556008)(2616005)(316002)(478600001)(76116006)(8936002)(4326008)(6506007)(33656002)(66446008)(53546011)(4744005)(36756003)(186003)(8676002)(5660300002)(6916009)(71200400001)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Iz38KI+omChE5OyDlUy5jfx+u9I35qBWR6AlDlEf7/UNZOp7NF8fUy9j+oau?=
 =?us-ascii?Q?utWW5dFcnfFDRCYy6r9mMrcX/IVGQWwCyRD/nrIPiSml03QT+sVUJGYci+MN?=
 =?us-ascii?Q?CQxMP0nKVyhdQFU7eN7GYKHv8jDyEs7Tv+l+ehS2S1b+qIbS2idb2rkdpt9J?=
 =?us-ascii?Q?T1yFGoJiYZU8iy6YAGoEV1GKeWERJYx152WnMiz8eintDiwvreeHozj6fG2w?=
 =?us-ascii?Q?PivbKGrSl6e1gFF9/QJuJOjGlDVAHVnIg/nbjEhMfI+Rf43IFyj8SXx1HtMK?=
 =?us-ascii?Q?8DdvMWpmjFTnGc1QJ7sVQ9XB2F0UVlg0uCozCpFJsL1Pb1op5m0XEdOqrpPM?=
 =?us-ascii?Q?JdKEEPyoFD3fhsSDS487eadOuERlphw7LS/ofF7VTJYra27+iaAEQ30rqWPg?=
 =?us-ascii?Q?zxG/UtT6So5dKBQ6/i6KBQXrSbiYQ9AtoZi4/d2bjEOVz28zYC2tdGHYfv0y?=
 =?us-ascii?Q?0jl2NfNwvot0yEKpSVVp14eeuPWIcqvgSFTfPHP7o6cma8rvgouIsrIN5WSh?=
 =?us-ascii?Q?urUmBfdNAaskI/Rh+r0s6cPzfOyiiMw88eudVw/+jYrZWbpJ87ecKatGAwXb?=
 =?us-ascii?Q?YvKD9Q6BUUE+IjvJn3cFU9BIoordQu0PElpMSOM5p98eir7qjlsmPUlj3ObS?=
 =?us-ascii?Q?sLHUJOKQtvb9wF9Shr8i8s+So+CGi0fzC3x1zHFzY4yDM0nF3Kq26gZmp2zY?=
 =?us-ascii?Q?HrEFEEQJRhSr5ihcmbXE3heXdrSElWx7iH0ozR3v2tN4apO9XPtczUDHgV19?=
 =?us-ascii?Q?J0LNx5s2gAHyISy/FQk/U3j+rQHb/cEIfrCCF+4onUtfeIOjs6lmIoTffxFU?=
 =?us-ascii?Q?194iQCWfaE/7KzksoWMk4U0oKEMBA51DfiCA2QvkX/BiJ37/qKddxaw0hoP7?=
 =?us-ascii?Q?Rs5PWu3JsyDz0OrNxbb76f+fzxBTKGaxNP1z082aIwQeoBg4G5MZW1074vAG?=
 =?us-ascii?Q?b/Y0BajUegOvvRSTiPLcez5P8i/CT7+DzsJ+bdQv3I+aDo3O4r1o4hfWd+0J?=
 =?us-ascii?Q?881gGZSQPCwaLiNrSmn7GWscUuzv185QUMNbVX5qyrZPFrp4Rz3cjZW9fiis?=
 =?us-ascii?Q?ZnAht5VZWMhTQv5bJL9jJCoScy10T1SS21p9BwPx+jCnRd6sIrq6iSxDR6iL?=
 =?us-ascii?Q?dQJFOdT/QXsLK0TjjwI4EHB6LX6Vh1Hs8lWvgzGlAX3CVilDfiMvF9JqOKgQ?=
 =?us-ascii?Q?pKlU5MLZznmdXamSFGwy+0xF2S8RUf8FyowgjOf6yq0nN8tfjlMznX+qapS9?=
 =?us-ascii?Q?+JfKuWWNB1/HRZKBzV4B9HT79eaMDoUCBmucP8wVhYBXbdtzoSm0dP0SxNqD?=
 =?us-ascii?Q?l1crR7wUAOniWWQihmUP19ow?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E469D3F8799B54BB8BA63983499B62B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6687
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66e6558b-48c0-4e54-4463-08d94091f5b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vn8xWEp4uhtWe5zK/G/49I5SxpmTicdwWAJiY798Npm0vSjguWFPhZsUO+v3zUFH4arJ37Ij1V31dWkeKjHU26xEtK40cttL6q244MIzhOdNf+um7ocnIC8QSWynjn7Xp4cNorKasSXlo15K/y10hTUZMj1+RNTVIxBKnjIF3XFINRoURgW4a+dfSzcyphK6TVQ2nYgbYqYBeAljpDjSn2HtRfGdLCtqq654DE2R/EEFiXP6jzDQQoGjvdnYLgWE2Xqma/bUPR6+Gd7FyK/gNthu/CMcoDL2XM9wNkk+Df+GSrw8/Kx8b1jRkbJjKW30lwap0G90/p4z3ulL5e33PhBdSj3cpAVcFwdLkxAfd5aJ4ImQXq9v9Mv4XkfS3Pd3YE4zfUSNHfMhUV4yjPWCm7h1reAJXCFZ5UGq3dIdqx4AxiFJrAFJYx3V9PYxXl2SBbNAxZaNvs5IPv8ytFv59nqMW9FWtWx1cxTvzHQzPMTaZOOq0MJDNOoSwA51j8ZM+qBlJHSxFB8SimKdNjdX2btbxJtzp4ht9fY14SrmIOjxr+6GTRr9w3CbhrYEu5GYYly4nmARP1T2wfsDgzc7xx5bnVyJyPwXHWTTFF7ZGbDa58ZT6LJuGoUV0gRwUxEH6lpTIZ40r5gA2NznGfl1nzCyrhGE1jeiFWxlrkwiBsY81tsFxY1gNr8dVYGgFhqdnQT+uKio7YJgQ8/9bmNYcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39840400004)(46966006)(36840700001)(2906002)(4744005)(6512007)(478600001)(186003)(54906003)(356005)(6862004)(336012)(36756003)(107886003)(6486002)(47076005)(82310400003)(70206006)(5660300002)(83380400001)(81166007)(70586007)(2616005)(53546011)(8936002)(86362001)(8676002)(6506007)(26005)(36860700001)(316002)(33656002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:23:33.3561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad33b26a-e32a-4a15-310d-08d940920484
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7006

Hi Julien,

> On 6 Jul 2021, at 16:15, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> Thanks for the fix. I forgot to check the full tools build when sending t=
he first fix :(.
>=20
> On 06/07/2021 16:09, Bertrand Marquis wrote:
>> With the changes of register size introduced in
>> 918b8842a852e0e7446286f546724b1c63c56c66, CPSR and SPSR are now stored
>> as 64bit values.
>> Fix the print size to use 64bit type.
>=20
> Can you add a fixes tag? This makes easier to find bug fix in the tree.
>=20
> For this patch it would be:
>=20
> Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint64=
_t")

Sure. Patch incoming in the next minutes.

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Just to confirm, with this patch and mine the tools build successfully on=
 32-bit and 64-bit?

Yes I have a full build running with both patches added for arm32, arm64 an=
d x86_64.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


