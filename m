Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E7607E94
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 21:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427951.677601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olxGv-0007hg-CE; Fri, 21 Oct 2022 19:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427951.677601; Fri, 21 Oct 2022 19:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olxGv-0007fO-9A; Fri, 21 Oct 2022 19:01:33 +0000
Received: by outflank-mailman (input) for mailman id 427951;
 Fri, 21 Oct 2022 19:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mzs=2W=citrix.com=prvs=28632f022=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olxGt-0007fI-QN
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 19:01:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4152db6-5172-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 21:01:29 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 15:01:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5430.namprd03.prod.outlook.com (2603:10b6:5:2c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 19:01:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 19:01:01 +0000
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
X-Inumbo-ID: c4152db6-5172-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666378889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qilwvmJ6SzWIy26zLCXFDIh2qV9fRmIr13OxR7GzFEQ=;
  b=SeCGV91ErwolBbo0QAx8nYF8RS6kuVIQfvbetknWh9w6UqiGf8OXS7R1
   /mULtHLZBHGvUOcbkVbwRUxDowS1s7DS6q1tBLTMn/EuXjBdYulCHiBiO
   /UuCC9BYSpWBu/1zSDOJfmH821Ys9CVmv8jEmrqbnFLWapCtpnOoz5RKJ
   Q=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 82377226
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XTUnk6jyB+8mwklYWfOfF5nWX161QBEKZh0ujC45NGQN5FlHY01je
 htvW26FOf6KY2bwLtF/Pdvl8BkBu5WEmIJrTANtri41QyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmP6kT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWVO7
 +MCC2ogVx2Ou+7qzLv8E+JQ19t2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVIhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurAtlNS+fiqJaGhnWrn3BMMw9KbmK24uu90EvgfvFvC
 hAtr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0qTSs45SfDlyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CAs56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:q0yrjK0HxvsmegWU1QfPKwqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTPYd228LAu23FQgMyNeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.95,202,1661832000"; 
   d="scan'208";a="82377226"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGwVpFqf8rhf6hfQn26uzzkg7SepbxpaQKLLu+OauCOqvAAKFEmpjBFqQgtfSokbkU3CXmdhxaIMxFWvTVgZJDoUluft6SE6oJMdMUECwpTGi1PdZBGisN98xrGH3CaXrDcMIqaMRRBgpynZeMgDcO9YHO3XLo4l3+R8IJ2nKxQr/jc9R+vmhW6Sy6pYfr2gkTCxYmfV5X6xua6yNODyDucqYEsLYigh3vzPxRyT4uYzoz858Thv5WZ+Y11dXTvJlZyH3lGcdPKgHjXPzhJlmQ3o83N1QN8yKNiVpOgWNh/7qhRQRDmTsp+zDHjkpTes1gQ+AHM/tmc19nhvwU6hSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qilwvmJ6SzWIy26zLCXFDIh2qV9fRmIr13OxR7GzFEQ=;
 b=jnO8bVMD2Jiwx2dJC6Az24E68QixEDquAan8STcXtgLFlDYGVVLRuNXdrGrMyUwV+KfcDfUyTBSOH45uFyuRg3S9yN5K5DRj7IDUnCEPXDatNjBshb3IQELjJwPxPUlPvvOcbmnMF0Nr2GR6hNzhDbkb3gdzLk13+xJ8BMx2cp+L0G0nrHCRwjZ22wJzUdGKDQXe+K5ztGVG6iX+rnbdJa+GQ5hTn+eXuK0w7a0iemuINX0vP/WV6UnVhXCKB+74i0+u51qzivk60OUWdBzhsSNNv3rbdnB25JRO3BdCuZ/mBtH6gMiTk33bbLUc5Sf81AExVv/nEphA4+7pq64zpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qilwvmJ6SzWIy26zLCXFDIh2qV9fRmIr13OxR7GzFEQ=;
 b=pawym1VvGWwIk1fh+oqsLoS4AyN/oKfHF3Fe1zhuHta1Bx2XEj3tbcKC3VZu6jK0roqawXK5jZbyun02bG3IiP/2Zsn/HRxO0iQ2Dbniy0LTDyTZLk6BEIJHRL2D82TCYBjT+LCmL55mqzQWlXEq4fYE9yFn97Qfnm+f8+uAiLs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17?] test/vpci: enable by default
