Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1070DB46A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2019 21:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKTPZ-0007XS-N9; Sat, 27 Apr 2019 19:55:01 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.41])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <test-bounces@lists.fedoraproject.org>)
 id 1hKTPY-0007XN-Cj
 for xen-devel@lists.xensource.com; Sat, 27 Apr 2019 19:55:00 +0000
Received: from [85.158.142.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 2A/3C-22995-293B4CC5;
 Sat, 27 Apr 2019 19:54:58 +0000
Authentication-Results: mx.messagelabs.com; spf=softfail 
 (server-18.tower-225.messagelabs.com: transitioning domain of 
 lists.fedoraproject.org does not designate 67.231.153.155 as permitted 
 sender) smtp.mailfrom=lists.fedoraproject.org; dkim=pass (good 
 signature) header.i=@onbmc.com header.s=mail; dmarc=fail (p=none sp=none 
 adkim=r aspf=r) header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTe0hTYRT3u3ePmzm5bZanWQSjoJItp0X1R6Q
 EYSRlUvRAyqte3WJOu5uki8homhmamYnPsNIyk16rZhOK7CGVPZyZFlbMMl+haeUjLbqPafnP
 j3PO73fO+X0f30fg8hqpkqBTzDRjpAwqiadoXVdRifqk7WFkQIZdsupD/oA0GIXacxzScLRLr
 DdGJ6ZEiXXfaqOSRhJTapxWcRq6r8tCnoScvIKgricTCUk3gv4WmzQLzSCAXA4N1ic4F8vJLg
 QvhjFBdBiDgao2d2JFcKKxFRM6gsBx3CbmYhEZCK47jSIhXg+OvkG+QUS+wiGr7gwSiAioq3g
 tEpojwd7xxb3aG5q6R91DGXicc1rKNQNZKoaBhlq3yAIT5y+gSdG7mnJ3PRnedn6VCvbycXhe
 /J2fNIPcAvaMcr5BQmqg4FgveziCdbEIPr23cGUZGQ411j5eoiBDoM0+yMc+5HZwdXeJBY0W2
 pzP0eSJj5y95967ADpPvRQLRl0YHM5skXAJzl3xxYq7uKACKCwZ5btJkoQzFXewXBRYzKY4uR
 manvbhxfySWfCk6LNIqIfB2HgDEuIlkG4flwqxP9yylbrri6G8/S6aXid4/VXHsukjubIfXPx
 D/K8uRzOr0apoRh+vMydQeoNaGxCg1mqD1IHqFSs1lEVNaehkdQxtNDMUS2qo/SaNKTUhxhCr
 MdLmG4h9g7H7sNW16FplfD2aS2Cq2bKM7IeRcu/oxNhUHWXS7WGSDbSpHs0jCBXIbl5nuVkMH
 U+nxOkN7EOepIHwUvnINtxgaZkpiUow6eMF6imKIYrOucpwYqKbw/4RDn8c7WCxqu0Ti6XpX1
 jMuc7hzY8cOni8P8SiXGRMNNJKX1kut5nkRuuSjVOLJz+RE81XKmTIw8ND7pVEMwl683S+F/k
 SSKWQ3eYMeumN5il/vax1jLUee6mes26m/lHKNLTT6rPJuazDPBaNr8l5EyZuTv/9Y2NB88Tt
 4a0hPZbs6mDloMJjXmpao3/gg21zXjSnVeItCl1V2UhouyNvx6GuXxHPDja17A19FFZfvS1jr
 SdWXHm89/KzA5d2DP3M1Ktcja0lEZLOqA4me3T3noA4W0+hv2Gh3xatM86yv8Dhm6cSmXSUdi
 nOmKi/DCAQCj8EAAA=
X-Env-Sender: test-bounces@lists.fedoraproject.org
X-Msg-Ref: server-18.tower-225.messagelabs.com!1556394894!2618444!1
X-Originating-IP: [67.231.153.155]
X-SpamReason: No, hits=1.1 required=7.0 tests=newsletters: ,
 DATE_IN_PAST_24_48,HTML_60_70,HTML_MESSAGE,UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5151 invoked from network); 27 Apr 2019 19:54:56 -0000
