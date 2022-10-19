Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23601603A27
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 08:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425510.673374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2ww-00040c-Q1; Wed, 19 Oct 2022 06:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425510.673374; Wed, 19 Oct 2022 06:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2ww-0003xw-Mo; Wed, 19 Oct 2022 06:53:10 +0000
Received: by outflank-mailman (input) for mailman id 425510;
 Wed, 19 Oct 2022 06:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMjo=2U=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ol2wv-0003xq-CI
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 06:53:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0538b19-4f7a-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 08:53:08 +0200 (CEST)
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by DU0PR08MB7541.eurprd08.prod.outlook.com (2603:10a6:10:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 06:53:04 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::bd) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Wed, 19 Oct 2022 06:53:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 19 Oct 2022 06:53:03 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Wed, 19 Oct 2022 06:53:03 +0000
Received: from 8e94318d63ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E23433BA-B2B1-4B13-9C9F-52B40223299B.1; 
 Wed, 19 Oct 2022 06:52:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e94318d63ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 06:52:57 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PR3PR08MB5644.eurprd08.prod.outlook.com (2603:10a6:102:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 06:52:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%4]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 06:52:54 +0000
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
X-Inumbo-ID: b0538b19-4f7a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OERFSsBRViJuB22lybDSA1j6eeJ2D7HtXNvht7xDHv8IjUI/jPAedJapE96poCZsn06Knee9OQs3G6C6FjFGrUfbMJh3IENcuPvkaS75rHklt81cqczrI+AnzQB19GRG18i8Boy3W2MaYkmqzhvArp0Iaf63gJzsU8Vs93qVbr1L8CSPOF9jEtn/p7iLed8J435UD/KkJOZrUoufAqB7cNNZUPSDiGkldjg9DnlTpMwhv3jbzB8WyYyoOF4MdtKUD/7pcgBGPeZCVhJcdJeWq7VACo2z8otoeWuHzBBcx3X3BP7inQBHysOsn5R0o74Z65H35jmqbTbs7/U/f0r+eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf65EyQCx7kVm7rtbql0ezNCriiV67/9Y7CJ4fTOwnU=;
 b=XXAbXXw9QRlFCoxjjDbF5PH+UJwlFouKWTJ01n0LIYzjYhZfIGuf+5jVqldfSRK1NakwNGFl+KetLe+c98iKJBatszYYut1TxdAhwqSuJvsZbNcmXfvFwiPDndRBgraaD5lPpEyBlFZ8sHJQ4HtDgpnhbVfL0HeS0KIK6exvc6sx996j8f8qeRX+vU+h+YXiq/ugh5m9OMhkQYOxrHGkZ4xMrskx3y53Qb1EUZKqxY2ht7NSjpktnq/SCWJxRAelAYN9s7NHIdyn83HamlZ1wiU5P/wIR/v6LBQ5JfNrGsAQ5J7OC0CUdm3quCqkyUQuLz8BSUykzW7so/nLMjjZMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf65EyQCx7kVm7rtbql0ezNCriiV67/9Y7CJ4fTOwnU=;
 b=qJr8Zqavl8b0semef4WsjX2J90XAQFm5rkQHlsac4yqYpnb31rfZqs5u7fcE42j8ccPJ2hlsySatKYsMGEdR5fkHKLTt9jUmu1xJtu08yosxaaBGNNCI9jXhEZZCU6bY9RRaj111QMCuR4Zxv5ixKqexGnLK2TdMNT0m1KWbxwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2i5ko04O9VjVDa5MVtTtJZY4RSykTMBecxcRBfMMSIR65+ADHEPJIa3oUxDoEN8xI+8Z5X8uhTHJMehzKwNV7ZrflMcBjikSxrkiSbFBvwApgxVwGrmULDiTV4vEBvWqQ36/39T3AFYVmAvnQJJqzCcvC76EZgupcJ1bIbXSG5IWPQ383fWwAYEukBYKKLaTViRLGwol19QGh4eqWBPtz34Gym/95oYMbc8ghuyfcSzs/ANjVrjLBa7IH5KlqRHY8KjOUvtD8KufmMKqmLBs4kOEJm50kXpNCc0lpMgYP6LdzpQUQ9UUaH7BDikMW4LVnScIvDCYXMz+VLWruJeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf65EyQCx7kVm7rtbql0ezNCriiV67/9Y7CJ4fTOwnU=;
 b=chW7nPwEs7noyV3G7lndHEZGLCyeV3AJsPIwKLE0nSyRXMxa6/uOYRzaKEz0ip9bD3nJrwJmAYvZ0JIz0qHcW9g1PWonhrfzIMhuTKMJhP7/hxHl/uLZOiQbRnnoNiWO5/R55YGnD9Tvmva9/TZvqswvewAyoUrH1Ik1CCSEjIxVId1F0H3zWDZAVNAH2eWn6zx+azW36BSzC2WvuKgyITg9YV52uTc2fRQ+Jq6gSBGvSpl7H791728QQJchR5IE92eNVNYxuIfjPmi4exE66nuptKIB3vgHcL8hcAxjU790B3G7h8QaQl48f+83hzlcLDmxc71erBIIxY2L/Ua6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf65EyQCx7kVm7rtbql0ezNCriiV67/9Y7CJ4fTOwnU=;
 b=qJr8Zqavl8b0semef4WsjX2J90XAQFm5rkQHlsac4yqYpnb31rfZqs5u7fcE42j8ccPJ2hlsySatKYsMGEdR5fkHKLTt9jUmu1xJtu08yosxaaBGNNCI9jXhEZZCU6bY9RRaj111QMCuR4Zxv5ixKqexGnLK2TdMNT0m1KWbxwY=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHY3WMXl9OYk9SO1UmCbrdWlsAFLa4UNRwAgADISRCAAFTIAIAAAK4w