Thread-Topic: [PATCH for-4.17?] test/vpci: enable by default
Thread-Index: AQHY5G6FfAZD2+fTa0a3sP1MAXO4Za4ZNg6A
Date: Fri, 21 Oct 2022 19:01:01 +0000
Message-ID: <ba118539-4c07-d03a-9b52-a7a45e3d16f0@citrix.com>
References: <20221020102706.29267-1-roger.pau@citrix.com>
In-Reply-To: <20221020102706.29267-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5430:EE_
x-ms-office365-filtering-correlation-id: c7e1c821-5012-4cb9-c35c-08dab39698ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3lukfrO0/WCNNDYq8BUtAkk6xk1w9HWelbjvPVCPuv+SgE72cmd1x1+72IqLQd0gnx6w0H+q5UQvmM+PXifPW99DI76CpIHSTn13XMoVRprtroRXlSdbOyUFYTdK5X7VYFB3qDGxmJhxfPh+mjbYOMTel2VmmQCgKJuYBlnodcUnPrjw6iKdJlcIhylo3eGV+nzbrIeVlUQMCFNlmgzL98LQk6M1F9QyOQuPYuAdIgaiK3KI2Lbrroxh1AhZAprAwENpqv9OAsbDgv/Y5n3EYoXhAPcNWvs8wbfKVqyRaQH5+biic8OZHqhezbG1DTOURfQWZlMvLFuU6vcQQEZzgxd1pZ/Eamk5sDb4hoNwvCYIIWn5RZA9uwo6DeOa99Z1Bm7ezDx4xCLT8e4KJJUdefZmJlrtCw64Lif6LE1/5Vw9chOjW3bNs1QKcUcDfntrzxjzONLINpojA2+4IgePqkACysg4EgIgjBwWL6bq0PVpA+z01amL3B1uRB59BeKFn2Q1o1cShjBGmF0Qk0RnutunIUzQ2PtwMQTUf0iXylt6Ux7OXdbHrVFP0VGXHMf5sWkaj1zFcGHvRChMMEpPFADX2FCFBvc6lUylLaLnzwe38qrh/Fop3+fHRW8lrK8ZOkh9WcTpYqnEXcIhBOhR1A2HiiKJa2BSbNRqw8lP/hj7OTLcLrGv8hvWuO1/f113LvfJT+b6LkzofKfBX5l/4sSTwiNFJbMwKcS6U3Fvu3eu5lxsbS+LAtaCyLhL0ayqOHvLfNFMCayKPITs6DBmACQ7TBls7iPeenr0Gur3kFlrY7yIKkWoZKScFFHxp1ngupKMADwWWH2xBLhS7NNYmQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(107886003)(66446008)(4326008)(36756003)(110136005)(54906003)(91956017)(316002)(6506007)(66556008)(53546011)(8936002)(41300700001)(64756008)(5660300002)(38100700002)(122000001)(38070700005)(82960400001)(2616005)(186003)(8676002)(2906002)(66946007)(66476007)(86362001)(31686004)(83380400001)(76116006)(478600001)(26005)(71200400001)(6486002)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REJXbnkyb0xuNlRTby83NEVLc0lPQTBiMlYrTkFIRTZNWDZnczEvOTBDRWVu?=
 =?utf-8?B?bG01M1hUODZQajNDbTRQWGpveUVweWo0UWNFeGpnTnozVktwWHhNcWw5akZR?=
 =?utf-8?B?Qmg5clZZZlVlcnB1UWc4bXU5RmU1ZlZjOWZyTlJzNWZMVzY1U09uSXF0NG5k?=
 =?utf-8?B?S2FqdktQdG9qamJONktza1c0UTlmUTRHTXpiUFB6K2ZkeGVlcnB6SktvaDJ2?=
 =?utf-8?B?SGs1UDVOdVBjQ1EzNW44cC9DRjVTTk1hdkhsdlhDMFVRUnBVWWRFWHBueGVR?=
 =?utf-8?B?ZXNESmVhOXp4eUNlL0U2bk1XOUJOWjZueU1sN3RDTytsaThSdVVGNkZoa2lv?=
 =?utf-8?B?SGRaTExQSWczK2IyTU9qT3YyWmJ1a1VXbDh1dktOME5SS01Sa3p0SXMvOENJ?=
 =?utf-8?B?UHYyWkZLK1YyV2xJRWwrTXNsckV5SkxHQ2Y1VFhUK2VjQjlEdFpKVzNncVR0?=
 =?utf-8?B?U0E0OFMvTFBtVCtDa2cxSWN4dlpIYitPQWhObEVZUkZLbmRXbUFXU010UWkz?=
 =?utf-8?B?QTRLYVBqNVRWSGMzNE9oZlBLSVpEdU1QNmZIVnpoVVNrdGlXaEN4SUhZTTdv?=
 =?utf-8?B?eHZmTzRiMGR1SU1GeExmUTVPK3pzK2xiY1dDUWNrbGJPdjVObEwvbmltdlFs?=
 =?utf-8?B?cnRtclpXcVhxK1JCVWZjK1JVQTdML2tEbXdFQVZmV25TTEJxeis3TEdMeVpC?=
 =?utf-8?B?cW1uWkIyNWU5cnBVWS9JYzZtKzhpaHMrakdXVjNUUVp0ZXFxVVc1c2FIQncv?=
 =?utf-8?B?NG9LdGNnUFNSQ0FVV1dsckhtMFZSdlhtY1ZtMmQwTFpsQUlDUER2R2NVWUt0?=
 =?utf-8?B?Sk9BL01BdkJnY0IxZ1VFNnRjNXNRelZaRUhiRTNWN2FBeFdpcHk3aW12ZDZY?=
 =?utf-8?B?S3c3QUNLcm9TUkxEa2ZZVzdnbDIxbUxmSjhEVUtFUnRReUZFVEszRWdnNmh6?=
 =?utf-8?B?YmpBYkRsb3pZdERWSm5iTXhwdld2WGQvN1UxZXlobkJNOU5EaGhPWVpHRkJX?=
 =?utf-8?B?NUJyVTNEN0s0QkE4Z0NGdG05UzhYNUEydjNEMHJBaTUrL1N3dFZHSmNpTE4v?=
 =?utf-8?B?TW9nMXhsZ0dMdWVyNlNQRnlvS1EwU3NTYjN5dUdITm9KQnRndXZOT3pybldx?=
 =?utf-8?B?NlRPcUV3U0Z4WElielVVTDNUTFNyMEprWFQwYzl6QjBUUTJqRzRKazZJQnZI?=
 =?utf-8?B?ZVVRREE1OGExZ2FkSnozb2FPWDdxdTlyNEtZZlNrUERLWmUrci9sZExNR01D?=
 =?utf-8?B?U1M2djBBWkJ4YXpEU0c0Q3BWMUdFdHhiR2RaYWhSanZUWkQxNnFOUWJzRXNB?=
 =?utf-8?B?dWhDSVpxazlqNUhFRldoQmpaZmMwWWt5dkVDSlpFWWU5WFlwTHhXYU5GMFNj?=
 =?utf-8?B?azZLaDBMS0gzaUJ5NVRKQUl3eFNIc3FqMDJ4VWEyWTcrY2NjenR1RjNRYjZx?=
 =?utf-8?B?TlFkck1vb2JkT2laRGI0Mzl2cVM0Szkxd3NLZ1BWalFpVGdsUEhJNytmdG13?=
 =?utf-8?B?K25NNHZkNFN4Nzh0R1dRQVgvM0xRTmQxSDlmOWVpcmZLUktrUlBuNmJwRlhy?=
 =?utf-8?B?Zmtib0ZFY2pMVmFxbHZJVmxSUldLKzhBNklCdUlKdUZJb3RhRlJlRit2OFU4?=
 =?utf-8?B?eWNoeXFValk2cnJ6ZHRHejRPVExiVzhnQXNqZFFPMytmNlAzR0RuZWM5MUFh?=
 =?utf-8?B?Y05iblNCVCtMSHRSamhDb3BRcVorVHhPVWw0eVJUVkoxcTBIWlFUcktsVHAv?=
 =?utf-8?B?MW1QcU1NNklDdVhETndqRG9QTnBOclpaWE9iUlJBa051WmxWU3lWMG00UnBW?=
 =?utf-8?B?MTdEdkRTU0YyeE9BZ2tLMEdic2IwVzVRU3d6VVkxTEg1aXpCSFY4dmtlMEpJ?=
 =?utf-8?B?MGdHUlNoQnlFcy9WS0R0eVZESzJaVU5yUEszOGpzd0VyZmJUeHZibnJOWnJ0?=
 =?utf-8?B?OWNnUmliMjdIbENnZld2ZmJZZjU4ZFVVQmRjM2hGcURpN3RYT0lrYUNGYXpZ?=
 =?utf-8?B?d3FzOTIyL3d0K05ic1RxM2dacWRZbDFoVDV4Rm5vY1NpYjRNTXlTNngydzRQ?=
 =?utf-8?B?Z3h1aGZCUzViaXVZOXhhTU91VWIwVnNucGNUZUdFWTVqSjUzbjlVK2NWRXBU?=
 =?utf-8?Q?HUlIVeDe8pzZyYY1lbSrkoRSb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8CAD264BC2BED4393D167C842046582@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e1c821-5012-4cb9-c35c-08dab39698ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 19:01:01.5925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obLaO19H93+PTASok4vj7yllciG7HzKIMnNAWVybpYLjnbhQ9PcBcfvj0F8ccwXNhs7NW2UX3cAMypmvtJxsQN4q5V3aDTY5Hc0SXv1dAWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5430

