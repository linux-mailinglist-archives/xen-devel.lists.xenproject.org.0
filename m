Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E767603B27
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 10:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425636.673582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol4AM-0006gK-NR; Wed, 19 Oct 2022 08:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425636.673582; Wed, 19 Oct 2022 08:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol4AM-0006dI-KV; Wed, 19 Oct 2022 08:11:06 +0000
Received: by outflank-mailman (input) for mailman id 425636;
 Wed, 19 Oct 2022 08:11:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GAs9=2U=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ol4AK-0006dC-I5
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 08:11:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2073.outbound.protection.outlook.com [40.107.105.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92eddb1f-4f85-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 10:11:03 +0200 (CEST)
Received: from AS9PR06CA0416.eurprd06.prod.outlook.com (2603:10a6:20b:461::10)
 by AS4PR08MB7685.eurprd08.prod.outlook.com (2603:10a6:20b:504::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 08:11:00 +0000
Received: from VI1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::5a) by AS9PR06CA0416.outlook.office365.com
 (2603:10a6:20b:461::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 08:11:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT053.mail.protection.outlook.com (100.127.144.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 19 Oct 2022 08:11:00 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 19 Oct 2022 08:11:00 +0000
Received: from 13fdde4679ae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B988705C-4338-43AB-906B-E46A57A842A5.1; 
 Wed, 19 Oct 2022 08:10:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13fdde4679ae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 08:10:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7632.eurprd08.prod.outlook.com (2603:10a6:20b:4cf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 08:10:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 08:10:50 +0000
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
X-Inumbo-ID: 92eddb1f-4f85-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D2zsURfvCc8qVkvOMJlY2OXPdgYykH34bB0fcpVlLiF5jLA1ML5+27puayrXSZr1nxZnMtdZchsV57e3InZX9P2azHGSgygNn1BnthSdvQrWUX/QolIxSjuMs+r5GWftxKRBe1xf4nqFivcHgQLgM/uO1zsd8b93zg+8t6MrhCvo9MnSEpkj1ij5LvNWOG8QEIKYMPDNBUfZfMDCoCOIdgz/gUZSuJg4o3o0FbarCaUFVRnYO4T0WW9fjqaAAGESur3gFhMvKWEVIkBKVYFlW06VJU1x0n6y6OFIQ6lC28cKndjscLGI0DFKWbLnjv1bUy5tB/Hos5hOGwj7bztUmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtGb7538Cx8y2U4c/1zdE7k1Q7Ac0s9VsCZsLE3gk6g=;
 b=aR1ZkkvOhBlx5F+p3bF1rSap4FMWZAmdpFSxFJ7lix4iWmGFBJC3PXLTaFAIv6cMHdWqnraLTrKEEQycddHsdvxo9cNppEP7DugVKvtTfA8w7tZQi7mr2Q/IVBCf2RYl/EuQpHYW5uEkQMiBsZhUMy8uEeVeqnrF+1UjMFeTti1dI2VUEVdF46zH7qgbPqd7IlRzKE7047Qbc1IvQahgAXz0XMdIw+VYBsU/dG1U9SZvSpVz/bAJCl5GhRDTmOZ0ZZmoohNQpB41pr9XIT4HdB7dxHjeXhy4JbAIZIXJ3nGl4p56FOFXAgB8Zvar3oIA8+0f+v1gK/KSB1xvpCxrEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtGb7538Cx8y2U4c/1zdE7k1Q7Ac0s9VsCZsLE3gk6g=;
 b=IF4CDd1emiTKeXgGl8eFsha/gha2JWObCOhgU+UobAUp0GN+g9OOFsfZSYHgqbo0vZRz1XpVfNoEJcgtDiSmfWNxwonwMGdVtvFGfSzGSUbEe5pEJLPHkh2I6CUOO0IDlM13FJW5naPZBeOTnENyIOaTIjVHhWGfRplfALl2Ce4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 447a7592deed8a0d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mewOLLt33gpDH0uL6FCACeHvKeLa/rEjS78IKBr5vOjovDjCVcnB3m7WEDTCA5roFWZzRZQwFt69FXAKGZOIjVCQgRe2/bPO9B04qYN2IfacvpmPN+w/M5tJMGpnGw8/QTVueVBN6blk0BhCPynnONDxs+nUwn1tEef/2p5M0Cr2wRcawke2FxCwP580tZeHMmQ4zlq3nIoo43GpB7aDuw73erkl1iUTkBRuUaYgbJXzGsdoDc9f6xHGTREjEZt0kAO/nfoJZi2D6onEqtuNewaHKZFkpr/id9JlgOT2f63Pfi5GLfl3JFRti9zDzp3jOBF6/WD8TwPGodFNDWSZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtGb7538Cx8y2U4c/1zdE7k1Q7Ac0s9VsCZsLE3gk6g=;
 b=O3OYBb0sCrw/Eg4Jzw+eA/0Op+922cDwHIgJ7U/elFgErGJI9lw8vbCOJrWbNeYjZj+gvTD97DEvwlfIJya2EE0eiMLr9iwEqaSjERYvSNJGZOpuOdVlZUZJkd0etlzAuNzIDqOBS46X38MNjXdfLtAEf0tJsRXEJlq2MTMqvuRJrfnDiy3C5Qsiig1g7HIEEXltoBY58RKIwD6I9JcedQhuhIdLmmCr3seXSH0/CNMRixoUdeYan+90zazlU+7wboz37TTZePSD0ZpEo2BLUyfAo1/HnxxdWRy4CMxdIv1bV2ijDqZxPbLOsYd7KOmsu0f4YWVzVJDox1daWJrbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtGb7538Cx8y2U4c/1zdE7k1Q7Ac0s9VsCZsLE3gk6g=;
 b=IF4CDd1emiTKeXgGl8eFsha/gha2JWObCOhgU+UobAUp0GN+g9OOFsfZSYHgqbo0vZRz1XpVfNoEJcgtDiSmfWNxwonwMGdVtvFGfSzGSUbEe5pEJLPHkh2I6CUOO0IDlM13FJW5naPZBeOTnENyIOaTIjVHhWGfRplfALl2Ce4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
Thread-Topic: [PATCH v2 0/3] Yocto Gitlab CI
Thread-Index: AQHY3hEMDLhOM5SRDUy6m8XkPQoc/64OWrqAgAP8xgCAAQ3WgIABes6AgACIUwA=
Date: Wed, 19 Oct 2022 08:10:50 +0000
Message-ID: <49FA68FE-43E0-4FB0-843D-1C4F744E778A@arm.com>
References: <cover.1665561024.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
 <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
 <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB7632:EE_|VI1EUR03FT053:EE_|AS4PR08MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 0762fee4-1799-44f7-c783-08dab1a9755a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 er6ZZHc9tnDikf4XHaicwZLanvqCAzzMa9wwe+VUguDVAerPo1mjCWVxXOgOX0s8MlFLXBu3byQkLp3MGfoph3KhhkHFilK92Gwj9D+19MzQGx5jCr0S1njNBQ45cynapUCBamntMGpyGKQzQ4GrfrQFUvr03oSNPwFeZh2+vgKFJEC1Bp42WF9/sU2jk0342mv4qZlrZSNdqTjo2i0b0upxadbaWdPvVzTXbwBHUULGmDjjXEhMMCTkAZw3O+y61TntegCFkEaqJvWUdGvTM0n2PFpIha7OO2kdyiq9GnDJ/b/uy5+HG/LY+A2Uq0ez3lDNdRjGXFD7CvoLt4JYcRNYUkVkc0/kcTAZQO2CuUySnxwE780E1x59A+wXqlOSfYq2jVjOgbzHV+NySsyouapIW1kEOx/aP05ZmlUf7Gbe4xgWgZ5JHPS+PXhJ+DypKBFpdrikU55HjJsh8A33F75CkTEV/2yMP8yXJS1m0HGHHp4r6LDSUruYFRon+SnlXzqY4lLrP001D7WzYxPhiuhKJh1cHfiR2TuxKk03x6o0C34yTmJpSdMl48LsR3cz+Ggl4COqqwuFVrjr7JLSL0pXN+hShAPVszfJNxGuvFTjm9PNoACnjBSV0nR4UwS03CMSdd970Kt/cvd3YkpR45zGOF0O/0z7hJji3a2N956dkXHRK++t9TrMldqkjWsVmMpSGkR5X0+qhSsdKilL4sgdDUnH42A3gPWqfvkTSJJljNpk/ZaAOLRu2OSlrjHYnqseNih9fw/EWOAZaB2WkmuNyT7M5KKeApHpcHAVnUqdRSr4F/317PH85rHXDaOmYa5sR0LIggvAkfkPInv16wJoRzvgPptin1NZPYE+A8Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(478600001)(38070700005)(36756003)(6506007)(5660300002)(83380400001)(966005)(6486002)(76116006)(66556008)(64756008)(66446008)(91956017)(66476007)(66946007)(4326008)(8676002)(8936002)(41300700001)(86362001)(53546011)(6512007)(26005)(54906003)(6916009)(2616005)(71200400001)(84970400001)(33656002)(122000001)(38100700002)(316002)(186003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEE7B4F9BD9CD44AB2243A45B0B202A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9a601ff-9e14-4b01-e5af-08dab1a96f87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YbLAZGHS03xZyFANpGI47sLxRh+Os4F6nERv3djsJeJnRx6uhLMLxicol89roiXK5cVxN2OnCq7EiwWdDFGPeqj5eu8KBRwHSmhBX7WUCjGQlJEhG6++Eqruifc7AI05VGzkg0lZGHjigVFHL5vXeFvZEL3eMSjU0j1seb+nd865yvQnn/oQbl4NwfTiQKRNhKTuMQbImwpw4zgQIOtgR3NatKorZi8h7Qp+ofQuKLKF399OYltRcEt7NnZ1tUzrtPKoFfrefLF7z/yxUBz9fgxDwtWlshMJdMzmp85wdruA9K8dVdo2m+091prP6pMD2Wg8CXzmFLjkqF9indx2TQpiQmIFgl4L64CVrZwTJ6Z90CDGq6igLhngJ8BepGJLva+sY1xa+UIf4nUKX0K/uDPmd1RZ2xy8wBiZtfnq3vj0isq9IoSxleXo/kA2E6AOu9qNDykMQ1lIm833aJX4FTh08VHw0zO+oVEi7LJrVF7ez+Wr5gKagv5gaMq3lQGM3Tb0T028E6ZGY4w7Ihh8LJLwvo2ct5Tl7V22GFSPzqUIt4KUN6Q4DujmD04o7tXEHYSKq/qDnQq/ba/AfJRZo5jzQOnC3OzKyuEdYCMlCKgeLVRZeARzQ+mfmtT3aaHdOjb+mRTnIk/kyAre9PSW/qNLU6VHkcydIwV2kRczuIvXGIEqBQFQYqveBtCURW56doEYw4c6cC8FvnPgEwuDc5LF4NEWka3nLYXnQaOyA/EoejEzsMPoif/egrhsKVGDgNIYP/F/NIoxK1xbAIZOlJuU7YRt0W5/WbrNmp7usit1OhuEBJLDpJI9DnAXqc1+hRT4HuePY25Ex7Pz6Jd1HA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(2616005)(26005)(6512007)(6506007)(53546011)(186003)(36860700001)(47076005)(2906002)(336012)(5660300002)(40480700001)(40460700003)(8676002)(6862004)(54906003)(41300700001)(316002)(478600001)(70206006)(8936002)(966005)(6486002)(82310400005)(70586007)(4326008)(83380400001)(86362001)(36756003)(33656002)(81166007)(82740400003)(356005)(84970400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 08:11:00.1725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0762fee4-1799-44f7-c783-08dab1a9755a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7685

Hi Stefano,

> On 19 Oct 2022, at 01:02, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 17 Oct 2022, Stefano Stabellini wrote:
>> It should be
>>=20
>> BB_NUMBER_THREADS=3D"2"
>>=20
>> but that worked! Let me a couple of more tests.
>=20
> I could run successfully a Yocto build test with qemuarm64 as target in
> gitlab-ci, hurray! No size issues, no build time issues, everything was
> fine. See:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/3193051236
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/3193083119

Awesome, this is quite fast :-)

>=20
> I made the appended changes in top of this series.
>=20
> - I pushed registry.gitlab.com/xen-project/xen/yocto:kirkstone and
>  registry.gitlab.com/xen-project/xen/yocto:kirkstone-qemuarm64

This should already be handle by the Makefile using PUSH or did
you have to modify something ?

> - for the gitlab-ci runs, we need to run build-yocto.sh from the copy in
>  xen.git, not from a copy stored inside a container

Ok

> - when building the kirkstone-qemuarm64 container the first time
>  (outside of gitlab-ci) I used COPY and took the script from the local
>  xen.git tree

Ok

> - after a number of tests, I settled on: BB_NUMBER_THREADS=3D"8" more tha=
n
>  this and it breaks on some workstations, please add it

I will put this by default and leave a command line argument to have a solu=
tion to change this.

> - I am running the yocto build on arm64 so that we can use the arm64
>  hardware to do it in gitlab-ci

I tested this when I made the patches and this works for arm64, arm32 and x=
86 targets on an arm64 machine so go for it.

>=20
> Please feel free to incorporate these changes in your series, and add
> corresponding changes for the qemuarm32 and qemux86 targets.

Will do and I will also add a patch to create the build.yaml entries.

>=20
> I am looking forward to it! Almost there!

Me to :-)

Thanks a lot for the testing and the review.

Cheers
Bertrand

>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yoc=
to/build-yocto.sh
> index 0d31dad607..16f1dcc0a5 100755
> --- a/automation/build/yocto/build-yocto.sh
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal =3D " ssh-p=
regen-hostkeys"
> # Save some disk space
> INHERIT +=3D "rm_work"
>=20
> +# Reduce number of jobs
> +BB_NUMBER_THREADS=3D"8"
> +
> EOF
>=20
>     if [ "${do_localsrc}" =3D "y" ]; then
> diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/auto=
mation/build/yocto/kirkstone-qemuarm64.dockerfile
> index f279a7af92..aea3fc1f3e 100644
> --- a/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> +++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> @@ -16,7 +16,8 @@ ARG target=3Dqemuarm64
>=20
> # This step can take one to several hours depending on your download band=
with
> # and the speed of your computer
> -RUN /home/$USER_NAME/bin/build-yocto.sh --dump-log $target
> +COPY ./build-yocto.sh /
> +RUN /build-yocto.sh --dump-log $target
>=20
> FROM $from_image
>=20
> diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/bui=
ld/yocto/kirkstone.dockerfile
> index 367a7863b6..ffbd91aa90 100644
> --- a/automation/build/yocto/kirkstone.dockerfile
> +++ b/automation/build/yocto/kirkstone.dockerfile
> @@ -84,9 +84,6 @@ RUN mkdir -p /home/$USER_NAME/yocto-layers \
>              /home/$USER_NAME/xen && \
>     chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
>=20
> -# Copy the build script
> -COPY build-yocto.sh /home/$USER_NAME/bin/
> -
> # clone yocto repositories we need
> ARG yocto_version=3D"kirkstone"
> RUN for rep in \
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
> index ddc2234faf..4b8bcde252 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -584,6 +584,22 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>     EXTRA_XEN_CONFIG: |
>       CONFIG_BOOT_TIME_CPUPOOLS=3Dy
>=20
> +yocto-kirkstone-qemuarm64:
> +  stage: build
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  script:
> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=3D./logs --xe=
n-dir=3D`pwd` qemuarm64
> +  variables:
> +    CONTAINER: yocto:kirkstone-qemuarm64
> +  artifacts:
> +    paths:
> +      - '*.log'
> +      - '*/*.log'
> +      - 'logs/*'
> +    when: always
> +  tags:
> +    - arm64
> +
> ## Test artifacts common
>=20
> .test-jobs-artifact-common:


