Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD06D643CC1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 06:45:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454422.711957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2QkR-0004gj-KW; Tue, 06 Dec 2022 05:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454422.711957; Tue, 06 Dec 2022 05:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2QkR-0004e0-HL; Tue, 06 Dec 2022 05:44:07 +0000
Received: by outflank-mailman (input) for mailman id 454422;
 Tue, 06 Dec 2022 05:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RuqV=4E=ust.com=Sandeep.Gupta2@srs-se1.protection.inumbo.net>)
 id 1p2Qco-0003Cy-KG
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 05:36:15 +0000
Received: from esa1.hc251-67.ap.iphmx.com (esa1.hc251-67.ap.iphmx.com
 [139.138.42.201]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1d065c5-7527-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 06:36:10 +0100 (CET)
Received: from mail-sgaapc01lp2109.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.26.109])
 by ob1.hc251-67.ap.iphmx.com with ESMTP; 06 Dec 2022 11:06:04 +0530
Received: from PU1PR03MB2715.apcprd03.prod.outlook.com (2603:1096:803:23::22)
 by TY0PR03MB6632.apcprd03.prod.outlook.com (2603:1096:400:211::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 05:36:02 +0000
Received: from PU1PR03MB2715.apcprd03.prod.outlook.com
 ([fe80::a5c9:8183:6812:9673]) by PU1PR03MB2715.apcprd03.prod.outlook.com
 ([fe80::a5c9:8183:6812:9673%3]) with mapi id 15.20.5880.013; Tue, 6 Dec 2022
 05:36:02 +0000
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
X-Inumbo-ID: e1d065c5-7527-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ust.com; i=@ust.com; q=dns/txt; s=ust.com;
  t=1670304969; x=1701840969;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=R8grWms+WPLtj8KDNch9Z0cFzMcJoxYTazox6rFntoU=;
  b=cMwN5u92mpfwhKGgSCvnyNL3+EWpJZZQdms+249M72yxVhpbE/FMwLuU
   g5i0exlkrSgMwD6TYaVCSiUa/SHPM7KiynJbmPJnpljss9dvM/8YF8wQ3
   gkNZbvgSVcRocX3dqw3MGj2fosNOxZaaRbxyngNfsR9PHGjfRCA9d+nVL
   MDDuUEqB2/4ariqrwi/iXX1F1xJVKB2Mfna18FRIiq7ML2J0f8aUMWTCk
   cgJwD8darm9moOnukFNPe8+iSeqIOyqgE1cyx4NhZStaVnR4jtJTv6uPm
   iYcNGnKYi8gZiieRkWrFEu5t6CII7mzwa6FVfsfg3DdfTr2LjOa0u5fbq
   g==;
X-IPAS-Result: =?us-ascii?q?A2H2AAD1045j/20aL2haHQEBAQEJARIBBQUBQIE+BQELA?=
 =?us-ascii?q?YEpgQOBAwK2eQ8BAQENAkQEAQGFBQKFECY3Bg4BAQEZAQEGAQIBAQEEBgEBA?=
 =?us-ascii?q?oEZhS9GgjUihAcCAQMtMgweAgEIBEIyJQEBBAEaFIJjghaBDKJfAYsYgTSBA?=
 =?us-ascii?q?YIUBJ8mgUABiQWIEoJQgViCZz6BBQGDFSuEDoIuBIxzii6BAQc2A0QdQAMLb?=
 =?us-ascii?q?QpFNQYFEUwiCRwbB4EMKgkfFQMEBAMCBhMDIAINKDEUBCkHDA0rJm0JAgMhY?=
 =?us-ascii?q?QUDAwQoLAMJIAQcBxURJjwHVg4EJQEEAwIPIDgGAwkDAh9UfiUmBQMLFSUIB?=
 =?us-ascii?q?UkECDcFBlMSAgoREg8GJkUOSD45FgYncg4OEwNdgWkEM0iBMwJbnRqBboEQA?=
 =?us-ascii?q?ZISjU2JCpkKBgEDg2mgdhaDeIxWmEyRSoV1IKcxAgQCBAUCDgiBPzmCAHCBb?=
 =?us-ascii?q?oFKURkPnDMBPIEwAgcLAQEDCYdGglkBAQ?=
IronPort-PHdr: A9a23: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
 Q==
IronPort-Data: A9a23:OsBdRqpuWVVb2VdR9Xj0/+l7dMJeBmKcZBIvgKrLsJaIsI4StFCzt
 garIBmAO6uJZTb2Lt4gbNvn/RtXucTWm9M2SlQ+pXxhHn4TpOPIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZmO6gS1LPjvyB94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbAXyMJXPXlsz
 N5bNxBWMQuJgbvq2ovuH4GAhux7RCXqFKonkSk5iAr2V7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie8gzT/PJmi4TQ5FUZPLzFC9PTdtGHXYN6g16Er
 zju4n/lRBodMbRzzBLZrCP82rSXxEsXXqoIKeGX3aVSjWHM4TcKUTI0VAOhnP+m3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xAWwJTSVIbtA8g8YwSSY3z
 V+Cn97vBjtHvaWcTDSW8bL8hTS2NCsOJGkOfxgYXBAF6NnupoI0ph/XR9MlG6mw5vX3Fiv32
 CuitzUlivMYistj/6+851HcxTW3uoLOUBU29y3QRGuu6g4/b4mgD6SC5ELH9/9GIMC8R0OYo
 Xkfs8GE6aYFCpTlqcCWaOAEHbXs/PmMOSXX2QdrB8N4r2Xr/GO/d4dN5j04PF1uLssPZT7uZ
 gnUpB9V45hQenCtaMebfr6MNijj9oC4ffyNaxweRoMmjkRZHONfwBxTWA==
IronPort-HdrOrdr: A9a23:stJtwKPxp9L298BcT1z155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Qr5K0tQ4exoWZPwN080mqQFhLX5UY3NYOCighrPEGgA1/qq/9SDIVybygc178
 4JH8dD4Z/LfD9HZK3BgDVQZuxQouVvh5rY5ts2oU0NcShaL4VbqytpAAeSFUN7ACNcA4AiKZ
 aa7s1b4xK9ZHU+dK2AdzI4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUglI3awp/Q
 H+4kbED+SYwryGIy3npiDuBqdt6ZXcIxx4dY2xY/0uW3nRY8CTFcRcsvO5zXMISaqUmS0XeZ
 H30m0d1oJImjvslyiO0GbQ8hil3zA053D4z1iExXPlvMziXTo/T9FMnIRDb3Limj8dVfxHod
 F2NliixuhqJAKFmD6468nDVhlsmEbxqX0+kfQLh3gaVYcFcrdeoYEW4UsQSf47bVXHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQ2TlLm3JyyVce2aUk7wM93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONEWsezAnyle2O9DItTGyWXKEgqAQOyl3es2sRI2AiDQu128KcP
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,220,1665426600"; 
   d="scan'208,217";a="46984301"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt9e2Apnri92QXyFt7+Q92Z/cgrnrTqHQK8MYmIxb+lDj9GJMvyxKg1azH38Uii/Rzv9CyJr+yJNntWeP5kLM1bN9IOjJRg9HX1kvDQwesAfYobveGc9LU5wXbPaj3798ut1RtL/GzDc9AmINv2cKqmPro0L3GCic0EW6iqHqzZx6d0MQIih10Y69b3PfoKacMO05xEktrAawaYYi0ON8IefI82LUIvvtFSCPc/k9Z2XmEhlmzb1e9pqjl0cMJBM32QtBkCQPyOY1qUxRnNl/B5s5BlJVescgKb1jW5ToKd3/hnjbr0s6fQtlwrb5b4Duxbe1fWctABjmJvQST0/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UO8wvGuMxuMAVcUZZi2vQLA5tcnTFh4PL8Bx164OGSk=;
 b=a/vD6x5Jpgw29YIxkcF/wb4ARtRb0165SsWHWftGxR98ELSe+CArRHQhaHxryeDthMxRVw907BdCullM5QQFxnBAxD/a/OgMraxaMOlV3BoRtGsANa5JoLKh/Sjit0yOxx15engdxIl123Xb880tcG5ecxDQGxfsYkfwNRxKMe7UCaGgMmrV5qo/ltkgHrovUkr6Hi6crbYmOxQT0wsb8F7JMbMjKsimnV5HEDUG24bMe2FYetVR+NYu+ZHRT6XTF6VV9NQyyHZBoSGtAKQ0M5KkCwQGCA/c21LuCZK3ShbQZLZh/px93HnOy4Ewd6VFkDiM5yXDCLfG9ZIQXqT0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ust.com; dmarc=pass action=none header.from=ust.com; dkim=pass
 header.d=ust.com; arc=none
From: "Sandeep Gupta(UST,IN)" <Sandeep.Gupta2@ust.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>
Subject: RE: information and training on Xen Hypervisor
Thread-Topic: information and training on Xen Hypervisor
Thread-Index: AdkIqgEPNUSf2mCOSkGfNmxCHFHtKQAijVEQ
Date: Tue, 6 Dec 2022 05:36:02 +0000
Message-ID:
 <PU1PR03MB2715C5D656A2FD6B543B98CCC41B9@PU1PR03MB2715.apcprd03.prod.outlook.com>
References:
 <PU1PR03MB2715442B1C64B30AD867A0EFC4189@PU1PR03MB2715.apcprd03.prod.outlook.com>
In-Reply-To:
 <PU1PR03MB2715442B1C64B30AD867A0EFC4189@PU1PR03MB2715.apcprd03.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ust.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB2715:EE_|TY0PR03MB6632:EE_
x-ms-office365-filtering-correlation-id: 22ede7f1-b607-4e80-572f-08dad74bc381
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 c7fw/m+KKJfbA+fd7hhJ+2spuDe1Kg7lutPuDVGbZ2qKqye3NVQLl4bhgUKjC0xEapLGAY21dbPjSTqKBO7dvpbOyyimqlie67TqmbYc6HIFiWXbJAhIx1Bn40oekyrkbHb3E9cyzwrxlqgxM86pmrF8ZmHpiq6l4GGdvkKYHCG8klGz5f0zUjxqJyEBbfQ7VHLD0hMsoLNnlUlNG98ByoYBX6qK3uLjaJ0E4P0aCIGu8oXNlkQq70SmarWoMj55e0q6n5mjkySSnbZHy7wQMu2/OqwPzxT21S7yYnCSPxQEDbxsfyLtHNXuqi1Va5tdId4DtyAy+v32UyDbYfrYt/fMHF8M401tu6Z3C4kXtEkkk4QeiVEZEVD463W4Mrgcsv0e6l7v6fvOm45EfiVeTNMexVD4iZ1AfZ+H4FW24Wwgt20IZ0Dqv/xG1sA7I8mIr4a3pUuUpQXt/YcqHZzfTcf05iIRVfhOADoIB8P+SRh16WIPzZhEYzNPiIf75PKMzAzNCCZ97/MwSHIk/Dk7iTStYSAJlor1ZvMHyz3qoNIgM7iqcCEQU61kMPhVM8zPb4wDAsAIe5oQKEZ63TrYgagOwPZlkyGQnrjht8JHC/O388WNU+GUqR+l+7P+fcMapIucrTvV+w1gAICq2IeqElArZwG50a1A7e4a7JPUjZpWFDWuq1Pow8Js4Mrk2MGNz+xibccvvIdvNtvCrgl/VFmwg07cwS9K1+gSUDiJ2R7uL1RUI3hXng+wCYyXMrmw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1PR03MB2715.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(2906002)(71200400001)(38100700002)(6506007)(110136005)(5660300002)(316002)(122000001)(86362001)(7696005)(55016003)(38070700005)(9686003)(41300700001)(26005)(83380400001)(186003)(52536014)(8936002)(4744005)(33656002)(76116006)(8676002)(66446008)(66556008)(478600001)(66476007)(66946007)(9326002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wHrefK+n/yxIrPL/gLK8G6zDw0wNDPgUkUdzPtYumD2rTccNuBs8Qefa429F?=
 =?us-ascii?Q?qi2RxMk7JvjPYzdgaQUR54MrA3s5PuhO5bzi4p3YuSGWppunwN9dYUX7KD1l?=
 =?us-ascii?Q?+xp9DymmEJ4XJTjaMoc4EYZ/7zCmCd4muzDTaP2SnHgHTofex++IxkUN9XLB?=
 =?us-ascii?Q?XewiTZawLM5LGIA2m95lo/PurnJ5Vxfx4OnTRLtf6EN8aHVQYN01oLP6wI4H?=
 =?us-ascii?Q?IJ5jfdntqcmD6B1N8iKRYvsOIemeOeTN04zzFw0Wh8WZA36bBteB9Qrk9f/+?=
 =?us-ascii?Q?StlzleiIpEBTE2JcFwN64FFln9fKcT2zCt1NCff21lMm7lAdTVAMGP0hVwoC?=
 =?us-ascii?Q?RaGf6Xrm2VXoPcc6dbPZ75sh0EoNTOSlPh528AGOI7ESRPMXsP4QT3qzUiaP?=
 =?us-ascii?Q?T7DjzDIHuHKDbJWqvXmqHul9WzWxewM+qn9A0yqzzAih//wpH8fgd+QkGWVE?=
 =?us-ascii?Q?gyJv7I45EP00B0J698lwI3caQvzPmBm08QmeAItoI0enU0znnbcTgs2je4sn?=
 =?us-ascii?Q?AA5kJtDLchLc1vB4V8KGpOxhZlOSHMKj1RpN7S75hP6PL5oV1b0wTwAWrCxa?=
 =?us-ascii?Q?l9qrQPPlqtaw3kY25fYBCEUjwS8uMKLW+Kqo3/3TGzhmxnGTPtyo3d+BSCzH?=
 =?us-ascii?Q?tPxMQ7sERYHJDSInUwc1HRbxghbWLOTPoshJBEzpBZyLUI1+Mcuj3FDhsx2n?=
 =?us-ascii?Q?HsfwpIR95lHTtkFFeF1IMD/4IWFvAuV7MJWAqSro24TFFOBMyjCKTP8+RvFp?=
 =?us-ascii?Q?iBW9TajFKPjGnmpnn9MlVM9QVg65iRtxP9Gh4+z3Q6Gshd2GKcq7oAJyrr8j?=
 =?us-ascii?Q?XS0mTF6Lo7Zw6df/FTrDM2pdu01aQ4AQ5OWRG8jcZohfNVZwGRauBbb2Qe0O?=
 =?us-ascii?Q?zNqXYI8OUI/OZtvmb+J6G+pof98h9AI1QYrAcEoxqN9ERjjOIsi6lKzMB3wX?=
 =?us-ascii?Q?gfMI7aks5D5bTLMu8QzRhRiUg9hB006/4J33CxduZ7s1f62i0KYq+UckOUDi?=
 =?us-ascii?Q?amvvbwenohloTbbLh6xGsXuWkW/Rdm6XA+tQRQCiFZlR343xPoJkqqqGch+d?=
 =?us-ascii?Q?mHP12xeq+sRR6Q2IWc4J8RNm0DBF/oVr6cTFLJ7LpZc21SJdfH/VPnGZ+1hA?=
 =?us-ascii?Q?7tpx+/euI+Ha9l5rPz2KOpdA0QbsEqI5w+r2Arfc1pTh5qdqJ2bxCI1jbZG9?=
 =?us-ascii?Q?gFTs1ABbDEP74Tv4mHv47iTWnS8f3ss47c9GWlOumGR92K+XHAxWs+uutLgZ?=
 =?us-ascii?Q?Kfe7r9JFg64rn9FGZ2Rg03qaa9SwKiZE/EI4kJn8CQC3Nt8BLac1T5TxjGjN?=
 =?us-ascii?Q?2JSW7OHyfBsf2fDCdkGx7QncP4mCwdUw4CJA9N6rR+fVeOaemqr/IDUeyLey?=
 =?us-ascii?Q?Lyp3SNdrVjEl0nGwdPJAUNRGtDWOEwWlFhK7Al/bPNyMgw2JuI3P4n2gLkXf?=
 =?us-ascii?Q?6ZOqr46qEceML+1dYTARzLiiSRp/gqtzu5AgDIG/RzKPMe6Q2b4E801b6eSg?=
 =?us-ascii?Q?8lolcoKQceGljg7f4zUuK3bDvGtUbXTZe3cEkJtS6IjMIXwFXcUcTKlKdiIE?=
 =?us-ascii?Q?9Tro4xDgH1C7F9XCcovD4oUG9ZH0RjIXrLvED0XB?=
Content-Type: multipart/alternative;
	boundary="_000_PU1PR03MB2715C5D656A2FD6B543B98CCC41B9PU1PR03MB2715apcp_"
MIME-Version: 1.0
X-OriginatorOrg: UST.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB2715.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ede7f1-b607-4e80-572f-08dad74bc381
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 05:36:02.8430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4431f4b-c207-4733-9530-34c08a9b2b8d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HX3l6FACubryp4ykD+HnHm3wXYRyXzOkITNq7XdrJWFst0EjdBtdePDilO9yjehLBhM3HKUNRnu+b1Dn4cQZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6632

--_000_PU1PR03MB2715C5D656A2FD6B543B98CCC41B9PU1PR03MB2715apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We are planning to use xen hypervisor for one of our in-house development o=
f project. Since this is in-house project we have limited budget. We are fa=
cing some difficulties to bring-up drivers since we are new to the hypervis=
or.

Can you please suggest me some sought of training or support from the exper=
t who can support us within our budget and who can train the team on Xen to=
 overcome some difficulties.

Thanks and Regards,
Sandeep


--_000_PU1PR03MB2715C5D656A2FD6B543B98CCC41B9PU1PR03MB2715apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are planning to use xen hypervisor for one of our=
 in-house development of project. Since this is in-house project we have li=
mited budget. We are facing some difficulties to bring-up drivers since we =
are new to the hypervisor.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please suggest me some sought of training or=
 support from the expert who can support us within our budget and who can t=
rain the team on Xen to overcome some difficulties.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</body>
</html>

--_000_PU1PR03MB2715C5D656A2FD6B543B98CCC41B9PU1PR03MB2715apcp_--