Date: Wed, 19 Oct 2022 06:52:54 +0000
Message-ID:
 <PAXPR08MB7420A36A53658B496DC09F719E2B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
 <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
 <PAXPR08MB7420E9ABED55E0554D3C33689E2B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <9e850527-70f5-c6fd-e3da-1cddaf5c6bd2@suse.com>
In-Reply-To: <9e850527-70f5-c6fd-e3da-1cddaf5c6bd2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 717C51F1FA64344B9F726EEFDA2C55D4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PR3PR08MB5644:EE_|DBAEUR03FT006:EE_|DU0PR08MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3d2093-36a3-43a5-7207-08dab19e9213
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Nh/bAQo4XXdH7zzZ44So8x3Wn/+90D7oyBAgC0uhlGeS9SAY+azHdv17gEu8BzYMYJYYXw3nMMilpV5pNx5BNRn/Bi+7R6BERBXuhgSzQn2HPfquoCsseXsXVLleKN1vtNJ3i8IgJlH0htdSMMXFkc+3R9JxPW4MvAdjWxBsFZSi/gqCbVjyfYF7YG5Ebv65cCpAP0+jjX0IuuNWGg/B43AdIQURa5wLGlpbLbwxAPoAqNt84HbDowyi+hoAaCisu5H5v8zZ1Hkih60tWt07Znc2DLpRdoLYMif+x1/jvd9sZItnwQK9pyj9Jnjs90l1VqQnFQtAF8kF09Jt9JPhgY8I9mJ7CKhtI86CgYoIo2NeQcpE5tNG7N/O7HuA7a46eoNFTybQIpyIN5MsOwoCDPgs7TZqmXvqqAm5/FRjuQyMfcQ1pIwZm+jHAadFSl8jNWuWrnumrJYSMFxgpzL6pxj9udP3EM9rJw58l+ZUE90XS67XPD2PohrhgoiLvKK3hQN4EBUxjf9uR8N5Wahtrn5o9qmdKljnVFmCfTUytx5c5mXKSAvTX5ZZ4ikVx3LZFzYXZ5LLiHzzDwjWdh4je5bZ5tAl5JGqzxAMxUkvgl8izAO2shGHqzmt5xoX6sFK8nmqPBRqHJB3i10eGcVIlXEbdN+TDWbTY+WHGWbT2asXS9kSmqHn6rEw0sy72Gto6ipooejTUVbY0uu8xW1WbFXyUNIJ/+dgay43Ir+2t0ef3ySI+LJLMpPADEm/UDQVsvWHJybEh6ToTncqZf8XwA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(71200400001)(478600001)(83380400001)(122000001)(52536014)(9686003)(86362001)(38100700002)(38070700005)(6916009)(2906002)(186003)(316002)(54906003)(33656002)(8936002)(41300700001)(5660300002)(8676002)(55016003)(4326008)(7696005)(6506007)(76116006)(26005)(53546011)(66946007)(66556008)(66446008)(64756008)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5644
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1833dcf-1327-4568-2d9a-08dab19e8c64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zGdHCGuOdFis0aRmk1SljQwrV+ihJdjqfBAF9ET6WXHT8IannyaHfzJXFJvmQ02W+bIva57R/rMDXYDl3IW5ezt7Vdy2PEBXj0SqTAiXgH2OZivvgBdiZ+v/Xsw/QkXgabvxui1prLzdFh+sL2U0Sc1rqNVKo/Juu+BbnraBxsnlUghHWZAk1vht3rz50SfnVBcto9BpCdHJTL3MjcdHs0fUi6FLKqS8XvrCtiX3l1h7Hi33mpZ0mlo49HTd46zh75+6j/h5xEkK1q2s7Q/sTjtKdSMfMIVe+QuEhqxPV5U+aPP/bkQBd03BNNcKVB9NXd6kPq5qZ15esXLK+iJoNFhgSue1cfwlL7M5qTLOzo7bJ7fhfKoj04766H1M3UlJB/P4gkzojhhgaZt0JTpOmfd8j8isbp61l98ZWkDl4U8ycdp7QUqadzY1SzXYdbeRFas22IqgnrRgDMZMu1gRgjc55JY0Mr4AxBTLN4mzCbzvadfuJn1L65ChlGRj/NuPv+tpDkrwLjIWavid8YU0uzfAUTlgo84aLrcHjPDwjgH5c85/852RMJzwLTO1XlUdPLdusI+9or96VSwhUzdw7ixswSr/wub1Lw9s28MTAJGCYvonDD2ww7p3hcKFaf35VFXtVOLkuBOBHxOzLV1X0cSXU6Xi1ajJnorDCnaEHPX1WBPF/QlZKd4NhLX3yaOa+aZoqDPR2fLBoUyRBHX4sQjVXEzRv60hMwlT58mUxPapA9BtR9OaaLOJB0ZLhRmJMvS0XLcwM4d9nrlv4iBTdA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(8676002)(54906003)(316002)(9686003)(26005)(6506007)(7696005)(4326008)(53546011)(478600001)(41300700001)(186003)(2906002)(336012)(6862004)(5660300002)(8936002)(52536014)(81166007)(356005)(82310400005)(47076005)(82740400003)(83380400001)(36860700001)(70206006)(70586007)(33656002)(40480700001)(55016003)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 06:53:03.9887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3d2093-36a3-43a5-7207-08dab19e9213
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7541

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEw5pyIMTnml6UgMTQ6NDYN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vv
cmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDIvNl0geGVuL3g4NjogbW92ZSBnZW5lcmljYWxseSB1c2FibGUgTlVNQSBjb2RlDQo+
IGZyb20geDg2IHRvIGNvbW1vbg0KPiANCj4gT24gMTkuMTAuMjAyMiAwMzo1OCwgV2VpIENoZW4g
d3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjAyMuW5tDEw5pyIMTjml6Ug
MjE6NDYNCj4gPj4NCj4gPj4gT24gMTEuMTAuMjAyMiAxMzoxNywgV2VpIENoZW4gd3JvdGU6DQo+
ID4+PiArc3RhdGljIHZvaWQgY2ZfY2hlY2sgZHVtcF9udW1hKHVuc2lnbmVkIGNoYXIga2V5KQ0K
PiA+Pj4gK3sNCj4gPj4+ICsgICAgc190aW1lX3Qgbm93ID0gTk9XKCk7DQo+ID4+PiArICAgIHVu
c2lnbmVkIGludCBpLCBqLCBuOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBwcmludGsoIk1lbW9yeSBs
b2NhdGlvbiBvZiBlYWNoIGRvbWFpbjpcbiIpOw0KPiA+Pj4gKyAgICBmb3JfZWFjaF9kb21haW4g
KCBkICkNCj4gPj4+ICsgICAgew0KPiA+Pj4gKyAgICAgICAgY29uc3Qgc3RydWN0IHBhZ2VfaW5m
byAqcGFnZTsNCj4gPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX251bV9ub2RlW01BWF9O
VU1OT0RFU107DQo+ID4+PiArICAgICAgICBjb25zdCBzdHJ1Y3Qgdm51bWFfaW5mbyAqdm51bWE7
DQo+ID4+PiArDQo+ID4+PiArICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgICAgIHByaW50aygiRG9tYWluICV1ICh0b3RhbDogJXUpOlxuIiwg
ZC0+ZG9tYWluX2lkLA0KPiA+PiBkb21haW5fdG90X3BhZ2VzKGQpKTsNCj4gPj4NCj4gPj4gUGVy
aGFwcyBzd2l0Y2ggdG8gdXNpbmcgJXBkIGhlcmU/DQo+ID4+DQo+ID4NCj4gPiBEaWQgeW91IG1l
YW4gJWQgZm9yIGQtPmRvbWFpbl9pZCBoZXJlPw0KPiANCj4gTm8sIEkgZGlkIG1lYW4gJXBkOg0K
PiANCj4gICAgICAgICBwcmludGsoIiVwZCAodG90YWw6ICV1KTpcbiIsIGQsIC4uLik7DQo+IA0K
DQpPaCwgSSBmb3Jnb3QgdG8gY2hhbmdlICJkLT5kb21haW5faWQiIHRvICJkIiwgYW5kIGdvdCBh
bmQgZm9ybWF0IGVycm9yLg0KDQpJdCB3b3JrcyBub3cuDQoNClRoYW5rcywNCldlaSBDaGVuLg0K
DQo+IEphbg0K