T24gMjAvMTAvMjAyMiAxMToyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDT05GSUdfSEFT
X1BDSSBpcyBub3QgZGVmaW5lZCBmb3IgdGhlIHRvb2xzIGJ1aWxkLCBhbmQgYXMgYSByZXN1bHQg
dGhlDQo+IHZwY2kgaGFybmVzcyB3b3VsZCBuZXZlciBnZXQgYnVpbGQuICBGaXggdGhpcyBieSBi
dWlsZGluZyBpdA0KPiB1bmNvbmRpdGlvbmFsbHksIHRoZXJlJ3Mgbm90aGluZyBhcmNoIHNwZWNp
ZmljIGluIGl0Lg0KPg0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBXaGlsZSBub3Qgc3RyaWN0bHkgYSBidWdmaXgsIEkg
dGhpbmsgaXQncyB3b3J0aCBhZGRpbmcgdGhpcyBjaGFuZ2UgdG8gdGhlDQo+IHJlbGVhc2UgaW4g
b3JkZXIgdG8gYWx3YXlzIGJ1aWxkIHRoZSB2cGNpIHRlc3QgaGFyZG5lc3MgYW5kIHByZXZlbnQg
aXQNCj4gZnJvbSBiaXRyb3R0aW5nLg0KPiAtLS0NCj4gIHRvb2xzL3Rlc3RzL01ha2VmaWxlIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0cy9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3RzL01ha2Vm
aWxlDQo+IGluZGV4IDMzZTMyNzMwYzQuLmQ5OTE0NmQ1NmEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L3Rlc3RzL01ha2VmaWxlDQo+ICsrKyBiL3Rvb2xzL3Rlc3RzL01ha2VmaWxlDQo+IEBAIC0xMCw3
ICsxMCw3IEBAIFNVQkRJUlMtJChDT05GSUdfWDg2KSArPSB4ODZfZW11bGF0b3INCj4gIGVuZGlm
DQo+ICBTVUJESVJTLXkgKz0geGVuc3RvcmUNCj4gIFNVQkRJUlMteSArPSBkZXByaXYNCj4gLVNV
QkRJUlMtJChDT05GSUdfSEFTX1BDSSkgKz0gdnBjaQ0KPiArU1VCRElSUy15ICs9IHZwY2kNCg0K
SSdtIGFmcmFpZCB0aGlzIGlzIG9ubHkgaGFsZiB0aGUgZml4LsKgIFRoZSBvdGhlciBoYWxmIGlz
Og0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvdnBjaS9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rz
L3ZwY2kvTWFrZWZpbGUNCmluZGV4IDUwNzViYzJiZTI4Yy4uMzM2OTA0OTU4ZjZhIDEwMDY0NA0K
LS0tIGEvdG9vbHMvdGVzdHMvdnBjaS9NYWtlZmlsZQ0KKysrIGIvdG9vbHMvdGVzdHMvdnBjaS9N
YWtlZmlsZQ0KQEAgLTIyLDYgKzIyLDggQEAgZGlzdGNsZWFuOiBjbGVhbg0KwqANCsKgLlBIT05Z
OiBpbnN0YWxsDQrCoGluc3RhbGw6DQorwqDCoMKgwqDCoMKgICQoSU5TVEFMTF9ESVIpICQoREVT
VERJUikkKExJQkVYRUNfQklOKQ0KK8KgwqDCoMKgwqDCoCAkKElOU1RBTExfUFJPRykgJChUQVJH
RVQpICQoREVTVERJUikkKExJQkVYRUNfQklOKQ0KwqANCsKgdnBjaS5jOiAkKFhFTl9ST09UKS94
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KwqDCoMKgwqDCoMKgwqAgIyBSZW1vdmUgaW5jbHVkZXMg
YW5kIGFkZCB0aGUgdGVzdCBoYXJuZXNzIGhlYWRlcg0KDQpzbyBpdCBjYW4gYWN0dWFsbHkgZ2V0
IGRlcGxveWVkIHNvbWV3aGVyZSB1c2VmdWwuDQoNCn5BbmRyZXcNCg==

