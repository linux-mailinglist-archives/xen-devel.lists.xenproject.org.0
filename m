Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A87575C34
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 09:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367933.599110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCFav-0005WI-40; Fri, 15 Jul 2022 07:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367933.599110; Fri, 15 Jul 2022 07:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCFav-0005UB-1H; Fri, 15 Jul 2022 07:18:37 +0000
Received: by outflank-mailman (input) for mailman id 367933;
 Fri, 15 Jul 2022 07:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bQZ9=XU=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oCFat-0005U5-Sz
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 07:18:36 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10059.outbound.protection.outlook.com [40.107.1.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 557c06a4-040e-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 09:18:33 +0200 (CEST)
Received: from DB6PR1001CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::11)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 07:18:30 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::d3) by DB6PR1001CA0001.outlook.office365.com
 (2603:10a6:4:b7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Fri, 15 Jul 2022 07:18:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 07:18:29 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Fri, 15 Jul 2022 07:18:29 +0000
Received: from dcf0c26012b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 166D18AF-C247-4EFC-9490-D9E98B92F3F5.1; 
 Fri, 15 Jul 2022 07:18:23 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcf0c26012b5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jul 2022 07:18:23 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB3166.eurprd08.prod.outlook.com (2603:10a6:803:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 07:18:18 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%6]) with mapi id 15.20.5438.017; Fri, 15 Jul 2022
 07:18:17 +0000
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
X-Inumbo-ID: 557c06a4-040e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=agfOIlCjHnCmmHBumU2HTCwcfRjkr7v1w7FC5oDdMy0PkWdOV5OyjPbwq/HAkIRrPSUKeNFm4er+YbIdNBagLQ3LCGfLs41R78MP2SJYapR3iQdWtGYw9BxpKB3MzaYcn0mJ3E3lUv3bxvnXw2dU7R9wvUACPHVY7zuUG8o+0ZNwK7tuM9b4OBFVoPxESCXCN0NDqEXbmKb8TsA4hqwV8CZJ/Bcl3J9a4FMk6AOtqadech6HELTFZYsy+i7DY06hNSOjSDasrA5ym5KjV6gnuUZUlMmrKDFRX/uL9jJ8TvVIvtOlmhu8pM5VtjYdancH/5myoVxbcgLyxfxC28wkNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arymSuFwklfPLOmYlNy8bZY5qdA7XbUIlSc8COvUre8=;
 b=YKFXhFXplSk1v4hoPptt6lk6B9lUFSDqZbuAu/crDIIzBQ4slrp8n1s10fwzlUqreu71AaxUS4DdHI8CAXQ3fz39nZLtyoUFVSH+SebG2ZGWWsPLS6gcQpVxRPisLeWK8utkLbuUX/F6Q+K1NovhgYskLeEl51pLrd2BEBlPAyB3+EZTJEs7jCNa52/HrUdF4oRsgyGc5wDkLV0JZRe6Ug9hg/39VJ4iEThKNaE7PFLBmOiu1tqIY3ix0+44Qw+2mzQiPZ2m8XrBAzK5fG9GtXwl1YWcf+CtxrKnXDmnm5ldGAfabJZxhHgaMLtiB65WA+MknwwmbxTTO7JWGu0AGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arymSuFwklfPLOmYlNy8bZY5qdA7XbUIlSc8COvUre8=;
 b=93BQkmB0G+8waCarzm9oKe69DB8RfydtHHUd3Q8Wk3gPOLDhL2yR4FtDys5vdX+1SYmwdvz8r1pj97E4U5nxHi/+2qhQkbSpje4KxFskocVzBpzOuo2K5N0dgiyTzNa1lAx4UEHlAsE8QF+oU5rt218GaIneRUID+HSGgI1Ll1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEQsY06Bg5KgcgA0V4aYi0PXK5EOoZWYHQoKydEsACgJ4WhzzI9pxGjOrO1D+2+Bo01/bo25p3WLJBraKq2HXs/vdoHvJ9vNENPl5p81kDUFqxyHvw7gygQg4k0IrAz0lP7mTAsH1WveHyL+Iubsv4hyQA1JSxtfAgyWTJFF8gJuwUcA1SHPUKrCylrJ+6Uyu9yNUwnnCTiBzx+uNX1+dBMStVDHAppsVJQF/6DKwYFUImSjsjBKqv7Q6YZV2HwtHkkQwxv7+PSAO75O5XJn2adnbLWQfWZ/aSnRfEeSzPlNImc3DSGsiVdjwDG4HTKndyX+r1/ikeX2oGiPpByo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arymSuFwklfPLOmYlNy8bZY5qdA7XbUIlSc8COvUre8=;
 b=kntRjpJOv/Te3dnQmT3vqTS+DdPVxEkjAgCnhrE7etdjcSZE/P0OVaIlNqJitN9TXzsumt1SRi/zF3uY2Unk99Uovgol1o4WiSskOeaj/aova8WcXd4xjeN0or3xJcdcvhLHqF7AZDfLQQSbHCTpmiKggIqL9rmSm1LvQTOONNy3GWlg9X2N14Yb2RQQa4/OttXTftA1Q1XezRNa9J1O7P0MY6Y3mO5LsYhgMHm+rbgjrhfBXHJwCiYu4UNojfsvIhnzmJCzDQJiO+T3lPQ/dNzVTF2EWtlLoVO8PLQtIZoslMGXPpQwKOhOrEWA0AA/NKHFlXq2ZIHFogJQ8DA16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arymSuFwklfPLOmYlNy8bZY5qdA7XbUIlSc8COvUre8=;
 b=93BQkmB0G+8waCarzm9oKe69DB8RfydtHHUd3Q8Wk3gPOLDhL2yR4FtDys5vdX+1SYmwdvz8r1pj97E4U5nxHi/+2qhQkbSpje4KxFskocVzBpzOuo2K5N0dgiyTzNa1lAx4UEHlAsE8QF+oU5rt218GaIneRUID+HSGgI1Ll1M=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Topic: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Index:
 AQHYktrASbKlS5xyGUK27wSgSLVuo616tdwAgALfc0CAAA5jAIAABItggAACa4CAAAWRQIAABX2AgAAC1iCAAALsgIABU/pA
Date: Fri, 15 Jul 2022 07:18:17 +0000
Message-ID:
 <PAXPR08MB74200DC4E8691443BDC59F5A9E8B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
 <PAXPR08MB74206EF1995F61B23F4C60609E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <94652840-c563-3424-d2d2-70871b39ad62@suse.com>
In-Reply-To: <94652840-c563-3424-d2d2-70871b39ad62@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 351A7B024BDE8D4FB399685DA1029CAB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b806ae77-fcf7-4c5a-865e-08da663237cd
x-ms-traffictypediagnostic:
	VI1PR08MB3166:EE_|DBAEUR03FT041:EE_|DB7PR08MB3260:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hKaylmny/nUyoM1nssyVigLqvkVpfduttoHSazhN3NElmVM86a/88fvCyTnP4vn/3fNp1XAVF2t9P79UiVVcMuDrkXqrv27FZUzVe6cgdmgsiZsIbPo1tyM8cLC3x36XjV/RZAmrmNyeirWUMADQUF+qxd61YfxgGEXrUt00eIK+RBCFgKHOjC/yb8odaRcwkv871Ue7IGAUnW6AGl3AdDMnb2lPEFJFbLgw9OCPwe4CneuvY5bVTphGt7NNtlvkvjE558ZSsCU6Ut+83Cqzzacg8B6/CVB3rUD2PDVgWYgdns0jG23X49anWFIOBCN7PfB47yga++Lwhqe1JxaQZuMEOrzAnrjJ6Rzqc4KyKfnC95DwA/jXQKc5qhGx0IlBSmkFcDnxNDhmPaB1W3YU6U4oAb99cu7wKgkMS0ORvUhUs8lknB6YPbYZuCgCRXyL3BmKEJB3/kcdQjyYSj3qcYdBf9fPL6IOtIYjb21v4LP4vyM/DWygAoLaGF2PvW9b610diubLYDSmucVxeB6JS989dJgKswUbJnN/pyOtfcSZ6ZRQ1CFeIImiyygTE1TBBe1gHhgcBlNCBnd74ivV3W5Den4v4b0/8XU9mok1RfiSGiUGUlCldAjK5u6iPIf5bdyA3RrzgLRi+8naNkmVrqYYDqFG+AV+rJU68Z9e7D1c+Cx+tTm6yajRKJdUGPyKjJUZPiWVSZT6+sqSQa6kSAFkFu/ajgSoxf5E51kb4+V6wExeH6bMQeUrATtnTdGp9MZ78+QVl3m5hCKrGvBP7OUcKv5gcHCiEeAbdV70Xbc7epNCMHC9URc+BHdT2GvH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(2906002)(5660300002)(64756008)(76116006)(186003)(83380400001)(66446008)(33656002)(66946007)(66556008)(8936002)(66476007)(52536014)(8676002)(7696005)(41300700001)(53546011)(478600001)(71200400001)(38100700002)(86362001)(26005)(4326008)(9686003)(54906003)(6916009)(6506007)(316002)(55016003)(122000001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3166
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b01f5339-8ad6-4b8e-6689-08da66323075
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dBeGtFkgqxNZdRr/mfCY7m6HHBtZfhuqwsAZ5r89CIlT3Awcb2qjBCerDJ9WHFooUqOt0XFarYSJaRvd9p0gJ7A37WDhS+i5c+lFy6Vj/bgNY6IP6VWBftnTTdXCFXuzKGSrmxmOq8EMSaeT6VHvbZPAGCN0aBmiUlxsR1SpZ31NrWdWqQWHZjScYHgzxQ0ldBUnVVma+uerHnDl2taAWNjS+cKqfrA32Q4GYNzOreshnG3qfQJJ4MnhM2ZAwrbDkwiKrzEOzosAUbnVM2lBD2zfBFaO4rr4uSi7riQ+ncx30f9HqqGY/nFvBd37ZjxPkrjLQG48iI8BmUcOx8ALyBy59k36a77uNb6+chMQ2Vtjls5+n/NgbD3ri3Jx5pMDrjCaYTnZkBl7N1z35unF3fHzm8GAycYbjTB88ILco4emqQ1gW1LfpZdNIb1e0PhILeI3UrFuM9ROlAZrfFI41dSMXtm441VrNV7viSUqHDFkHyRZCY3H33xA/tXgHuvSwoIsXmk30GDj4O/g5szFiK6OTcFHhLY7Ci/sUIKLLrJVDzzfbk1L/qXZaAapvMPqVEDwsxRD70aTgwiJWc0gvdD12X8br4E49MVISwvjfar9Uhdh/gAVnQI9zpTNACAYosJRT1lYKThUfrbn/oLndp4kj1XuefSh94GAc18jh+y6njSauptS8jMhPFJref25Yk/WffSzdm/RGCZX8Erp6G24NkEqNDsfWuTAmFlUfCCXlcjjW+M7TiHQmoho8fNkaRcaw+8o2pI9XZQYX2OeGOkASWv+NwFYN+zpqpKOSXXSc4+czReODPwFl2ivP5Uq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(40470700004)(46966006)(36840700001)(2906002)(316002)(41300700001)(82310400005)(8936002)(356005)(478600001)(6862004)(36860700001)(52536014)(82740400003)(86362001)(81166007)(40460700003)(5660300002)(54906003)(7696005)(6506007)(40480700001)(186003)(55016003)(33656002)(83380400001)(47076005)(8676002)(53546011)(336012)(4326008)(70206006)(26005)(9686003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 07:18:29.6804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b806ae77-fcf7-4c5a-865e-08da663237cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3260

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxNOaXpSAxODo1OA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
Mi85XSB4ZW4veDg2OiBVc2UgZW51bWVyYXRpb25zIHRvIGluZGljYXRlIE5VTUENCj4gc3RhdHVz
DQo+IA0KPiBPbiAxNC4wNy4yMDIyIDEyOjQ5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAyMDIy5bm0N+aciDE0
5pelIDE4OjM3DQo+ID4+IHN0YXR1cw0KPiA+Pj4+DQo+ID4+Pj4gV2VsbCwgdGhpcyBtYWtlcyB0
aGUgdGFibGUgY29tcGxldGUsIGJ1dCBpdCBkb2Vzbid0IGV4cGxhaW4gaG93IHlvdQ0KPiA+PiBt
ZWFuDQo+ID4+Pj4gdG8gZm9sZCB0aGUgc2V0dGluZ3Mgb2YgdGhlIHR3byBjb21tYW5kIGxpbmUg
b3B0aW9ucyBpbnRvIG9uZQ0KPiB2YXJpYWJsZS4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IE5vIG1h
dHRlciBob3cgbWFueSBzZXBhcmF0ZSAibnVtYT0iIHBhcmFtZXRlcnMgaGF2ZSBiZWVuIHBhcnNl
ZCBmcm9tDQo+ID4+PiBDb21tYW5kIGxpbmUsIHRoZSB2YWx1ZXMgb2YgdGhlc2Ugb3JpZ2luYWwg
dmFyaWFibGVzIGFyZSBkZXRlcm1pbmVkDQo+ID4+PiBhZnRlciBwYXJzaW5nIHRoZSBjb21tYW5k
IGxpbmUuIFNvIHRoZSBkZXRlcm1pbmVkIHN0YXR1cyBjYW4gYmUgbWFwcGVkDQo+ID4+PiB0byB0
aGUgbmV3IG9uZSB2YXJpYWJsZSBmcm9tIGFib3ZlIHRhYmxlLg0KPiA+Pg0KPiA+PiBIbW0sIEkg
d2FzIHBhcnRseSB3cm9uZyAtIHRoZSBpbml0aWFsIHZhbHVlcyBvZiBib3RoIHZhcmlhYmxlcyBh
cmUNCj4gPj4gaW5kZWVkIHNldCBmcm9tIGp1c3QgdGhlIHNpbmdsZSAibnVtYT0iIHBhcnNpbmcu
IEJ1dCBsYXRlciBvbiB0aGV5DQo+ID4+ICJldm9sdmUiIGluZGVwZW5kZW50bHksIGFuZCBtdWx0
aXBsZSAibnVtYT0iIG9uIHRoZSBjb21tYW5kIGxpbmUNCj4gPj4gY2FuIGFsc28gaGF2ZSAiaW50
ZXJlc3RpbmciIGVmZmVjdHMuIEknbSBhZnJhaWQgSSBzdGlsbCBjYW4ndA0KPiA+DQo+ID4gQ2Fu
IHlvdSBwcm92aWRlIHNvbWUgZXhhbXBsZXM/IFRoaXMgd2F5IEkgY2FuIGJldHRlciB1bmRlcnN0
YW5kIHlvdXINCj4gPiBjb25jZXJucy4NCj4gDQo+IFRha2UgYmFkX3NyYXQoKTogeW91IGNvbnZl
cnQgImFjcGlfbnVtYSA9IC0xIiB0byBzZXR0aW5nIG51bWFfbm9fYWNwaS4NCj4gWWV0IGltbyAo
bWF0Y2hpbmcgdGhlIHByZXNlbnQgbW9kZWwpIG51bWFfb2ZmIHNob3VsZG4ndCBiZSBhZmZlY3Rl
ZC4NCj4gV2hpbGUgeW91ciBjaGFuZ2UgaXMgZmluZSBpbiBwcmFjdGljZSBmb3IgKGN1cnJlbnQp
IHg4NiwgaXQgaXMgd3JvbmcNCj4gaW4gdGhlIGFic3RyYWN0IG1vZGVsICh3aGljaCBpcyByZWxl
dmFudCB3aGVuIG1ha2luZyB0aGluZ3MgY29tbW9uKS4NCj4gDQoNClRoYW5rcywgSSB1bmRlcnN0
YW5kIHlvdXIgY29uY2VybnMgbm93LiBJbiB0aGlzIGNhc2UsIEkgYWdyZWUgd2l0aCB5b3VyDQpz
dWdnZXN0aW9uIGluIHByZXZpb3VzIGUtbWFpbDoNCg0KPiBpbnQgbnVtYV9kaXNhYmxlZCh2b2lk
KQ0KPiB7DQo+ICAgIHJldHVybiBudW1hX29mZiB8fCBhcmNoX251bWFfZGlzYWJsZWQoKTsNCj4g
fQ0KPg0KPiB3aXRoIGFyY2hfbnVtYV9kaXNhYmxlZCgpIGV2YWx1YXRpbmcgYWNwaV9udW1hIG9u
IHg4Ni4NCg0KSSB3b3VsZCB1cGRhdGUgdGhpcyBwYXRjaCBsaWtlIGFib3ZlIHNhbXBsZSBpbiBu
ZXh0IHZlcnNpb24uIEFuZCBpbg0KdGhpcyB3YXksIEkgdGhpbmsgV2UgZG9uJ3QgbmVlZCB0aGUg
bmV3IGVudW1lcmF0aW9ucyBhbmQgbWFwcGluZyB0YWJsZS4NCg0KQ2hlZXJzLA0KV2VpIENoZW4N
Cg0KPiBKYW4NCg==