Received: from mx0b-00030c01.pphosted.com (HELO mx0b-00030c01.pphosted.com)
 (67.231.153.155)
 by server-18.tower-225.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 27 Apr 2019 19:54:56 -0000
Received: from pps.filterd (m0122214.ppops.net [127.0.0.1])
 by mx0a-00030c01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3RJrkwL023896; Sat, 27 Apr 2019 14:54:51 -0500
Received: from chu1x9dlp01.cust.transunion.com ([66.175.240.251])
 by mx0a-00030c01.pphosted.com with ESMTP id 2s4jh9hb0v-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Apr 2019 14:54:51 -0500
X-AuditID: 0adc1a49-5ddff70000000b23-67-5cc4b38af7a0
Received: from cho1w9mx01.corp.transunion.com (chu1w9ap03.cust.transunion.com
 [10.220.26.59])
 by chu1x9dlp01.cust.transunion.com (Symantec Messaging Gateway) with SMTP id
 51.A2.02851.A83B4CC5; Sat, 27 Apr 2019 14:54:50 -0500 (CDT)
Received: from cho3w9mx10.corp.transunion.com (10.216.40.175) by
 cho1w9mx01.corp.transunion.com (10.219.26.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1591.10; Sat, 27 Apr 2019 14:54:50 -0500
Received: from Pickup by CHO3W9MX10.corp.transunion.com with Microsoft SMTP
 Server id 15.1.1591.10; Sat, 27 Apr 2019 19:48:27 +0000
X-Original-To: bzinfra@transunion-qa-mail.onbmc.com
Delivered-To: bzinfra@transunion-qa-mail.onbmc.com
DKIM-Filter: OpenDKIM Filter v2.11.0 chi4-smtp-1.onbmc.com D3BE445A9E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onbmc.com; s=mail;
 t=1556297565; bh=EGVC1ADX204FpUAJVxMNZFOzwczA96xtDiypgjcD6pk=;
 h=References:In-Reply-To:From:Date:Subject:To:CC:Reply-To:List-Id:
 List-Archive:List-Help:List-Post:List-Subscribe:List-Unsubscribe:
 From;
 b=g1s60CaQ9usiPm86gFvdCBnibZ8ygXagpATGgD0FBUsxWGgiIi9C8N7yL3P8g+Zj4
 bzQD16lPQ3/Crk/mRmad5eaUhhA2QVnDN0dxWY/Zr4VOLsz4ueSPu2arqE7g7FeC2o
 dHNh5HGwMVM9fE1ughhLuqRF+aWW2TJlO0jPXM6o=
DKIM-Filter: OpenDKIM Filter v2.11.0 bastion01.phx2.fedoraproject.org
 4D7C26149F99
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 mailman01.phx2.fedoraproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.0
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnTzAx5sHIMaEc7N6xthpcPMFYyjGTRnV5f6kicXV2g=;
 b=pc1OZ2hoPtmfF11vWEaF7lZeuqMjExLM/hKKPdLhEaYBZrP2ObL3TDDgpgPOc30mVW
 E3rTf8Bs0dpTk/jonVfdJgSZ8Fpv1fNLHWt+jm0qmepvemACHMe0Y1gA2CDEir8TPo2T
 SaTtwvfNeyKFS+4cRO9rR4z3lwozMzk271M79j7fZRobblIACD01+lfkKJaZGCs8C0/u
 rDGOyLArJPecjMj5yhxtLgN83NW26wRrSuEGzq/SInrWF2Dlgh59aTCkBkw/Tnjcij9U
 NG9AOMrAhHT8O2PXwIb0Zwo/Y+FwH95IoNdQGNMuj5tY0AUy5WZuRsx+3inbVSJgNEbR
 XMEQ==
X-Gm-Message-State: APjAAAUV9fEPTflIje2wh+vuPA8gbl5Z7O0hQuucXPETNUmKF9T35lH1
 Fy5A17DouzNfFoBrhPDbjew6fXNA/5pY1gz2vOMnvBks
X-Google-Smtp-Source: APXvYqy7fCXytjPmO5GpbqQ/QuCwkW+0Rkh+76KgUouPrAPz7jml2RQndD5JoMyvEXlOeHYw6Tv2mXVcapd/zorDpPc=
X-Received: by 2002:a02:90c6:: with SMTP id c6mr31976375jag.117.1556297544945; 
 Fri, 26 Apr 2019 09:52:24 -0700 (PDT)
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org>
 <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
 <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
In-Reply-To: <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
From: Sumantro Mukherjee <sumukher@redhat.com>
Date: Fri, 26 Apr 2019 22:22:13 +0530
Message-ID: <CAP+TRyNpaQgrg6tFezDHjTHTji+0xN_WQ479-pRx4V6wrARLuw@mail.gmail.com>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Message-ID-Hash: XC7KTKXB54B6NF6XGO2DJE5VGBZSWDPU
X-Message-ID-Hash: XC7KTKXB54B6NF6XGO2DJE5VGBZSWDPU
X-MailFrom: sumukher@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop;
 banned-address; member-moderation; header-match-config-1;
 header-match-config-2; header-match-config-3;
 header-match-test.lists.fedoraproject.org-0; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Archived-At: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/message/XC7KTKXB54B6NF6XGO2DJE5VGBZSWDPU/>
List-Archive: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/>
Content-Type: multipart/mixed; boundary="===============2680138940558073594=="
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=78
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=191 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904260115
X-CrossPremisesHeadersFilteredBySendConnector: cho1w9mx01.corp.transunion.com
X-OrganizationHeadersPreserved: cho1w9mx01.corp.transunion.com
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSa0iTYRjldd+2z9XgdUk9KWWuhCy8LBMNzczAFhRaf4TyNravps2p2zQz
 iJkXcoKUmuYFWyUKa5FsmjpFcV1ENMtLKaaC5VDUDO2CJmru+yTy33kO55znPC8vyRKMsF3I
 BKWGUiklCiGHR/DGXIK8dObX0b66Pp/A2qc2FLiRNcQJzK0Z4gZOlHznhhJikyGfI/7ZsIDE
 TYUWrnjRNkpEEpd5wTJKkZBOqXxC4nny9i+d7BRraoZxIIetRZ1yHXIkAR+Hrpxulg7xSAGe
 QfDSNIKYIccBsqo7CGbIRfDs03O23SLAImj9toYYux9YCsw0T+BjMNnSSzA4HCxziw52M4GH
 WdD2pp6jQySJcDxMl7owmkvQWjNE2GnAMdDW58pE8qGnpIvDYDXcX1qiYwDXsqGgRrulvwXa
 0QBGo4JRo57L4HRo7h3jMJ3LWFDaWE53c8QXoSlPT3fmYG8ozZ9l2XMI7AFfxzPtNB9HgjFn
 jpbswqdhpGmRxs44CiZnptmMRgQjA+/+nZ79uGNrrxvYit+zmZ6Tmw939yNdgoXrEcxXzm85
 AB5WLtMYYwzVNS0O95CoYnNkbS43D/cTFfQSJ+gunyIY/jysrHYhBntCbtMql8FHodFctcUf
 Bv1YO9rOk7T+hcVne6SddoW6dfJ/tR7tMCA3qTxNlHFCpkjxFXlL09Qab41KolSnKROSld7S
 5CQTYr7iuWbUkhdhRZhEwp38A4aiKAFbkq6+mWRFriQh3MOPWZ69IsDXJBrqOkWlUKo4VZqC
 UluRA+nookWy2xv5hWgq7GBHMB9Lf4kbbNlvJ14JExWDxaP+64f8Fi9U1T3qK3Cail0YEjiu
 TdS6B+0zWJ2NnmV7Bz9kRkd7nFqJiD15x5y022ha6gkjRb//uAdsnFneHzc5XhTZFqprcI2d
 eeAW4s/pf5Jouirzmv2RWt8sP7sQ9Ln9xqAhXEio5RLREZZKLfkLq8ptemsDAAA=
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-27_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904270142
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Cc: Konrad Rzeszutek Wilk <konrad@kernel.org>,
 "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2680138940558073594==
Content-Type: multipart/alternative; boundary="00000000000054e768058771c2cb"

--00000000000054e768058771c2cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable

Yup +1 from my side too. Xen is hardly tested since a lot of time.=0D=0A=0D=
=0AOn Fri, Apr 26, 2019 at 10:07 PM Geoffrey Marr <gmarr@redhat.com> wrote:=
=0D=0A=0D=0A> Since F24, I haven't seen or heard of anyone who uses Xen ove=
r KVM=0D=0A> anywhere other than this thread... I'm +1 for making this test=
 an=0D=0A> "Optional" one.=0D=0A>=0D=0A> Geoff Marr=0D=0A> IRC: coremodule=
=0D=0A>=0D=0A>=0D=0A> On Fri, Apr 26, 2019 at 10:33 AM Adam Williamson <=0D=
=0A> adamwill@fedoraproject.org> wrote:=0D=0A>=0D=0A>> On Thu, 2017-07-06 a=
t 13:19 -0700, Adam Williamson wrote:=0D=0A>> > On Thu, 2017-07-06 at 15:59=
 -0400, Konrad Rzeszutek Wilk wrote:=0D=0A>> > > > > I would prefer for it =
to remain as it is.=0D=0A>> > > >=0D=0A>> > > > This is only practical if i=
t's going to be tested, and tested=0D=0A>> regularly=0D=0A>> > > > - not *o=
nly* on the final release candidate, right before we sign=0D=0A>> off=0D=0A=
>> > > > on the release. It needs to be tested regularly throughout the=0D=
=0A>> release=0D=0A>> > > > cycle, on the composes that are "nominated for =
testing".=0D=0A>> > >=0D=0A>> > > Right, which is why I am happy that you h=
ave pointed me to the right=0D=0A>> > > place so I can be up-to-date.=0D=0A=
>> >=0D=0A>> > Great, thanks. So let's leave it as it is for now, but we'll=
 keep an=0D=0A>> > eye on this during F27 cycle. If we get to, say, Beta an=
d there are no=0D=0A>> > results for the test, that's gonna be a problem. T=
hanks!=0D=0A>>=0D=0A>> So, for Fedora 30, this was not tested throughout th=
e whole cycle. I=0D=0A>> think we can consider the proposal to remove the c=
riterion active=0D=0A>> again.=0D=0A>> --=0D=0A>> Adam Williamson=0D=0A>> F=
edora QA Community Monkey=0D=0A>> IRC: adamw | Twitter: AdamW_Fedora | XMPP=
: adamw AT happyassassin . net=0D=0A>> https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__www.happyassassin.net&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385K=
hKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=
=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3DtkysORMNW-748ofRyxj3vDnH=
boyo57BET42l0zODGxA&e=3D=0D=0A>> __________________________________________=
_____=0D=0A>> test mailing list -- test@lists.fedoraproject.org=0D=0A>> To =
unsubscribe send an email to test-leave@lists.fedoraproject.org=0D=0A>> Fed=
ora Code of Conduct: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_getfedora.org_code-2Dof-2Dconduct.html&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385K=
hKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=
=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3D01wvqRnEIiXCy2FlrPNEBGWZ=
SplM1R_uChPBYah8iCM&e=3D=0D=0A>> List Guidelines: https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Mailing-5Flist-5Fguide=
lines&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgIL=
H-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_Ijl=
Yobtmubx4c&s=3DKtxPIxvLN0w-OFmTa6dgOJCgxlVOmnDUz3L-2mUR6B8&e=3D=0D=0A>> Lis=
t Archives:=0D=0A>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
lists.fedoraproject.org_archives_list_test-40lists.fedoraproject.org&d=3DDw=
IBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93=
UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=
=3DeeDmBUOLF8Ot6_riaRXQKMGE_dsuQRN4IaH2GrMDuB0&e=3D=0D=0A>>=0D=0A> ________=
_______________________________________=0D=0A> test mailing list -- test@li=
sts.fedoraproject.org=0D=0A> To unsubscribe send an email to test-leave@lis=
ts.fedoraproject.org=0D=0A> Fedora Code of Conduct: https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__getfedora.org_code-2Dof-2Dconduct.html&d=3D=
DwIBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv=
93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c=
&s=3D01wvqRnEIiXCy2FlrPNEBGWZSplM1R_uChPBYah8iCM&e=3D=0D=0A> List Guideline=
s: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org=
_wiki_Mailing-5Flist-5Fguidelines&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9N=
Tx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1=
pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3DKtxPIxvLN0w-OFmTa6dgOJCgxlVOmnDU=
z3L-2mUR6B8&e=3D=0D=0A> List Archives:=0D=0A> https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.fedoraproject.org_archives_list_test-40list=
s.fedoraproject.org&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr=
5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_v=
UW5ICCSIsm_IjlYobtmubx4c&s=3DeeDmBUOLF8Ot6_riaRXQKMGE_dsuQRN4IaH2GrMDuB0&e=
=3D=0D=0A>=0D=0A=0D=0A=0D=0A-- =0D=0A//sumantro=0D=0AFedora QE=0D=0ATRIED A=
ND PERSONALLY TESTED, ERGO TRUSTED <https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__redhat.com_trusted&d=3DDwIBaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9=
NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a=
1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3D_DsBFQSmQGtoyjrwKctb7JH1fpT4nyO=
vgGpE-pea69E&e=3D>=0D=0A=

--00000000000054e768058771c2cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable

<div dir=3D"ltr"><div>Yup +1 from my side too. Xen is hardly tested since a=
 lot of time.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Apr 26, 2019 at 10:07 PM Geoffrey Marr &lt;<a href=
=3D"mailto:gmarr@redhat.com">gmarr@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Since F2=
4, I haven&#39;t seen or heard of anyone who uses Xen over KVM anywhere oth=
er than this thread... I&#39;m +1 for making this test an &quot;Optional&qu=
ot; one.</div><div><br></div><div><div><div><div dir=3D"ltr" class=3D"gmail=
-m_3882772616034851150gmail_signature"><div dir=3D"ltr"><div>Geoff Marr</di=
v><div></div>IRC: coremodule<br></div></div></div><br></div></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, A=
pr 26, 2019 at 10:33 AM Adam Williamson &lt;<a href=3D"mailto:adamwill@fedo=
raproject.org" target=3D"_blank">adamwill@fedoraproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2017-07-=
06 at 13:19 -0700, Adam Williamson wrote:<br>=0A&gt; On Thu, 2017-07-06 at =
15:59 -0400, Konrad Rzeszutek Wilk wrote:<br>=0A&gt; &gt; &gt; &gt; I would=
 prefer for it to remain as it is.<br>=0A&gt; &gt; &gt; <br>=0A&gt; &gt; &g=
t; This is only practical if it&#39;s going to be tested, and tested regula=
rly<br>=0A&gt; &gt; &gt; - not *only* on the final release candidate, right=
 before we sign off<br>=0A&gt; &gt; &gt; on the release. It needs to be tes=
ted regularly throughout the release<br>=0A&gt; &gt; &gt; cycle, on the com=
poses that are &quot;nominated for testing&quot;.<br>=0A&gt; &gt; <br>=0A&g=
t; &gt; Right, which is why I am happy that you have pointed me to the righ=
t<br>=0A&gt; &gt; place so I can be up-to-date.<br>=0A&gt; <br>=0A&gt; Grea=
t, thanks. So let&#39;s leave it as it is for now, but we&#39;ll keep an<br=
>=0A&gt; eye on this during F27 cycle. If we get to, say, Beta and there ar=
e no<br>=0A&gt; results for the test, that&#39;s gonna be a problem. Thanks=
!<br>=0A<br>=0ASo, for Fedora 30, this was not tested throughout the whole =
cycle. I<br>=0Athink we can consider the proposal to remove the criterion a=
ctive<br>=0Aagain.<br>=0A-- <br>=0AAdam Williamson<br>=0AFedora QA Communit=
y Monkey<br>=0AIRC: adamw | Twitter: AdamW_Fedora | XMPP: adamw AT happyass=
assin . net<br>=0A<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttp-3A__www.happyassassin.net&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0d=
wockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs=
1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3DtkysORMNW-748ofRyxj3vDnHboyo57BET42l=
0zODGxA&e=3D" rel=3D"noreferrer" target=3D"_blank">http://www.happyassassin=
.net</a><br>=0A_______________________________________________<br>=0Atest m=
ailing list -- <a href=3D"mailto:test@lists.fedoraproject.org" target=3D"_b=
lank">test@lists.fedoraproject.org</a><br>=0ATo unsubscribe send an email t=
o <a href=3D"mailto:test-leave@lists.fedoraproject.org" target=3D"_blank">t=
est-leave@lists.fedoraproject.org</a><br>=0AFedora Code of Conduct: <a href=
=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__getfedora.org_co=
de-2Dof-2Dconduct.html&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5v=
Isr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3Wc=
R_vUW5ICCSIsm_IjlYobtmubx4c&s=3D01wvqRnEIiXCy2FlrPNEBGWZSplM1R_uChPBYah8iCM=
&e=3D" rel=3D"noreferrer" target=3D"_blank">https://getfedora.org/code-of-c=
onduct.html</a><br>=0AList Guidelines: <a href=3D"https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Mailing-5Flist-5Fguide=
lines&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgIL=
H-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_Ijl=
Yobtmubx4c&s=3DKtxPIxvLN0w-OFmTa6dgOJCgxlVOmnDUz3L-2mUR6B8&e=3D" rel=3D"nor=
eferrer" target=3D"_blank">https://fedoraproject.org/wiki/Mailing_list_guid=
elines</a><br>=0AList Archives: <a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.fedoraproject.org_archives_list_test-40lists.f=
edoraproject.org&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw=
&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5=
ICCSIsm_IjlYobtmubx4c&s=3DeeDmBUOLF8Ot6_riaRXQKMGE_dsuQRN4IaH2GrMDuB0&e=3D"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.fedoraproject.org/archi=
ves/list/test@lists.fedoraproject.org</a><br>=0A</blockquote></div>=0A_____=
__________________________________________<br>=0Atest mailing list -- <a hr=
ef=3D"mailto:test@lists.fedoraproject.org" target=3D"_blank">test@lists.fed=
oraproject.org</a><br>=0ATo unsubscribe send an email to <a href=3D"mailto:=
test-leave@lists.fedoraproject.org" target=3D"_blank">test-leave@lists.fedo=
raproject.org</a><br>=0AFedora Code of Conduct: <a href=3D"https://urldefen=
se.proofpoint.com/v2/url?u=3Dhttps-3A__getfedora.org_code-2Dof-2Dconduct.ht=
ml&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-v=
nIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYob=
tmubx4c&s=3D01wvqRnEIiXCy2FlrPNEBGWZSplM1R_uChPBYah8iCM&e=3D" rel=3D"norefe=
rrer" target=3D"_blank">https://getfedora.org/code-of-conduct.html</a><br>=
=0AList Guidelines: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__fedoraproject.org_wiki_Mailing-5Flist-5Fguidelines&d=3DDwMFaQ&=
c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vn=
r8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3DKt=
xPIxvLN0w-OFmTa6dgOJCgxlVOmnDUz3L-2mUR6B8&e=3D" rel=3D"noreferrer" target=
=3D"_blank">https://fedoraproject.org/wiki/Mailing_list_guidelines</a><br>=
=0AList Archives: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.fedoraproject.org_archives_list_test-40lists.fedoraproject.o=
rg&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-v=
nIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYob=
tmubx4c&s=3DeeDmBUOLF8Ot6_riaRXQKMGE_dsuQRN4IaH2GrMDuB0&e=3D" rel=3D"norefe=
rrer" target=3D"_blank">https://lists.fedoraproject.org/archives/list/test@=
lists.fedoraproject.org</a><br>=0A</blockquote></div><br clear=3D"all"><br>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><span style=3D"font-family:georgia,serif">//sumantro</sp=
an><br></div><span style=3D"font-family:georgia,serif">Fedora QE</span><br>=
<img src=3D"https://fedoraproject.org/w/uploads/2/2d/Logo_fedoralogo.png" w=
idth=3D"96" height=3D"29"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__redhat.com_trusted&d=3DDwMFaQ&c=3D7gn0PlAmraV3zr-k385KhKAz=
9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3=
a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3D_DsBFQSmQGtoyjrwKctb7JH1fpT4ny=
OvgGpE-pea69E&e=3D" style=3D"text-decoration:none;color:rgb(204,0,0);font-w=
eight:bold" target=3D"_blank"><span style=3D"color:rgb(61,133,198)">TRIED</=
span> <span style=3D"color:rgb(0,0,0)">AND PERSONALLY</span> <span style=3D=
"color:rgb(61,133,198)">TESTED</span><span style=3D"color:rgb(0,0,0)">, ERG=
O</span> <span style=3D"color:rgb(61,133,198)">TRUSTED</span></a></div></di=
v></div></div></div>=0A=

--00000000000054e768058771c2cb--

--===============2680138940558073594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: Quoted-printable

_______________________________________________=0Atest mailing list -- test=
@lists.fedoraproject.org=0ATo unsubscribe send an email to test-leave@lists=
.fedoraproject.org=0AFedora Code of Conduct: https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__getfedora.org_code-2Dof-2Dconduct.html&d=3DDwIGaQ&=
c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vn=
r8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c&s=3D01=
wvqRnEIiXCy2FlrPNEBGWZSplM1R_uChPBYah8iCM&e=3D=0AList Guidelines: https://u=
rldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Mailin=
g-5Flist-5Fguidelines&d=3DDwIGaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vI=
sr5Sw&r=3DF8DgILH-vnIGdxjv93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR=
_vUW5ICCSIsm_IjlYobtmubx4c&s=3DKtxPIxvLN0w-OFmTa6dgOJCgxlVOmnDUz3L-2mUR6B8&=
e=3D=0AList Archives: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__lists.fedoraproject.org_archives_list_test-40lists.fedoraproject.org&d=3D=
DwIGaQ&c=3D7gn0PlAmraV3zr-k385KhKAz9NTx0dwockj5vIsr5Sw&r=3DF8DgILH-vnIGdxjv=
93UP9vnr8eu60CE0D59mXL5aZaU&m=3D5a3a1pkqs1YiP3WcR_vUW5ICCSIsm_IjlYobtmubx4c=
&s=3DeeDmBUOLF8Ot6_riaRXQKMGE_dsuQRN4IaH2GrMDuB0&e=3D=0A=

--===============2680138940558073594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2680138940558073594==--

