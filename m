Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0756E659E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522861.812505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pol9Z-00088p-2A; Tue, 18 Apr 2023 13:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522861.812505; Tue, 18 Apr 2023 13:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pol9Y-00085Q-VN; Tue, 18 Apr 2023 13:13:48 +0000
Received: by outflank-mailman (input) for mailman id 522861;
 Tue, 18 Apr 2023 13:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pol9X-00084k-9c
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:13:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87df1b2-ddea-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 15:13:44 +0200 (CEST)
Received: from AS9PR05CA0230.eurprd05.prod.outlook.com (2603:10a6:20b:494::17)
 by GV1PR08MB8010.eurprd08.prod.outlook.com (2603:10a6:150:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:13:38 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:494:cafe::58) by AS9PR05CA0230.outlook.office365.com
 (2603:10a6:20b:494::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 13:13:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 13:13:37 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Tue, 18 Apr 2023 13:13:37 +0000
Received: from 44ccc0c81700.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72FE2263-BDC1-462D-B758-25496574CAAA.1; 
 Tue, 18 Apr 2023 13:13:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44ccc0c81700.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:13:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8228.eurprd08.prod.outlook.com (2603:10a6:10:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:13:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:13:26 +0000
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
X-Inumbo-ID: d87df1b2-ddea-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwSVKbIMzh3zCXI0VqAxwpS+XOYQ+lgS1cyfBJWwROA=;
 b=wn3z0NvHDOB5HXrAgBcCPsVI/vAgNekD7ZLWEwJCwoaqzQFbV2bNIRo8383AprVUeBJE3WiDTY4iO4v2TNWvZyF5wAuHkVEnoF+revmmroNDZAjRv9V2lHGa6ej8Fg3gL/VTM8YqzCg+y1PZTvnIDAzKzQBjEuUssnO9QrQ03q8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b1ea878f41bbbdf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhL5BilqVpf1o0HhIxUONS8pqNzz68nbg5wZlYwlfRhGPfwVy7CUl9Np5GKfIrVsdKzKBhkL+hs55LXUvLAlp6mBW1H0TI/08A8b6ajm/E97n4dgte+qLx31e0ydDZYGe5r3o1W2iwZTDPYU1pCjz79PZqt+ntgu8A10RANniobdi40xxdosj1da9FqPS7l3xAjI8gAkH3w3RwzlcKNOhNF5LJ0iA3G3iwTYTAoyyHT4vuh/1+XJekfc6z2R65lQBwksyerXeEfRzFgP52nJxRSsvBpZU+MxRLDCtRyBlpniwqjyLFVE7OmC9ba3Vt46KmQKRvEjNWbPc/UNB9whXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwSVKbIMzh3zCXI0VqAxwpS+XOYQ+lgS1cyfBJWwROA=;
 b=Ibw6VRoOWcWg1G2FpbZuUeLeeW6q8UEm45BLADj+bCzny6rxP42nK/oK8j2rtZGG9vo04q1Z8OxIaV/rj3+x3r/BAV9NMUDQDvPFTJkdgm22dkB9QFNQG61V1gvR7msM7TmOj667mUf7cjIR5UvvDM3g9OD7I76i+DL4v/lKcvL0rCp+mbbG5h3HbXm3bCnOkTSSPo6Q141/RsJ111JEkNqy4iJAE8Kh8NlGdRhJAE0k+7KsWx1I9/k4iDe4Ly4VKDI613NWaem3holQx+ql9tGulmAJef0DpDtdbAQMMrdl/0x9witpoYy3DBWNRMHECEy7jAuAXm7Fn82pULvXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwSVKbIMzh3zCXI0VqAxwpS+XOYQ+lgS1cyfBJWwROA=;
 b=wn3z0NvHDOB5HXrAgBcCPsVI/vAgNekD7ZLWEwJCwoaqzQFbV2bNIRo8383AprVUeBJE3WiDTY4iO4v2TNWvZyF5wAuHkVEnoF+revmmroNDZAjRv9V2lHGa6ej8Fg3gL/VTM8YqzCg+y1PZTvnIDAzKzQBjEuUssnO9QrQ03q8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Community
 Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Thread-Topic: [PATCH v5 00/12] SVE feature for arm guests
Thread-Index: AQHZbSQqKlfgrZX3xkqta7+H+1gq3K8xFMoA
Date: Tue, 18 Apr 2023 13:13:26 +0000
Message-ID: <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8228:EE_|AM7EUR03FT043:EE_|GV1PR08MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: a0be6b71-28e8-4ba0-78be-08db400eb8c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CF5TOtbJc9QASBJmau6+O+nJZHOkCRT9evh9/eXll9k6YCrrg0gtlGo8QAmdNDz2YmRkSbbbVkcfiNHSslxx5DhCXiwvA3VjFxvXLX82rs9h8cQUrE90hx+ZHkH4Er1qFMblfp8pxSvJvLsdIoH61FEP4pmZL7OiWWhwn3JwUJgmgJrCEy3BB2oVMIyaOICyoyKWDXI7y+F2KS0RRhGXLyLYJR0402/DvK4f4kwhWRCmwC1TfQu5cIrgVkwaIgXfeJJE/TQoWttkbO4nKZajuiJT259BQ7eaqqn9zP6RuEhU5nDKi8PThgSx12UaKQwTP5aq07wKUA48bzkTGmcgV5BcP2+3WxnkiF2Bt/3xBg19fk5Q79L10w7fYkw19rUlUaGHOWD/57+pllRtsIFYNiQ82Gu1xCbZlluhhnuhbi37tajTUYnR5ZuFiR+l22DqKbMxLvI1E0twrUI0CcBTiFHUV5dAdJJFKDA7++ywxtbWhun8MzQApU8+bYbcArt67Nvwg7mlY5ZdO6i0ryMYEDVMbS2wcD06LGrU0C6e1WnVeZlMOi5TzYbpvCYUXawsBQM7yC/Ove9f9xYioqALbZzn6aNvGF3kdiDHZO+JtPiVr7xrExZwwFjG7VrS+MZZBDUFyaz4fisA2sDgV+i4jg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(6512007)(6506007)(186003)(71200400001)(6486002)(2906002)(2616005)(5660300002)(41300700001)(64756008)(4326008)(316002)(66476007)(66556008)(66446008)(91956017)(7416002)(8676002)(6636002)(8936002)(66946007)(6862004)(54906003)(37006003)(478600001)(38070700005)(76116006)(38100700002)(122000001)(86362001)(33656002)(36756003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <001F099A482EDB4781E5F3E611A4E69D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8228
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc27f8ff-7d61-4990-28d0-08db400eb23d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MFBldd5t2PfKCiyXQzVpJ9PWebZyRg9Nk3i8hqjVfIKRac0zcrkNoQmEMBVW0cBcHxgOzy0a/XL4mmu+IdfRQ5P7GFd+qJftTyMi3eoicbBqgutQW3hP++OyvHH7ecCCbAcLmk+PvPD4b58byik11y9dCB0KOHUCodl0C0BbK27A0G2T++MxKOPCX3WjUW9VADlJGh/pxEi8DV5S08oq+KsHaIg0JU9XgZp1U05MNPJzx8W0jAvys3gWfuEsTTyAqrsBeyJBCMgB8/9IUtkTV7j2kGj29I0ZM3gPJeYiGek5JSwaLM14ommffz0TMOzW+dMTmRbhqXQufGQh9KB2e48OBXRXq8/Mj8/E4BR6zQqJgwuCPK31AzFaeU6dpIvOy8oGAdTiu/j8tdZRJ9bm04jBUtsaNdt8ggcyNvFtcICHp2VU8HBdLUV5btmWmfGgK3dEKYqZ3W4on523couhg0Qjus8SRCpvM34akr1OZ1ILBgYX4ZedTdwRYXiSOcioXB6QMl+volVxD3lYO8QwQazcthv1dBZ7otglbAm7IixYnjMNYuBUlxgx1MMoeic1/uH5kPS3CQo8s2jmKuYYL4aR9H7mU4nXrFPJ5XqtF/XA7LOjnYSJw5zwhVPQEIyC7v5Fy+9NxJiBdnXXGES8TVtYpKpvL3M7hbIGXGOCfYAAZ4vWpu6o8k0gnN6XV4tmzgatUGSaJFF7goPSY0iSgQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(336012)(82310400005)(37006003)(40480700001)(82740400003)(47076005)(356005)(2906002)(33656002)(6636002)(5660300002)(316002)(41300700001)(54906003)(6862004)(8676002)(70206006)(70586007)(81166007)(8936002)(478600001)(4326008)(86362001)(6486002)(36860700001)(36756003)(40460700003)(186003)(6512007)(6506007)(26005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:13:37.5682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0be6b71-28e8-4ba0-78be-08db400eb8c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8010

Hi Luca,

On this serie I would like to open a discussion on how to handle the vector=
 size
and the corresponding command line / configuration / device tree parameters=
.

In general the user must either give a vector size it wants or has a soluti=
on to
just request the maximum supported size.

In the current implementation if a size bigger than the supported one is pr=
ovided:
- we silently disable SVE for dom0
- we silently disable SVE for dom0less
- we do not create a guest when done through tools

This is not completely coherent and i think we should aim for a coherent be=
haviour
unless we have arguments for this status.

Is there any good reason to silently disable for Dom0 and dom0less only ?

I see some possible solutions here:

- modify parameter behaviour to use the supported size if parameter is bigg=
er than
it. This would at least keep SVE enabled if a VM depends on it and could si=
mplify
some of the handling by using 2048 to use the maximum supported size.

- coherently stop if the parameter value is not supported (including if sve=
 is
not supported)

- always disable SVE if the parameter value is not supported.

To be honest I am not quite sure which solution is better but I am not happ=
y with
the different kind of behaviour we have right now.

What are your thoughts ?

Regards
Bertrand


